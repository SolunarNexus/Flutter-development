import 'package:exercise1/employee.dart';
import 'package:exercise1/vacation.dart';
import 'package:exercise1/vacation_type.dart';

// Do NOT modify this main method. You can run this as a "test" to see if you get the expected output (see below).
void main() {
  print('Exercise 1');

  final employee1 = Employee(id: '12271', name: 'John Random', workLoad: 125, evaluation: 'Evaluation: He works')
    ..recordVacation(Vacation(5, VacationType.nonPaidVacation));
  print(employee1.computeTotalEarnings(employmentDurationInMonths: 2, totalNonWorkingDays: 10, deduction: 3000));
  print(employee1.vacationSummary);
  employee1.recordVacation(Vacation(10, VacationType.standard));
  print(employee1.computeTotalEarnings(employmentDurationInMonths: 1, totalNonWorkingDays: 5));
  print(employee1.vacationSummary);
}

// EXPECTED OUTPUT:
// 87000
// [1 non-paid vacation(s)]
// 40000
// [1 paid vacation(s), 1 non-paid vacation(s)]