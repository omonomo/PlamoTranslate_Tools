<table>
	<thead>
    	<tr>
      		<th style="text-align:center"><a href="README.md">日本語</a></th>
      		<th style="text-align:center">English</th>
    	</tr>
  	</thead>
</table>

# Tools for Enhancing PLaMo-Translate CLI Functionality

This collection of tools aims to improve PLaMo-Translate CLI functionality.  
Utilizes Shortcuts and AppleScript implementations.

## Setup Instructions

For macOS:

1. Install plamo-translate-cli. Refer to the provided link for details.  
   &emsp; [https://tech.preferred.jp/ja/blog/plamo-translate-cli/](https://tech.preferred.jp/ja/blog/plamo-translate-cli/)
   &emsp; [https://github.com/pfnet/plamo-translate-cli](https://github.com/pfnet/plamo-translate-cli)

2. Create a symbolic link for executable file (plamo-translate) in `/usr/local/bin`.

3. Launch the Shortcuts and load the following files:  
   &emsp; PLaMo-Translate ON.shortcut  
   &emsp; PLaMo-Translate OFF.shortcut  
   &emsp; Translated with PLaMo.shortcut

4. To automatically launch the server on login (optional), place dev.omonomo.plamo-server.plist in `~/Library/LaunchAgents/`.

5. To use [PopClip](https://www.popclip.app), install the extension. Double-click PlamoTranslate.popclipext to install it.

## Usage Instructions

PLaMo-Translate ON:  
   &emsp; Launch the server. Be mindful of available memory.

PLaMo-Translate OFF:  
   &emsp; Stop the server.

Translated with PLaMo:  
   &emsp; Select text, then choose "Translated with PLaMo" from the Share sheet or Service menu.  
   &emsp; If no text is selected, the tool will translate the Clipboard content.  
   &emsp; You can also enter text through Spotlight search to have the tool translate it.  

PopClip Extension:  
   &emsp; Select text and choose [PL] from the pop-up menu.

Selecting [Copy] in the translation results dialog allows you to copy the results to the Clipboard.

## Customization

Please modify the source code directly.

PLaMo-Translate ON.shortcut:  
dev.omonomo.plamo-server.plist:  
   &emsp; You can select the model to use by appending the `--precision` option to the plamo-translate command [4bit, 8bit, bf16] (default: 4bit).

Translated with PLaMo.shortcut:  
   &emsp; By modifying the variable definition, you can specify the source and target languages for translation.
```
	set source to "<SOURCE LANGUAGE>"
	set target to "<TARGET LANGUAGE>"
```

## Emergency Procedures

If the server remains unresponsive even after using PLaMo-Translate OFF, open a terminal and execute:
```
ps aux | grep -E 'PID|plamo-translate'
```
Then force-terminate the server using the PID values from the displayed list.
```
kill -9 <PID>
```

## AppleScript Bug?

When attempting to immediately translate the clipboard content after translation, the tool may produce an error.

## License

The source code and tools are licensed under The MIT License.  
However, please verify the licenses for plamo-translate-cli and the translation models separately.

---

* The English translation was generated using the plamo-translate CLI, with minor manual adjustments made afterward.
