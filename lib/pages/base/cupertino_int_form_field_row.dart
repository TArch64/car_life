import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoIntFormFieldRow extends CupertinoTextFormFieldRow {
  CupertinoIntFormFieldRow({
    super.key,
    super.prefix,
    super.validator,
    super.autovalidateMode,
    int? initialValue,
    FormFieldSetter<int>? onSaved,
  }): super(
    keyboardType: TextInputType.number,
    inputFormatters: [_IntInputFormatter()],
    initialValue: initialValue?.toString(),
    onSaved: onSaved == null ? null : (value) => onSaved(int.tryParse(value ?? '')),
  );
}

class _IntInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newString = newValue.text.replaceAll(RegExp(r'\D'), '');

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
