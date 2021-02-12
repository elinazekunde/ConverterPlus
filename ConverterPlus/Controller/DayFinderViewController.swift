//
//  ViewController.swift
//  ConverterPlus
//
//  Created by Elīna Zekunde on 10/02/2021.
//

import UIKit

class DayFinderViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func findWeekdayTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
            warningPopup(withTitle: "Input Error!", withMessage: "Date Text Fields can't be empty.")
            return
        }
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                resultLabel.text = capitalizedWeekday
            } else {
                warningPopup(withTitle: "Wrong Date!", withMessage: "Please enter the correct Date.")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearAllTextFields()
        }
    }
    
    func clearAllTextFields(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of the week"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func warningPopup(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            popUp.addAction(okButton)
            
            self.present(popUp, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinderInfo" {
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
            // Pass the selected object to the new view controller.
            vc.infoText = "Here you can find weekday for a date of your choice"
        }
    }
}

