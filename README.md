# KeebMangler

A simple tool to do the basic keyboard configuration tasks that Windows can't easily do.

* Map <kbd>CapsLock</kbd> to <kbd>Hyper</kbd>, to finally make good use of that pointless key.
* Map <kbd>Right Alt</kbd> to <kbd>AltGr</kbd>, to allow using international keyboard layouts with a PC104 keyboard.
* Map <kbd>Left Command</kbd> to <kbd>Alt</kbd>, <kbd>Left Option</kbd> to <kbd>Super</kbd>, <kbd>Right Command</kbd> to <kbd>Alt</kbd> (or <kbd>AltGr</kbd>), and <kbd>Right Option</kbd> to <kbd>Menu</kbd>, to make Apple keyboards actually confirm to the established standard every other OS expects.
* `xev`-like event spy using a tooltip that follows your mouse cursor.

Windows cannot add more modifier keys, but it doesn't mean you can't bind combinations of existing modifiers under a single key press. KeebMangler binds <kbd>Hyper</kbd> as <kbd>Ctrl</kbd><kbd>Super</kbd>, which allows, for example, shadowing of the existing Windows shortcuts for virtual desktops.

Configuration is persistently stored in `%APPDATA%/keebmangler.ini`.

This tool has been made possible by [AutoHotKey](https://www.autohotkey.com/).
