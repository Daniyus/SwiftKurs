//
//  Professor.swift
//  TableViewControllerAndOtherFunnyStuff
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import Foundation

class Professor:Person {
    var id:Int
    var fachbereich:String?// = "noch kein fachbereich"
    
    init (professorID: Int, professorForename:String, professorSurename:String, professorAge:Int){
        self.id = professorID
        super.init(forename: professorForename, surname: professorSurename, age: professorAge, email:nil)
    }
    
    override func getPersonAsString() -> String {
        var result = super.getPersonAsString()
        result += " [ProfID: \(id)]"
        return result
    }
}
