import UIKit

class ViewController: UIViewController {
    enum DivisionError: Error {
        case divisionByZero
        case invalidInput
    }
    // UI Elements
    var dividendTextField: UITextField!
    var divisorTextField: UITextField!
    var resultLabel: UILabel!
    var divideButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Initialize UI elements
        setUpUI()
    }

    func setUpUI() {
        // Initialize and set properties for the dividend text field
        dividendTextField = UITextField()
        dividendTextField.placeholder = "Enter dividend"
        dividendTextField.borderStyle = .roundedRect
        dividendTextField.keyboardType = .decimalPad
        dividendTextField.translatesAutoresizingMaskIntoConstraints = false

        // Initialize and set properties for the divisor text field
        divisorTextField = UITextField()
        divisorTextField.placeholder = "Enter divisor"
        divisorTextField.borderStyle = .roundedRect
        divisorTextField.keyboardType = .decimalPad
        divisorTextField.translatesAutoresizingMaskIntoConstraints = false

        // Initialize and set properties for the result label
        resultLabel = UILabel()
        resultLabel.text = "Result: "
        resultLabel.translatesAutoresizingMaskIntoConstraints = false

        // Initialize and set properties for the divide button
        divideButton = UIButton(type: .system)
        divideButton.setTitle("Divide", for: .normal)
        divideButton.addTarget(self, action: #selector(divideButtonTapped), for: .touchUpInside)
        divideButton.translatesAutoresizingMaskIntoConstraints = false

        // Add subviews to the main view
        view.addSubview(dividendTextField)
        view.addSubview(divisorTextField)
        view.addSubview(resultLabel)
        view.addSubview(divideButton)

        // Set up Auto Layout constraints
        NSLayoutConstraint.activate([
            // Position the dividend text field
            dividendTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            dividendTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividendTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Position the divisor text field
            divisorTextField.topAnchor.constraint(equalTo: dividendTextField.bottomAnchor, constant: 20),
            divisorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divisorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Position the divide button
            divideButton.topAnchor.constraint(equalTo: divisorTextField.bottomAnchor, constant: 20),
            divideButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Position the result label
            resultLabel.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // Method to perform division and handle errors
    @objc func divideButtonTapped() {
        do {
            let result = try performDivision()
            resultLabel.text = "Result: \(result)"
        } catch DivisionError.divisionByZero {
            resultLabel.text = "Error: Division by zero is not allowed."
        } catch DivisionError.invalidInput {
            resultLabel.text = "Error: Invalid input. Please enter numbers."
        } catch {
            resultLabel.text = "Error: \(error.localizedDescription)"
        }
    }

    // Function to perform division
    func performDivision() throws -> Double {
        // Validate input
        guard let dividendText = dividendTextField.text,
              let dividend = Double(dividendText),
              let divisorText = divisorTextField.text,
              let divisor = Double(divisorText) else {
            throw DivisionError.invalidInput
        }

        // Check for division by zero
        if divisor == 0 {
            throw DivisionError.divisionByZero
        }

        // Perform division
        return dividend / divisor
    }
}
