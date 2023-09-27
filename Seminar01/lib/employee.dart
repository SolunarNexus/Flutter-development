// Create class Employee with read-only attributes id (String), name (String), and salary (double).
// Additionally, the class will hold a private array of all-time vacations of the employee, initially empty.
// Constructor of the class will only have 3 named parameters: id, name, and salary.
// Salary does NOT have to be given. If not given, salary of 50,000 will be used.

import 'package:exercise1/vacation.dart';

// It's ideal to put all these as constants
const STANDARD_SALARY = 50000.0; // We must specifically say it's double
const DAYS_IN_MONTH = 30;
const STANDARD_HOURLY_RATE = 400.0;

class Employee {
  final String id;
  final String name;
  final double salary;
  final String? evaluation;
  final List<Vacation> _vacations = [];

  Employee({
    required this.id,
    required this.name,
    double hourlyRate = STANDARD_HOURLY_RATE,
    required double workLoad,
    this.evaluation,
  }) : salary = hourlyRate * workLoad;

  // 1. Class Employee will have void method recordVacation(...) which will add a vacation for the employee.
  void recordVacation(Vacation newVacation) => _vacations.add(newVacation);

  // 2. Class Employee will have a computed property vacationSummary which will return an array with 2 or less
  // strings:
  //   - It will contain string 'X paid vacation(s)' (where X is the number of paid vacations) if the employee
  //     has at least one paid vacation.
  //   - It will contain string 'X unpaid vacation(s)' if employee has at least one unpaid vacation.
  List<String> get vacationSummary {
    final paidVacationsCount = _vacations.where((vacation) => vacation.isPaid).length; // check final
    final nonPaidVacationsCount = _vacations.length - paidVacationsCount;
    return [
      if (paidVacationsCount > 0) '$paidVacationsCount paid vacation(s)',
      if (nonPaidVacationsCount > 0) '$nonPaidVacationsCount non-paid vacation(s)',
      evaluation ?? 'No evaluation',
    ];
  }

  // 3. Class Employee will also have method `computeTotalEarnings(...)` returning double. It will have 3 named parameters:
  // employmentDurationInMonths (int), totalNonWorkingDays (int), and deduction (double). If deduction is not explicitly specified,
  // 0 deduction will be used. This method computes Employee total earnings using the following formula:
  //
  // (totalWorkingDays - totalNonPaidVacations) * perDaySalary - deduction
  //
  // where totalWorkingDays is employmentDurationInMonths * 30 - totalNonWorkingDays and perDaySalary is
  // (salary * employmentDurationInMonths) / totalWorkingDays. totalNonPaidVacations is sum of employee's non-paid vacation days.
  // Note: For purposes of our example, each month has 30 days.
  double computeTotalEarnings({
    required int employmentDurationInMonths, //must be required
    required int totalNonWorkingDays,
    double deduction = 0,
  }) {
    assert(deduction >= 0); // nice to have

    final totalWorkingDays = employmentDurationInMonths * DAYS_IN_MONTH - totalNonWorkingDays;
    final perDaySalary = (salary * employmentDurationInMonths) / totalWorkingDays;
    var totalNonPaidVacations = 0;
    // reduce can be used instead of this cycle
    for (final vacation in _vacations.where((vacation) => !vacation.isPaid)) {
      totalNonPaidVacations += vacation.workingDaysDuration;
    }
    return (totalWorkingDays - totalNonPaidVacations) * perDaySalary - deduction;
  }
}
