import 'dart:io';

void main() {
  print('========STUDENT GRADE CALCULATOR SYSTEM========');

  print('Enter Student Full Name: ');
  String name = stdin.readLineSync() ?? '';

  print('Enter Student ID Number: ');
  int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  List<double> grades = [];
  for (int i = 1; i <= 3; i++) {
    double grade = -1.0; 
    
    while (true) {
      print('Enter grade for Subject $i : ');
      grade = double.tryParse(stdin.readLineSync() ?? '') ?? -1.0;

      if (grade >= 0 && grade <= 100) {
        break; 
      } else {
        print('Invalid Input! Grade must be between 0 and 100. Please try again.');
      }
    }
    
    grades.add(grade);
  }

  Student student = Student(name, id, grades);

  print('==============STUDENT REPORT==================');
  print('Student Name : ${student.fullName}');
  print('Student ID   : ${student.idNumber}');

  student.displayGrades();

  double averageGrade = computeGrade(student.subjectGrades);
  print('Average Grade: ${averageGrade.toStringAsFixed(2)}');

  String status;
  if (averageGrade >= 75) {
    status = 'Passed';
  } else if (averageGrade >= 70 && averageGrade < 75) {
    status = 'Conditional';
  } else {
    status = 'Failed';
  }

  print('Status       : $status');
  print('==============================================');
}

double computeGrade(List<double> grades) {
  if (grades.isEmpty) return 0.0;

  double sum = 0.0;
  for (double grade in grades) {
    sum += grade;
  }
  return sum / grades.length;
}

class Student {
  String fullName;
  int idNumber;
  List<double> subjectGrades;

  Student(this.fullName, this.idNumber, this.subjectGrades);

  void displayGrades() {
    print('--- Subject Grades ---');
    for (int i = 0; i < subjectGrades.length; i++) {
      print('  Subject ${i + 1}: ${subjectGrades[i].toStringAsFixed(2)}');
    }
    print('----------------------');
  }
}
