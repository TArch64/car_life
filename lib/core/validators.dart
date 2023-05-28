import 'package:validators/validators.dart';
import 'package:car_life/core/localization.dart';
import 'package:flutter/cupertino.dart';

class Validators {
  static FormFieldValidator<String> requireText(BuildContext context) {
    return (value) => (value ?? '').isEmpty ? context.l10n.formRequired : null;
  }

  static FormFieldValidator<String> requireEmail(BuildContext context) {
    return (value) => isEmail(value ?? '') ? null : context.l10n.formEmailFormat;
  }

  static FormFieldValidator<String> requireStringMinLength(BuildContext context, { required int min }) {
    return (value) => (value ?? '').length < min ? context.l10n.formMinLength(min) : null;
  }
  
  static FormFieldValidator<String> minInt(BuildContext context, { required int min }) {
    return (value) => value == null || (int.tryParse(value) ?? min - 1) < min ? context.l10n.formMinNumber(min) : null;
  }
}