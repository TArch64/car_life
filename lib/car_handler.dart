import 'package:flutter/cupertino.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/core/amplify_query.dart';
import 'package:car_life/models/Car.dart';

import 'pages/base/page_loader.dart';

class CarHandler extends StatelessWidget {
  CarHandler({
    super.key,
    required this.buildCreateCar,
    required this.buildActiveCar
  });

  final WidgetBuilder buildCreateCar;
  final WidgetBuilder buildActiveCar;

  @override
  Widget build(BuildContext context) {
    final userId = '123';
    return AmplifyQuery(
      type: Car.classType,
      where: Car.USERID.eq(userId),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const CupertinoPageScaffold(child: PageLoader());
        }
        if (snapshot.data!.items.isEmpty) {
          return buildCreateCar(context);
        }
        return Provider.value(
          value: snapshot.data!.items.first,
          builder: (context, child) => buildActiveCar(context),
        );
      },
    );
  }
}
