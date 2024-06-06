import UIKit

class ViewController: UIViewController {

    public var lengthTextField: UITextField!
    public var widthTextField: UITextField!
    public var calculateButton: UIButton!
    public var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    public func configureUI() {
        // Add length text field
        lengthTextField = UITextField()
        lengthTextField.placeholder = "Enter length"
        lengthTextField.borderStyle = .roundedRect
        lengthTextField.translatesAutoresizingMaskIntoConstraints = false
        lengthTextField.accessibilityIdentifier = "LengthTextField" // Set accessibility identifier
        view.addSubview(lengthTextField)

        // Add width text field
        widthTextField = UITextField()
        widthTextField.placeholder = "Enter width"
        widthTextField.borderStyle = .roundedRect
        widthTextField.translatesAutoresizingMaskIntoConstraints = false
        widthTextField.accessibilityIdentifier = "WidthTextField" // Set accessibility identifier
        view.addSubview(widthTextField)

        // Add calculate button
        calculateButton = UIButton(type: .system)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.accessibilityIdentifier = "CalculateButton" // Set accessibility identifier
        view.addSubview(calculateButton)

        // Add result label
        resultLabel = UILabel()
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.accessibilityIdentifier = "ResultLabel" // Set accessibility identifier
        view.addSubview(resultLabel)


        // Setup constraints
        NSLayoutConstraint.activate([
            lengthTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lengthTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            lengthTextField.widthAnchor.constraint(equalToConstant: 200),
            widthTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            widthTextField.topAnchor.constraint(equalTo: lengthTextField.bottomAnchor, constant: 20),
            widthTextField.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.topAnchor.constraint(equalTo: widthTextField.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20)
        ])
    }

    @objc private func calculateButtonTapped() {
        guard let lengthText = lengthTextField.text, !lengthText.isEmpty,
              let widthText = widthTextField.text, !widthText.isEmpty,
              let length = Double(lengthText),
              let width = Double(widthText) else {
            resultLabel.text = "Invalid input"
            return
        }
        let area = length * width
        resultLabel.text = "Area: \(area)"
    }
}
