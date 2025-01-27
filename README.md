# Cursor IDE Drop Target Fix for the macOS Dock Icon

[![macOS](https://img.shields.io/badge/-macOS-white?&logo=apple&logoColor=black)](https://www.apple.com/macos)
[![Shell Script](https://img.shields.io/badge/Shell_Script-121011?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://ke.mit-license.org/)
[![Twitter: der_abro](https://img.shields.io/badge/-@der__abro-1DA1F2?logo=x&logoColor=white)](https://x.com/der_abro)

Enable drag & drop folder support for Cursor IDE on macOS. This fixes a known limitation where folders cannot be opened by dropping them onto the Cursor IDE dock icon (unlike VSCode, Windsurf, and other editors where this works out of the box).


## Features

- Enables dropping folders onto Cursor IDE's dock icon
- No modifications to Cursor's core files
- Easily reversible


## Requirements

- macOS (tested on macOS Ventura and newer)
- Cursor IDE installed in `/Applications`
- Administrator privileges (for installation)


## Installation

1. Clone this repository:
```bash
git clone https://github.com/Abromeit/cursor-droptarget-fix.git
cd cursor-droptarget-fix
```

2. Run the installation script:
```bash
sudo ./setup_cursor_integration.sh
```

3. Close running Cursor instances. Then try dropping a directory onto the Dock icon. If it doesn't work, please restart your Mac.


## What it Does

The script performs the following tasks:
- Adds proper folder handling capabilities to Cursor, by editing an existing plist file within the Cursor App.
- Cursor's original Info.plist file is backed up
- Updates Finder and Dock to recognize the new capabilities


## Uninstallation

To revert changes:

Restore the original Info.plist:
```bash
sudo cp /Applications/Cursor.app/Contents/Info.plist.backup /Applications/Cursor.app/Contents/Info.plist
```


## Related Issues

This is a known issue that has been discussed in various places:

- [Folder drag and drop dock icon support](https://forum.cursor.com/t/folder-drag-and-drop-dock-icon-support/509/23) (Cursor Forum)
- [Can't drag folder onto Cursor icon (works with VSCode)](https://forum.cursor.com/t/cant-drag-folder-onto-cursor-icon-works-with-vscode/16594) (Cursor Forum)
- [Drag and drop folder to dock icon not working](https://github.com/getcursor/cursor/issues/586) (GitHub Issue)
- [Drag and drop folder to dock icon not working on macOS](https://github.com/getcursor/cursor/issues/894) (GitHub Issue)
- [Drag and drop folder to dock icon not working on macOS](https://github.com/getcursor/cursor/issues/989) (GitHub Issue)
- [Drag and drop folder to dock icon not working on macOS](https://github.com/getcursor/cursor/issues/2343) (GitHub Issue)
- [Drag and drop folder to dock icon not working on macOS](https://github.com/getcursor/cursor/issues/1110) (GitHub Issue)


## License

This project is licensed under the MIT License - see https://ke.mit-license.org/ for details.
