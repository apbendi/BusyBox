import Cocoa

class MainWindowController : NSWindowController {

    override var windowNibName: String? {
        return "MainWindowController"
    }

    @IBAction func boxDidCheck(sender: NSButton) {
        if sender.state == NSOnState {
            sender.title = "Uncheck me"
        } else {
            sender.title = "Check Me"
        }
    }

}
