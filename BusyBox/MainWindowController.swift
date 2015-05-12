import Cocoa

class MainWindowController : NSWindowController {

    @IBOutlet weak var sliderStatusLabel: NSTextField!
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var hideTicksRadio: NSButton!
    @IBOutlet weak var secureTextField: NSSecureTextField!
    @IBOutlet weak var revealTextField: NSTextField!
    @IBOutlet weak var checkBox: NSButton!

    //lazy let initialSliderValue: Double // Why can't I?
    private var initialSliderValue = 0.0
    private var lastSliderStored = 0.0

    var showTickMarks: Bool {
        set {
            if newValue {
                slider.numberOfTickMarks = 10
                hideTicksRadio.state = NSOffState
            } else {
                slider.numberOfTickMarks = 0
                hideTicksRadio.state = NSOnState
            }
        }
        get {
            return slider.numberOfTickMarks == 0
        }
    }

    var lastSliderValue: Double {
        set {
            if newValue > lastSliderStored {
                sliderStatusLabel.stringValue = "Slider Goes Up!"
            } else if newValue < lastSliderStored {
                sliderStatusLabel.stringValue = "Slider Goes Down!"
            } else {
                sliderStatusLabel.stringValue = "Slider Stays the Same"
            }

            lastSliderStored = newValue
        }
        get {
            return lastSliderStored
        }
    }

    var isChecked: Bool {
        set {
            if newValue {
                checkBox.state = NSOnState
                checkBox.title = "Uncheck Me"
            } else {
                checkBox.state = NSOffState
                checkBox.title = "Check Me"
            }
        }
        get {
            return checkBox.state == NSOnState
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
        isChecked = (sender.state == NSOnState)
    }

    @IBAction func sliderDidUpdate(sender: NSSlider) {
        lastSliderValue = sender.doubleValue
    }

    @IBAction func radioButtonDidPush(sender: NSButton) {
        showTickMarks = (sender.tag == 0)
    }

    @IBAction func revealButtonDidPress(sender: NSButton) {
        revealTextField.stringValue = secureTextField.stringValue
    }

    @IBAction func resetButtonDidPress(sender: NSButton) {
        showTickMarks = false
        isChecked = true

        resetSliderAndStatus()
        resetTextFields()
    }

    private func resetSliderAndStatus() {
        slider.doubleValue = initialSliderValue
        sliderStatusLabel.stringValue = ""
    }

    private func resetTextFields() {
        secureTextField.stringValue = ""
        revealTextField.stringValue = ""
    }
}
