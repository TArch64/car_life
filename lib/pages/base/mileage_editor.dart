import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/pages/base/cupertino_int_form_field_row.dart';

class MileageEditor extends StatefulWidget {
  final EventMileageModel mileage;

  const MileageEditor({
    super.key,
    required this.mileage,
  });

  @override
  State<MileageEditor> createState() => _MileageEditorState();
}

class _MileageEditorState extends State<MileageEditor> {
  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      children: [
        CupertinoIntFormFieldRow(
          prefix: Text(context.l10n.formMileageLabel),
          validator: Validators.minInt(context, min: 0),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: widget.mileage.value,
          onSaved: (value) => setState(() => widget.mileage.value = value ?? 0),
        ),
        CupertinoFormRow(
          prefix: Text(context.l10n.formMileageRecurrenceSwitchLabel),
          child: CupertinoSwitch(
            activeColor: context.theme.primaryColor,
            value: widget.mileage.isRecurring,
            onChanged: (isRecurring) => setState(() => widget.mileage.isRecurring = isRecurring)
          )
        ),
        ..._recurrenceFields(context),
      ],
    );
  }

  List<Widget> _recurrenceFields(BuildContext context) {
    if (!widget.mileage.isRecurring) return [];

    return [
      CupertinoIntFormFieldRow(
        prefix: Text(context.l10n.formMileageRecurrenceIntervalLabel),
        validator: Validators.minInt(context, min: 500),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: widget.mileage.recurrenceInterval,
        onSaved: (value) => setState(() => widget.mileage.recurrenceInterval = value ?? 0),
      ),
      CupertinoFormRow(
        prefix: Text(context.l10n.formMileageRecurrenceEndsLabel),
        child: CupertinoSegmentedControl<EventMileageRecurrenceEnds>(
          padding: const EdgeInsets.only(right: 6),
          children: {
            EventMileageRecurrenceEnds.never: _recurrenceEndsOption(context.l10n.formMileageRecurrenceEndsNeverLabel),
            EventMileageRecurrenceEnds.after: _recurrenceEndsOption(context.l10n.formMileageRecurrenceEndsAfterLabel)
          },
          groupValue: widget.mileage.recurrenceEnds,
          onValueChanged: (value) => setState(() => widget.mileage.recurrenceEnds = value),
        )
      ),
      if (widget.mileage.isEnds) CupertinoIntFormFieldRow(
        prefix: Text(context.l10n.formMileageRecurrenceEndsAfterCountLabel),
        validator: Validators.minInt(context, min: 2),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: widget.mileage.recurrenceCount,
        onSaved: (value) => setState(() => widget.mileage.recurrenceCount = value ?? 0),
      ),
    ];
  }

  Widget _recurrenceEndsOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(title),
    );
  }
}
