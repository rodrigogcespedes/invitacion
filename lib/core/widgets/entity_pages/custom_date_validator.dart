import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomDateValidator extends TextFieldValidator {
  CustomDateValidator({
    required errorText,
    required this.startDate,
    required this.endDate,
  }) : super(errorText);

  final DateTime startDate;
  final DateTime endDate;

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    DateFormat format = DateFormat("dd/MM/yyyy");
    DateTime selectedDate = format.parse(value!);
    DateTime today = format.parse(format.format(DateTime.now()));

    if (selectedDate.isBefore(startDate) &&
        !selectedDate.isAtSameMomentAs(today)) return false;
    if (selectedDate.isAfter(endDate) && !selectedDate.isAtSameMomentAs(today)) {
      return false;
    }

    return true;
  }
}
