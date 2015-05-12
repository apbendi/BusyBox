import Cocoa

class MainWindowController : NSWindowController {

    @IBOutlet weak var sliderStatusLabel: NSTextField!
    @IBOutlet weak var slider: NSSlider!

    var lastSliderValue = 0.0

    override var windowNibName: String? {
        return "MainWindowController"
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        lastSliderValue = slider.doubleValue
        sliderStatusLabel.stringValue = ""
    }

    @IBAction func boxDidCheck(sender: NSButton) {
        if sender.state == NSOnState {
            sender.title = "Uncheck me"
        } else {
            sender.title = "Check Me"
        }
    }

    @IBAction func sliderDidUpdate(sender: NSSlider) {
        if sender.doubleValue > lastSliderValue {
            sliderStatusLabel.stringValue = "Slider Goes Up!"
        } else if sender.doubleValue < lastSliderValue {
            sliderStatusLabel.stringValue = "Slider Goes Down!"
        } else {
            sliderStatusLabel.stringValue = "Slider Stays the same!"
        }

        lastSliderValue = sender.doubleValue
    }

}
