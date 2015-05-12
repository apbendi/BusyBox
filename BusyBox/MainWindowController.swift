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

    var showTickMarks: Bool {
        set {
            if newValue {
                slider.numberOfTickMarks = 10
            } else {
                slider.numberOfTickMarks = 0
            }
        }
        get {
            return slider.numberOfTickMarks == 0
        }
    }

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
        showTickMarks = (sender.tag == 0)
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
