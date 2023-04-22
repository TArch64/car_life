import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:car_life/core/provider.dart';

import 'pages/base/page_loader.dart';
import 'models/car_model.dart';

class CarHandler extends StatelessWidget {
  CarHandler({
    super.key,
    required this.buildCreateCar,
    required this.buildActiveCar
  });

  final WidgetBuilder buildCreateCar;
  final WidgetBuilder buildActiveCar;
  final _carsRef = CarCollectionReference();

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: _carsRef.whereUserId(isEqualTo: context.inject<User>().uid),
      builder: (_, snapshot, __) {
        if (snapshot.data == null) {
          return const PageLoader();
        }
        if (snapshot.data!.snapshot.size == 0) {
          return buildCreateCar(context);
        }
        return Provider<CarModel>.value(
          value: snapshot.data!.snapshot.docs.first.data(),
          child: buildActiveCar(context),
        );
      },
    );
  }
}
