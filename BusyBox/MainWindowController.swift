import Cocoa

class MainWindowController : NSWindowController {

    @IBOutlet weak var sliderStatusLabel: NSTextField!
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var hideTicksRadio: NSButton!
    @IBOutlet weak var secureTextField: NSSecureTextField!
    @IBOutlet weak var revealTextField: NSTextField!
    @IBOutlet weak var checkBox: NSButton!

    //lazy let initialSliderValue: Double // Why can't I?
    var initialSliderValue = 0.0
    var lastSliderValue = 0.0

    override var windowNibName: String? {
        return "MainWindowController"
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        lastSliderValue = slider.doubleValue
        initialSliderValue = slider.doubleValue
        sliderStatusLabel.stringValue = ""
        hideTicksRadio.state = NSOnState
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

    @IBAction func radioButtonDidPush(sender: NSButton) {
        switch (sender.tag)  {
        case 0:
            slider.numberOfTickMarks = 10
        case 1:
            slider.numberOfTickMarks = 0
        default:
            println("Invalid Selection")
        }
    }

    @IBAction func revealButtonDidPress(sender: NSButton) {
        revealTextField.stringValue = secureTextField.stringValue
    }

    @IBAction func resetButtonDidPress(sender: NSButton) {
        slider.doubleValue = initialSliderValue
        slider.numberOfTickMarks = 0
        sliderStatusLabel.stringValue = ""
        hideTicksRadio.state = NSOnState
        secureTextField.stringValue = ""
        revealTextField.stringValue = ""
        checkBox.state = NSOnState
        checkBox.title = "Uncheck Me"
    }
}
