To run the code execute the following command in your command line

```sh
dart run bin/exercise1.dart
```

Your task is to implement two classes, Employee (lib/employee.dart) and Vacation (lib/vacation.dart).

Zadanie:

Create class Vacation, with read-only attributes `workingDaysDuration` (`int`) and `isPaid` (`bool`).

Create class Employee with read-only attributes `id` (`String`), `name` (`String`), and `salary` (`double`).
 Additionally, the class will hold a private array of all-time vacation of the employee, initially empty.
 Constructor of the class will only have 3 named parameters: `id`, `name`, and `salary`. Salary does NOT have
 to be given, in which case standard salary of 50,000 will be used.

Class Employee will have `void` method `recordVacation(...)` which will add a vacation for the employee.
 It will also have a computed property `vacationSummary` which will return an array with 2 or less strings:
 It will contain string `'X paid vacation(s)'` (where X is the number of paid vacations) if the employee has
 at least one paid vacation. It will contain string `'X unpaid vacation(s)'` if employee has at least one unpaid vacation.

Check point: You can now comment out lines 3 and 6 in the provided `main` method and check if you are getting expected outputs.

Class Employee will also have method `computeTotalEarnings(...)` returning double. It will have  3 named parameters:
 `employmentDurationInMonths` (`int`), `totalNonWorkingDays` (`int`), and `deduction` (`double`). If deduction is not
  explicitly specified, zero deduction will be used. This method computes employee total earnings using the following formula:

*(totalWorkingDays - totalNonPaidVacations) * perDaySalary - deduction*

where totalWorkingDays is *employmentDurationInMonths * 30 - totalNonWorkingDays*
 and *perDaySalary* is *(salary * employmentDurationInMonths) / totalWorkingDays*. *totalNonPaidVacations*
 is sum of employee's non-paid vacation days. Note: For purposes of our example, each month has 30 days.

Extension 1:
Add a read-only Employee attribute named `evaluation` (`String`) that can be `null`. Adjust getter `vacationSummary`
 so that the array it returns also contain value of `evaluation` attribute if it is non-`null`. If `evaluation` is null,
 the returned array will contain string `'No evaluation'` instead.

Extension 2:
While keeping attribute `salary` in class Employee, replace the `salary` parameter of the constructor by 2 named parameters:
 optional `hourlyRate` (`double`) with default value of `400.0`
 and required parameter `workLoad` (`double`).
 Value of salary attribute will then be determined as hourlyRate * workload.

Extension 3:

Create a new enum `VacationType` with 4 values: `standard`, `sickness`, `sickChildCare`, `nonPaidVacation`. Adjust class `Vacation`
 to have a nullable attribute `type` (`VacationType`) instead of attribute `isPaid` - `isPaid` will become a read-only computed
 property which will be `true` if value of `type` is `null` or one of `standard`, `sickness`, `sickChildCare`.