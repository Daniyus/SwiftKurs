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

class Student:Person {
    var matNr:Int
    var courses = [Course]()
    var mark = [String:Int]()
    
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


var person1 = Person(forename: "Peter", surname: "Peter", age: 29)
var person2 = Person(forename: "Flori", surname: "Flori", age: 29, email: "flori@flori")

let p1 = person1.getPersonAsString()
let p2 = person2.getPersonAsString()
print(p1)
print(p2)

person1.increaseAgeAfterBirthday()
person1.getPersonAsString()
var student1:Student = Student(studentMatNr: 100000, studentForename: person1.forename, studentSurename: person1.surname, studentAge: person1.age)
var professor1:Professor = Professor(professorID: 1, professorForename: person2.forename, professorSurename: person2.surname, professorAge: person2.age)


student1.getAllCourses()

professor1.getPersonAsString()

professor1.fachbereich = "Informatik"

professor1.getPersonAsString()


var programmingCourse = Course(courseProfessor: professor1, courseName: "programming", courseCreditPoints: 5)

programmingCourse.addStudentToKurs(student1)

programmingCourse.addStudentToKurs(Student(studentMatNr: 10, studentForename: "Hans", studentSurename: "Hans", studentAge: 19))

//programmingCourse.addStudentsToKurs([])

programmingCourse.getAllParticipants()


programmingCourse.participant.first?.getPersonAsString()




let courses = student1.getAllCourses()

student1.mark[programmingCourse.name] = 1

let points = student1.getPointAverages()

programmingCourse.getCoursePointAverages()

let honorsStudents :[Student] = programmingCourse.getStudentesWithBestMark(1)

programmingCourse.getStudentesEmailAddress()
