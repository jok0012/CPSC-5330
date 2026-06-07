import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculatorButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        scaleCalculatorButtonText()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scaleCalculatorButtonText()
    }

    private func scaleCalculatorButtonText() {
        guard calculatorButtons != nil else { return }

        for button in calculatorButtons {
            let buttonHeight = button.bounds.height
            let buttonWidth = button.bounds.width
            guard buttonHeight > 0, buttonWidth > 0 else { continue }

            let titleText: String
            if let attributedTitle = button.configuration?.attributedTitle {
                titleText = String(attributedTitle.characters)
            } else {
                titleText = button.currentTitle ?? button.title(for: .normal) ?? ""
            }

            let baseSize = min(buttonHeight * 0.48, buttonWidth * 0.42)
            let fontSize = max(22, min(baseSize, 72))
            let font = UIFont(name: "Helvetica", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)

            var configuration = button.configuration ?? UIButton.Configuration.filled()
            var attributes = AttributeContainer()
            attributes.font = font
            configuration.attributedTitle = AttributedString(titleText, attributes: attributes)
            button.configuration = configuration

            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.45
            button.titleLabel?.lineBreakMode = .byClipping
        }
    }
}
