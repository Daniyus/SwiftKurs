//
//  Student.swift
//  TableViewControllerAndOtherFunnyStuff
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import Foundation

class Student:Person {
    var matNr:Int
    var courses = [Course]()
    var mark = [String:Int]()
    var date:NSDate?
    
    init (studentMatNr: Int, studentForename:String, studentSurename:String,studentAge:Int){
        self.matNr = studentMatNr
        super.init(forename: studentForename, surname: studentSurename, age: studentAge, email:nil)
    }
    
    override func getPersonAsString() -> String {
        var result = super.getPersonAsString()
        result += " [Mat: \(matNr)]"
        return result
    }
    
    func getAllCourses() -> [Course] {
        return courses
    }
    
    func getPointAverages() -> Double {
        var result = 0
        let anzahl = mark.count
        for ( _, smark) in mark{
            result += smark
        }
        return (Double) (result/anzahl)
    }
}
