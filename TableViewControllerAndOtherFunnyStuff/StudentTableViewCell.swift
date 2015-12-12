//
//  StudentTableViewCell.swift
//  TableViewControllerAndOtherFunnyStuff
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblMatrikelnummer: UILabel!
    
    @IBOutlet weak var lblAlter: UILabel!
    
    func configureCellForStudent(student:Student) {
        lblName.text = "\(student.forename) \(student.surname)"
        lblMatrikelnummer.text = String(student.matNr)
        lblAlter.text = String(student.age)
    }
}
