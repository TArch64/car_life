import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/models/EventMileage.dart';
import 'package:car_life/models/EventMileageRecurrence.dart';
import 'package:car_life/models/EventMileageRecurrenceEnds.dart';

class EventMileageField extends FormField<EventMileage> {
  EventMileageField({
    super.key,
    super.onSaved,
    super.validator,
    super.autovalidateMode,
    required super.initialValue,
  }): super(
    builder: (state) => CupertinoFormSection(
      children: [
        _valueField(state),
        _recurrenceSwitch(state),
        ..._recurrenceFields(state),
      ],
    )
  );

  static Widget _valueField(FormFieldState<EventMileage> state) {
    return CupertinoTextFormFieldRow(
      prefix: Text(state.context.l10n.formMileageLabel),
      validator: Validators.minInt(state.context, min: 0),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      initialValue: state.value?.value.toString(),
      onSaved: (newValue) {
        final formatted = int.tryParse(newValue ?? '') ?? 0;
        state.didChange(state.value!.copyWith(value: formatted));
      },
    );
  }

  static Widget _recurrenceSwitch(FormFieldState<EventMileage> state) {
    return CupertinoFormRow(
      prefix: Text(state.context.l10n.formMileageRecurrenceSwitchLabel),
      child: CupertinoSwitch(
        activeColor: state.context.theme.primaryColor,
        value: state.value!.recurrence == EventMileageRecurrence.RECURRING,
        onChanged: (isRecurring) {
          final newValue = isRecurring ? EventMileageRecurrence.RECURRING : EventMileageRecurrence.SINGLE;
          state.didChange(state.value!.copyWith(recurrence: newValue));
        }
      ),
    );
  }

  static List<Widget> _recurrenceFields(FormFieldState<EventMileage> state) {
    if (state.value!.recurrence != EventMileageRecurrence.RECURRING) return [];
    return [
      _recurrenceIntervalField(state),
      _recurrenceEndsSwitch(state),
      if (state.value!.recurrenceEnds == EventMileageRecurrenceEnds.AFTER_COUNT)
        _recurrenceCountField(state),
    ];
  }

  static Widget _recurrenceIntervalField(FormFieldState<EventMileage> state) {
    return CupertinoTextFormFieldRow(
      prefix: Text(state.context.l10n.formMileageRecurrenceIntervalLabel),
      validator: Validators.minInt(state.context, min: 500),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      initialValue: state.value!.recurrenceInterval.toString(),
      onChanged: (newValue) {
        final formatted = int.tryParse(newValue ?? '') ?? 0;
        state.didChange(state.value!.copyWith(recurrenceInterval: formatted));
      },
    );
  }

  static Widget _recurrenceEndsSwitch(FormFieldState<EventMileage> state) {
    return CupertinoFormRow(
      prefix: Text(state.context.l10n.formMileageRecurrenceEndsLabel),
      child: CupertinoSegmentedControl<EventMileageRecurrenceEnds>(
        padding: const EdgeInsets.only(right: 6),
        children: {
          EventMileageRecurrenceEnds.NEVER: _recurrenceEndsOption(state.context.l10n.formMileageRecurrenceEndsNeverLabel),
          EventMileageRecurrenceEnds.AFTER_COUNT: _recurrenceEndsOption(state.context.l10n.formMileageRecurrenceEndsAfterLabel)
        },
        groupValue: state.value!.recurrenceEnds,
        onValueChanged: (newValue) {
          state.didChange(state.value!.copyWith(recurrenceEnds: newValue));
        }
      )
    );
  }

  static Widget _recurrenceEndsOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(title),
    );
  }

  static Widget _recurrenceCountField(FormFieldState<EventMileage> state) {
    return CupertinoTextFormFieldRow(
      prefix: Text(state.context.l10n.formMileageRecurrenceEndsAfterCountLabel),
      validator: Validators.minInt(state.context, min: 2),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      initialValue: state.value!.recurrenceCount.toString(),
      onChanged: (newValue) {
        final formatted = int.tryParse(newValue ?? '') ?? 0;
        state.didChange(state.value!.copyWith(recurrenceCount: formatted));
      },
    );
  }
}
