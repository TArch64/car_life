import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/core/amplify_query.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/bloc/auth_cubit.dart';

import 'base/page_loader.dart';

class CarHandler extends StatelessWidget {
  const CarHandler({
    super.key,
    required this.buildCreateCar,
    required this.buildActiveCar
  });

  final WidgetBuilder buildCreateCar;
  final WidgetBuilder buildActiveCar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (_, state) => AmplifyQuery<Car>(
        type: Car.classType,
        where: Car.USERID.eq(state.user!.userId),
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
      ),
    );
  }
}
