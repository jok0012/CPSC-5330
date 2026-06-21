import UIKit

class AdventureView: UIView {
    let backgroundImageView = UIImageView()
    let mainStackView = UIStackView()
    let storyLabel = UILabel()
    let textBackgroundBox = UIView()
    let choice1Button = UIButton(type: .system)
    let choice2Button = UIButton(type: .system)
    let flexibleSpacer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        
        textBackgroundBox.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        textBackgroundBox.layer.cornerRadius = 15
        textBackgroundBox.translatesAutoresizingMaskIntoConstraints = false
        textBackgroundBox.setContentHuggingPriority(.defaultHigh, for: .vertical)

        storyLabel.textColor = .white
        storyLabel.font = .systemFont(ofSize: 25, weight: .bold)
        storyLabel.numberOfLines = 0
        storyLabel.textAlignment = .left
        storyLabel.adjustsFontSizeToFitWidth = true
        storyLabel.minimumScaleFactor = 0.6
        storyLabel.translatesAutoresizingMaskIntoConstraints = false

        textBackgroundBox.addSubview(storyLabel)

        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalTo: textBackgroundBox.topAnchor, constant: 15),
            storyLabel.bottomAnchor.constraint(equalTo: textBackgroundBox.bottomAnchor, constant: -15),
            storyLabel.leadingAnchor.constraint(equalTo: textBackgroundBox.leadingAnchor, constant: 15),
            storyLabel.trailingAnchor.constraint(equalTo: textBackgroundBox.trailingAnchor, constant: -15)
        ])

        choice1Button.setTitleColor(.white, for: .normal)
        choice1Button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        choice1Button.backgroundColor = .systemPurple.withAlphaComponent(0.8)
        choice1Button.layer.cornerRadius = 20
        choice1Button.tag = 1
        choice1Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        choice1Button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        choice2Button.setTitleColor(.white, for: .normal)
        choice2Button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        choice2Button.backgroundColor = .systemPink.withAlphaComponent(0.8)
        choice2Button.layer.cornerRadius = 20
        choice2Button.tag = 2
        choice2Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        choice2Button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(textBackgroundBox)
        mainStackView.addArrangedSubview(flexibleSpacer)
        mainStackView.addArrangedSubview(choice1Button)
        mainStackView.addArrangedSubview(choice2Button)
        
        addSubview(mainStackView)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    
    }
}
