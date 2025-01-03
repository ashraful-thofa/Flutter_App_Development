abstract class Role {
  void displayRole();
}

class Person implements Role {
  String? name;
  int? age;
  String? address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {}
}

class Student extends Person {
  String studentID;
  String? grade;
  List<int> courseScores;

  Student(
      String name, int age, String address, this.studentID, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double avg() {
    int total = 0;
    for (int i = 0; i < courseScores.length; i++) {
      total = total + courseScores[i];
    }
    return total / courseScores.length;
  }

  void grading() {
    double average = avg();
    if (average >= 80 && average <= 100) {
      grade = "A+";
    } else if (average >= 70 && average < 80) {
      grade = "A";
    } else if (average >= 60 && average < 70) {
      grade = "A-";
    } else if (average >= 50 && average < 60) {
      grade = "B";
    } else if (average >= 40 && average < 50) {
      grade = "C";
    } else if (average >= 33 && average < 40) {
      grade = "D";
    } else {
      grade = "F";
    }
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void showCourses() {
    print("Courses Taught:");
    for (int i = 0; i < coursesTaught.length; i++) {
      print("- ${coursesTaught[i]}");
    }
  }
}

class StudentManagementSystem {
  void studentDetails(Student student) {
    print("Student Information:");
    student.displayRole();
    print("Student ID: ${student.studentID}");
    print("Name: ${student.name}");
    print("Age: ${student.age}");
    print("Address: ${student.address}");    
    double averageScore = student.avg();
    print("Average Score: ${averageScore.toStringAsFixed(1)}");
    student.grading();
    print("Grade: ${student.grade}");
    print("");
  }

  void teacherDetails(Teacher teacher) {
    print("Teacher Information:");
    teacher.displayRole();
    print("Teacher ID: ${teacher.teacherID}");
    print("Name: ${teacher.name}");
    print("Age: ${teacher.age}");
    print("Address: ${teacher.address}");

    teacher.showCourses();
    print("");
  }
}

void main() {

  StudentManagementSystem sms = StudentManagementSystem();

  Student student1 = Student("John Doe", 20, "123 Main St", "01", [90, 85, 82]);

  Teacher teacher1 = Teacher(
      "Mrs. Smith", 35, "456 Oak St", "T01", ["Math", "English", "Bangla"]);

  sms.studentDetails(student1);

  sms.teacherDetails(teacher1);
}