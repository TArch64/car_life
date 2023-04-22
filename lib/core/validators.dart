import 'package:car_life/core/localization.dart';
import 'package:flutter/cupertino.dart';

class Validators {
  static FormFieldValidator<String> requireText(BuildContext context) {
    return (value) => (value ?? '').isEmpty ? context.l10n.formRequired : null;
  }

  static FormFieldValidator<String> minInt(BuildContext context, { required int min }) {
    return (value) => value == null || (int.tryParse(value) ?? min - 1) < min ? context.l10n.formMinNumber(min) : null;
  }
}