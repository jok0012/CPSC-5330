import UIKit

class ViewController: UIViewController {
    let liveMoodLabel = UILabel()
    let moodSlider = UISlider()
    let datePicker = UIDatePicker()
    let saveButton = UIButton(type: .system)
    let savedEntryLabel = UILabel()
    var currentEmoji = "😢"
    let gradientLayer = CAGradientLayer()
    let scrollView = UIScrollView()
    let contentView = UIView()
    var topStackView: UIStackView!
    var mainStackView: UIStackView!
    var mainLeadingConstraint: NSLayoutConstraint!
    var mainTrailingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupUI()
        updateDatePickerStyle(for: view.bounds.size)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.updateDatePickerStyle(for: size)
        }, completion: nil)
    }

    func updateDatePickerStyle(for size: CGSize) {
        if #available(iOS 14.0, *) {
            if size.height > size.width { // Portrait
                datePicker.preferredDatePickerStyle = .inline
                topStackView.spacing = 30
                mainStackView.spacing = 30
                mainLeadingConstraint?.constant = 40
                mainTrailingConstraint?.constant = -40
            }
            else { // Landscape
                datePicker.preferredDatePickerStyle = .compact
                topStackView.spacing = 10
                mainStackView.spacing = 10
                mainLeadingConstraint?.constant = 100
                mainTrailingConstraint?.constant = -100
            }
            view.layoutIfNeeded()
        }
    }

    func setupGradientBackground() {
        let topColor = UIColor.systemPurple.cgColor
        let bottomColor = UIColor.systemRed.cgColor
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        liveMoodLabel.text = "Tell us how you feel!"
        liveMoodLabel.textAlignment = .center
        liveMoodLabel.font = .systemFont(ofSize: 28, weight: .bold)
        liveMoodLabel.textColor = .white
        liveMoodLabel.adjustsFontSizeToFitWidth = true
        liveMoodLabel.minimumScaleFactor = 0.5
        moodSlider.minimumValue = 0
        moodSlider.maximumValue = 100
        moodSlider.value = 0
        moodSlider.minimumTrackTintColor = UIColor.white.withAlphaComponent(0.7)
        moodSlider.maximumTrackTintColor = UIColor.white.withAlphaComponent(0.2)
        moodSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        if #available(iOS 14.0, *) {
            datePicker.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            datePicker.layer.cornerRadius = 12
            datePicker.clipsToBounds = true
        }
        saveButton.setTitle("Save Mood", for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 10
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        savedEntryLabel.text = ""
        savedEntryLabel.textAlignment = .center
        savedEntryLabel.numberOfLines = 0
        savedEntryLabel.font = .systemFont(ofSize: 22, weight: .bold)
        savedEntryLabel.textColor = .white
        savedEntryLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let datePickerContainer = UIView()
        datePickerContainer.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePickerContainer.addSubview(datePicker)
        let isPad = UIDevice.current.userInterfaceIdiom == .pad
        if isPad { datePicker.transform = CGAffineTransform(scaleX: 1.4, y: 1.4) }
        let verticalPadding: CGFloat = isPad ? 70 : 0
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: datePickerContainer.topAnchor, constant: verticalPadding),
            datePicker.bottomAnchor.constraint(equalTo: datePickerContainer.bottomAnchor, constant: -verticalPadding),
            datePicker.centerXAnchor.constraint(equalTo: datePickerContainer.centerXAnchor)
        ])
        topStackView = UIStackView(arrangedSubviews: [liveMoodLabel, moodSlider, datePickerContainer])
        topStackView.axis = .vertical
        topStackView.alignment = .fill
        let bottomStackView = UIStackView(arrangedSubviews: [saveButton, savedEntryLabel])
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 15
        bottomStackView.alignment = .fill
        let flexibleSpacer = UIView()
        mainStackView = UIStackView(arrangedSubviews: [topStackView, flexibleSpacer, bottomStackView])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.heightAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
        ])
        mainLeadingConstraint = mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        mainTrailingConstraint = mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        mainLeadingConstraint.isActive = true
        mainTrailingConstraint.isActive = true
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        let moodDescription: String
        switch value {
            case 0...20: moodDescription = "Very Sad"; currentEmoji = "😢"
            case 21...40: moodDescription = "Sad"; currentEmoji = "🙁"
            case 41...60: moodDescription = "Neutral"; currentEmoji = "😐"
            case 61...80: moodDescription = "Happy"; currentEmoji = "🙂"
            case 81...100: moodDescription = "Very Happy"; currentEmoji = "😄"
            default: moodDescription = "Neutral"; currentEmoji = "😐"
        }
        liveMoodLabel.text = "Feeling: \(moodDescription) \(currentEmoji)"
    }

    @objc func saveButtonTapped() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        let selectedDateString = formatter.string(from: datePicker.date)
        savedEntryLabel.text = "On \(selectedDateString), you felt \(currentEmoji)"
    }
}
