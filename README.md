# KeebMangler

A simple tool to do the basic keyboard configuration tasks that Windows can't easily do.

* Map <kbd>CapsLock</kbd> to <kbd>Hyper</kbd>, to finally make good use of that pointless key.
* Map <kbd>Right Alt</kbd> to <kbd>AltGr</kbd>, to allow using international keyboard layouts with a PC104 keyboard.
* Map <kbd>Left Command</kbd> to <kbd>Alt</kbd>, <kbd>Left Option</kbd> to <kbd>Win</kbd>, <kbd>Right Command</kbd> to <kbd>Alt</kbd> (or <kbd>AltGr</kbd>), and <kbd>Right Option</kbd> to <kbd>Menu</kbd>, to make Apple keyboards actually conform to the established standard every other OS expects.
* `xev`-like event spy using a tooltip that follows your mouse cursor.

Windows cannot add more modifier keys, but it doesn't mean you can't bind combinations of existing modifiers under a single key press. KeebMangler binds <kbd>Hyper</kbd> as <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>Shift</kbd><kbd>Win</kbd>, which is guaranteed to not collide with any existing shortcuts.

Configuration is persistently stored in `%APPDATA%/keebmangler.ini`.

This tool has been made possible by [AutoHotKey](https://www.autohotkey.com/).

**How to defeat the <kbd>Office</kbd> key**: Explorer automatically binds <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>Shift</kbd><kbd>Win</kbd> (aka what most people bind to <kbd>Hyper</kbd>, including KeebMangler) to <kbd>Office</kbd>. [ExplorerPatcher](https://github.com/valinet/ExplorerPatcher) now implements the ability to block Explorer from binding it, leaving it free to be used by you.

Behold the [official Office key docs](https://support.microsoft.com/en-us/topic/using-the-office-key-df8665d3-761b-4a16-84b8-2cfb830e6aff), and notice the lack of justification on why Microsoft thought this was a good idea, or why they think we needed dedicated LinkedIn or Yammer keys.
