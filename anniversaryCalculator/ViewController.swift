//
//  ViewController.swift
//  anniversaryCalculator
//
//  Created by 한상민 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePickerStyle()
        // Do any additional setup after loading the view.
    }
    
    func setDatePickerStyle(){
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.datePickerMode = .date
    }

}

