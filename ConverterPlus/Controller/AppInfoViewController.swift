//
//  AppInfoViewController.swift
//  ConverterPlus
//
//  Created by Elīna Zekunde on 10/02/2021.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var infoText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !infoText.isEmpty {
            infoLabel.text = infoText
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
