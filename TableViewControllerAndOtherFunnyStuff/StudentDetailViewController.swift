//
//  StudentDetailViewController.swift
//  TableViewControllerAndOtherFunnyStuff
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var student:Student!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var datePick: UIDatePicker!
    
    let courses = [
        "a",
        "b",
        "c",
        "was mit Bücher"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = "\(student.forename)"
        lblDate.text = datePick.date.swiftKursLerntDatumMitEnum(.date)
    }
    
    @IBAction func dateChangedAction(sender: UIDatePicker) {
        let d = sender.date
        student.date = d
        lblDate.text = d.swiftKursLerntDatumMitEnum(.date)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return courses.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return courses[row]
    }
    
}

enum NSDateFormatPattern:String {
    case clockTime = "HH:mm:ss"
    case date = "dd-MM-YY"
    case dateTimeWithMilliseconds = "yyyy-MM-dd HH:mm:ss,SSS ZZZ"
    case dateTime = "yyyy-MM-dd HH:mm:ss"
    
};

extension NSDate {
    func swiftKursLerntDatumMitEnum(format: NSDateFormatPattern) -> String{
        let formatter = NSDateFormatter()
        let locale = NSLocale.currentLocale() // gibt bei mir de zurück
        
        formatter.locale = locale
        formatter.dateFormat = format.rawValue
        
        return formatter.stringFromDate(self)
    }
}

