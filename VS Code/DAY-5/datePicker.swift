import UIKit

class ViewController: UIViewController {
    
    // UI Elements
    let datePicker = UIDatePicker()
    let selectedDateLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }

    func setupUI() {
        // Configure DatePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact // Use wheels style for better visibility
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
        
        // Configure Label to Display Selected Date
        selectedDateLabel.text = "Selected Date:"
        selectedDateLabel.textAlignment = .center
        selectedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectedDateLabel)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // DatePicker Constraints
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Label Constraints
            selectedDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedDateLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            selectedDateLabel.widthAnchor.constraint(equalToConstant: 300),
            selectedDateLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let selectedDate = dateFormatter.string(from: sender.date)
        selectedDateLabel.text = "Selected Date: \(selectedDate)"
    }
}
