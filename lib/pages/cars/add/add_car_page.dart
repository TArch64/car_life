import 'package:car_life/models/car_model.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../base/page_layout.dart';
import 'add_car_form.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final _carsRef = CarModelCollectionReference();
  final _creatingCar = CarModel.empty();
  bool _creating = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.addCarNavigationTitle,
      inlineNavigationTitle: true,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: AddCarForm(
        car: _creatingCar,
        creating: _creating,
        onSubmit: () => _addCar(context.inject<User>(listen: false)),
      ),
    );
  }

  _addCar(User user) async {
    setState(() => _creating = true);
    _creatingCar.userId = user.uid;
    await _carsRef.add(_creatingCar);
  }
}