import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
  final _carsRef = CarModelCollectionReference();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return FirestoreBuilder(
      ref: _carsRef.whereUserId(isEqualTo: user.uid),
      builder: (_, snapshot, __) {
        if (snapshot.data == null) {
          return const PageLoader();
        }
        if (snapshot.data!.snapshot.size == 0) {
          return buildCreateCar(context);
        }
        return buildActiveCar(context);
      },
    );
  }
}
