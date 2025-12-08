set source to "{popclip option source}" -- 翻訳元言語
set target to "{popclip option target}" -- 翻訳先言語
set input to "{popclip text}" -- 入力テキスト
set configPath to "/tmp" -- 設定ファイルの保存先
set configFile to configPath & "/plamo-translate-config.json" -- 設定ファイル

set isRunning to false
try -- サーバーが起動しているか確認
	do shell script "pgrep -f 'plamo-translate server'"
	set isRunning to true
end try

if isRunning is false then -- サーバーが起動していなければ起動
	do shell script "shortcuts run 'PLaMo-Translate ON'" -- ファイル名注意
end if

try -- ポート番号取得
	set portNumber to do shell script "sed -n 's/.*\"port\": *\\([0-9]*\\).*/\\1/p' " & quoted form of configFile
	set portNumber to portNumber as integer
on error errMsg -- ポート番号が取得できなかった場合
	display dialog "Error reading config: " & errMsg buttons {"OK"} default button "OK" with icon stop
	error number -128
end try

set isReady to false
repeat 30 times -- サーバーの準備が出来ているか確認
	try
		set httpStatus to do shell script "curl -s -o /dev/null -w '%{http_code}' http://localhost:" & portNumber
		if httpStatus is "200" or httpStatus is "404" then
			set isReady to true
			exit repeat
		end if
	end try
	delay 0.5
end repeat

if isReady is false then -- サーバーが応答しない場合
	display dialog "Server not responding on port " & portNumber buttons {"OK"} default button "OK" with icon stop
	error number -128
end if

try -- 翻訳実行
	set translateResult to do shell script "export TMPDIR=" & quoted form of configPath & "; /usr/local/bin/plamo-translate --from " & quoted form of source & " --to " & quoted form of target & " --input " & quoted form of input
	set dialogResult to display dialog translateResult buttons {"Copy", "OK"} default button "OK"

	if button returned of dialogResult is "Copy" then -- "Copy" の場合クリップボードにコピー
		set the clipboard to translateResult
	end if

on error errMsg -- 翻訳コマンドでエラーが発生した場合
	display dialog "Translation error: " & errMsg buttons {"OK"} default button "OK" with icon stop
	error number -128
end try
