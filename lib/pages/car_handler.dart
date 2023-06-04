import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/bloc/car_cubit.dart';

import 'base/page_loader.dart';

class CarHandler extends StatefulWidget {
  const CarHandler({
    super.key,
    required this.buildCreateCar,
    required this.buildActiveCar
  });

  final WidgetBuilder buildCreateCar;
  final WidgetBuilder buildActiveCar;

  @override
  State<CarHandler> createState() => _CarHandlerState();
}

class _CarHandlerState extends State<CarHandler> {
  @override
  void initState() {
    super.initState();
    final user = context.read<AuthCubit>().state.user!;
    context.read<CarCubit>().loadCar(user: user);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCubit, CarCubitState>(
      builder: (_, state) {
        if (!state.isInited) {
          return const CupertinoPageScaffold(child: PageLoader());
        }
        if (state.car == null) {
          return widget.buildCreateCar(context);
        }
        return widget.buildActiveCar(context);
      },
    );
  }
}
