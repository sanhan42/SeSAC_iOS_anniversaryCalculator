//
//  ViewController.swift
//  anniversaryCalculator
//
//  Created by 한상민 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var imageViewCollection: [UIImageView]!
    @IBOutlet var dDayLabelList: [UILabel]!
    @IBOutlet var dateLabelList: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePickerStyle()
        setImageViewStyle(list: imageViewCollection)
        setDDayLabel(list: dDayLabelList)
        setDateLabel(list: dateLabelList)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        setDateLabel(list: dateLabelList)
    }
    
    func setDateLabel(list:[UILabel]) {
        for (index,label) in list.enumerated() {
            label.textColor = .white
            label.numberOfLines = 2
            let format = DateFormatter()
            format.locale = Locale(identifier: "ko_KR")
            format.timeZone = TimeZone(abbreviation: "KST")
            format.dateFormat = """
            yyyy년
            MM월 dd일
            """
            let date = Calendar.current.date(byAdding: .day, value: (index+1)*100, to: datePicker.date)!
            label.text = format.string(from: date)
            label.textAlignment = .center
            
            // 뒤 이미지 때문에 글자가 잘 안보여서 그림자를 넣어봄.
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowRadius = 1
            label.layer.shadowOpacity = 1.0
            label.layer.shadowOffset = CGSize(width: 1, height: 1)
            label.layer.masksToBounds = false
        }
    }
    
    func setDDayLabel(list:[UILabel]) {
        for (index,label) in list.enumerated() {
            label.text = "D+\(index+1)00"
            label.textColor = .white
            label.font = .boldSystemFont(ofSize: 18)
            
            // 뒤 이미지 때문에 글자가 잘 안보여서 그림자를 넣어봄.
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowRadius = 1
            label.layer.shadowOpacity = 1.0
            label.layer.shadowOffset = CGSize(width: 1, height: 1)
            label.layer.masksToBounds = false
        }
    }
    
    func setImageViewStyle(list:[UIImageView]){
        for imageView in list {
            imageView.layer.cornerRadius = 8
        }
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

