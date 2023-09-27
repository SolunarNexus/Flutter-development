// Create class Vacation, with read-only attributes workingDaysDuration (int) and isPaid (bool).
import 'package:exercise1/vacation_type.dart';

class Vacation {
  final int workingDaysDuration;
  final VacationType? type;

  const Vacation(this.workingDaysDuration, this.type) : assert(workingDaysDuration > 0);

  bool get isPaid => type == null || type != VacationType.nonPaidVacation;
}
