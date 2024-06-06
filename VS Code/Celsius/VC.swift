import UIKit

class ViewController: UIViewController {

    public var celsiusTextField: UITextField!
    public var convertButton: UIButton!
    public var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    public func configureUI() {
        // Add Celsius text field
        celsiusTextField = UITextField()
        celsiusTextField.placeholder = "Enter Celsius"
        celsiusTextField.borderStyle = .roundedRect
        celsiusTextField.translatesAutoresizingMaskIntoConstraints = false
        celsiusTextField.accessibilityIdentifier = "CelsiusTextField" // Set accessibility identifier
        view.addSubview(celsiusTextField)

        // Add convert button
        convertButton = UIButton(type: .system)
        convertButton.setTitle("Convert", for: .normal)
        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        convertButton.accessibilityIdentifier = "ConvertButton" // Set accessibility identifier
        view.addSubview(convertButton)

        // Add result label
        resultLabel = UILabel()
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.accessibilityIdentifier = "ResultLabel" // Set accessibility identifier
        view.addSubview(resultLabel)

        // Setup constraints
        NSLayoutConstraint.activate([
            celsiusTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            celsiusTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            celsiusTextField.widthAnchor.constraint(equalToConstant: 200),
            convertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            convertButton.topAnchor.constraint(equalTo: celsiusTextField.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: convertButton.bottomAnchor, constant: 20)
        ])
    }


    @objc private func convertButtonTapped() {
        guard let celsiusText = celsiusTextField.text, !celsiusText.isEmpty,
              let celsius = Double(celsiusText) else {
            resultLabel.text = "Invalid input"
            return
        }
        let fahrenheit = (celsius * 9/5) + 32
        resultLabel.text = "Fahrenheit: \(fahrenheit)"
    }
}
