<table>
	<thead>
    	<tr>
      		<th style="text-align:center">日本語</th>
      		<th style="text-align:center"><a href="README-en.md">English</a></th>
    	</tr>
  	</thead>
</table>

# macOS で PLaMo翻訳 CLI を便利に使うためのツール

PLaMo翻訳 CLI をちょっと便利に使うためのツール類です。  
ショートカットや AppleScript などを利用しています。

## セットアップ方法

MacOSにて

1. plamo-translate-cli をインストールします。リンク先をご参照下さい。  
   &emsp; [https://tech.preferred.jp/ja/blog/plamo-translate-cli/](https://tech.preferred.jp/ja/blog/plamo-translate-cli/)  
   &emsp; [https://github.com/pfnet/plamo-translate-cli](https://github.com/pfnet/plamo-translate-cli)

2. 実行ファイル (plamo-translate) のシンボリックリンクを `/usr/local/bin` に作ります。

3. ショートカットを起動し、以下のファイルを読み込みます。  
   &emsp; PLaMo-Translate ON.shortcut  
   &emsp; PLaMo-Translate OFF.shortcut  
   &emsp; Translated with PLaMo.shortcut

4. ログイン時にサーバーを起動させる (オプション) 場合は dev.omonomo.plamo-server.plist を `~/Library/LaunchAgents/` に配置します。

5. [PopClip](https://www.popclip.app) を使う場合は機能拡張をインストールします。PlamoTranslate.popclipext をダブルクリックすることでインストールできます。

## 使い方

PLaMo-Translate ON:  
   &emsp; サーバーを起動。メモリ残量に注意。

PLaMo-Translate OFF:  
   &emsp; サーバーを停止。

Translated with PLaMo:  
   &emsp; テキストを選択後、共有シートやサービスメニューから「Translated with PLaMo」を選択。  
   &emsp; 何も選択していない場合はクリップボードの内容を翻訳します。  
   &emsp; Spotlight 検索から文章を入力して翻訳させることもできます。

PopClip 機能拡張:  
   &emsp; テキストを選択してポップアップメニューから [PL] を選択。

翻訳結果ダイアログで [Copy] を選択すると結果をクリップボードにコピーできます。

## カスタマイズ

ソースコードを直接編集してください。

PLaMo-Translate ON.shortcut:  
dev.omonomo.plamo-server.plist:  
   &emsp; plamo-translate コマンドに `--precision` オプションを付けることで使用モデルを選択できます [4bit, 8bit, bf16] (デフォルト: 4bit)。

Translated with PLaMo.shortcut:  
   &emsp; 変数定義を変更することで翻訳元と翻訳先の言語を指定できます。
```
	set source to "<翻訳元言語>"
	set target to "<翻訳先言語>"
```

## 緊急処置

PLaMo-Translate OFF を使用してもサーバーが終了できなくなった場合、ターミナルを起動して
```
ps aux | grep -E 'PID|plamo-translate'
```
表示されたリストの PID を指定して強制終了させてください。
```
kill -9 <PID>
```

## AppleScript のバグ？

クリップボードにコピーした翻訳結果をすぐに翻訳し直そうとするとエラーが出てしまいます。

## ライセンス

本プログラムコード・ツールのライセンスは The MIT License です。  
ただし plamo-translate-cli や翻訳モデルのライセンスについては別途ご確認をお願いいたします。

