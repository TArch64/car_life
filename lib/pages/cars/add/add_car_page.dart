import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/bloc/car_cubit.dart';

import '../../base/page_layout.dart';
import 'add_car_form.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  bool _creating = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.addCarNavigationTitle,
      inlineNavigationTitle: true,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: AddCarForm(
        creating: _creating,
        onSubmit: (car) => _addCar(context, car),
      ),
    );
  }

  _addCar(BuildContext context, Car car) async {
    setState(() => _creating = true);
    await context.read<CarCubit>().updateCar(car);
  }
}