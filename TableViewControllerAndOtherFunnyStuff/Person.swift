//
//  Person.swift
//  TableViewControllerAndOtherFunnyStuff
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import Foundation

class Person {
    let forename:String
    let surname:String
    var age:Int
    let email:String?
    
    convenience init(forename personForename:String, surname personSurname:String, age personAge:Int) {
        self.init(forename:personForename, surname:personSurname, age:personAge, email: nil)
    }
    
    init(forename:String, surname:String, age:Int, email:String?) {
        self.forename = forename
        self.surname = surname
        self.age = age
        self.email = email
    }
    
    func getPersonAsString() -> String {
        var result =  "\(forename) \(surname) \(age)"
        
        if let mail = email {
            result += " \(mail)"
        }
        return result
    }
    
    func increaseAgeAfterBirthday() {
        age += 1
    }
}