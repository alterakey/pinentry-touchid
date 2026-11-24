// Secure text fields made pasteable
// based on idea of https://github.com/jundot/omlx/commit/f1f3f26f3fc0a20b65cbbdf1363abefe722ccab7
import AppKit

class PasteableSecureTextField: NSSecureTextField {
  // NSSecureTextField subclass that supports Cmd+V paste.
  // This subclass intercepts Cmd+V and reads from the system pasteboard.
  override func performKeyEquivalent(with: NSEvent) -> Bool {
    if with.modifierFlags.contains(.command) {
      let chars = with.charactersIgnoringModifiers
      if chars == "v" {
        let string = NSPasteboard.general.string(forType: .string)
        if string != nil {
          self.stringValue = string!
          return true
        }
      }
    }
    return super.performKeyEquivalent(with: with)
  }
}
