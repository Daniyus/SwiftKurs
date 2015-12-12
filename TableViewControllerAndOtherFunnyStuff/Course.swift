//
//  Course.swift
//  TableViewControllerAndOtherFunnyStuff
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import Foundation

class Course {
    let professor:Person
    let name:String
    let creditPoints:Int
    var participant:[Student]
    
    init(courseProfessor professor:Person, courseName name:String, courseCreditPoints creditPoints:Int){
        self.professor = professor
        self.name = name
        self.creditPoints = creditPoints
        self.participant = [Student]()
    }
    
    func addStudentToKurs(student:Student) {
        student.courses.append(self)
        participant.append(student)
    }
    
    func getAllParticipants() -> [Student]{
        return participant
    }
    
    func getCoursePointAverages() -> Double {
        var result = 0
        var anzahl = 0
        for student in participant {
            if student.mark[self.name] != nil {
                result += student.mark[self.name]!
                anzahl += 1
            }
        }
        if anzahl > 0 {
            return (Double)(result/anzahl)
        } else {
            return 0
        }
    }
    
    func getStudentesWithBestMark(note:Int) -> [Student]{
        var array = [Student]()
        for student in participant {
            if student.mark[self.name] == note {
                array.append(student)
            }
        }
        return array
    }
    
    func getStudentesEmailAddress() -> [String] {
        var array = [String]()
        
        for student in participant {
            if let mail = student.email {
                array.append(mail)
            }
        }
        return array
    }
}
