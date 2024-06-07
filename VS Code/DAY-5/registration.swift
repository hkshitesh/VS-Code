import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UI Elements
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let datePicker = UIDatePicker()
    let toggleSwitch = UISwitch()
    let genderPickerView = UIPickerView()
    let dropdownButton = UIButton(type: .system)
    let registerButton = UIButton(type: .system)
    
    
    let genderOptions = ["Select Gender","Male", "Female", "Non-binary", "Other"]
    var selectedGender: String?
    
    let dropdownOptions = ["Under Graduate", "Post Graduate", "Doctrate"]
    var selectedOption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        // Configure Name TextField
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        // Configure Email TextField
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        // Configure Password TextField
        passwordTextField.placeholder = "Password"
        //passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        let titleLabel = UILabel()
        titleLabel.text = "Select DOB"
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Configure DatePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        // Configure Toggle Switch
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toggleSwitch)
        
        // Configure Gender PickerView
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderPickerView)
        
        // Configure Dropdown Button
        dropdownButton.setTitle("Highest Qualification", for: .normal)
        dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dropdownButton)
        
        // Configure Register Button
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Name TextField Constraints
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Email TextField Constraints
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password TextField Constraints
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // DatePicker Constraints
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            // Toggle Switch Constraints
            toggleSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleSwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            
            // Gender PickerView Constraints
            genderPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderPickerView.topAnchor.constraint(equalTo: toggleSwitch.bottomAnchor, constant: 20),
            genderPickerView.widthAnchor.constraint(equalToConstant: 300),
            genderPickerView.heightAnchor.constraint(equalToConstant: 100),
            
            // Dropdown Button Constraints
            dropdownButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropdownButton.topAnchor.constraint(equalTo: genderPickerView.bottomAnchor, constant: 20),
            dropdownButton.widthAnchor.constraint(equalToConstant: 200),
            dropdownButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Register Button Constraints
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 30),
            registerButton.widthAnchor.constraint(equalToConstant: 100),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func registerButtonTapped() {
        // Handle registration logic here
        
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Please enter your name.")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty, isValidEmail(email) else {
            showAlert(message: "Please enter a valid email address.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty, password.count >= 6 else {
            showAlert(message: "Password must be at least 6 characters long.")
            return
        }
        
        let birthDate = datePicker.date
        let isSubscribed = toggleSwitch.isOn
        let selectedGender = genderOptions[genderPickerView.selectedRow(inComponent: 0)]
        let selectedOption = self.selectedOption ?? "None"
        
        print("Name: \(name)")
        print("Email: \(email)")
        print("Password: \(password)")
        print("Birthdate: \(birthDate)")
        print("Subscribed: \(isSubscribed ? "Yes" : "No")")
        print("Gender: \(selectedGender)")
        print("Option: \(selectedOption)")
        
        showAlert(message: "Registration Successful\n\n" +
            "Name: \(name)\n" +
            "Email: \(email)\n" +
            "Password: \(password)\n" +
            "Birthdate: \(formattedDate(birthDate))\n" +
            "Subscribed: \(isSubscribed ? "Yes" : "No")\n" +
            "Gender: \(selectedGender)\n" +
            "Option: \(selectedOption)")
    }
    
    @objc func dropdownButtonTapped() {
        let alertController = UIAlertController(title: "Select Option", message: nil, preferredStyle: .actionSheet)
        
        for option in dropdownOptions {
            let action = UIAlertAction(title: option, style: .default) { _ in
                self.selectedOption = option
                self.dropdownButton.setTitle(option, for: .normal)
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    // UIPickerView DataSource and Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderOptions[row]
    }
}
