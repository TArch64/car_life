import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_cubit.dart';
import 'bloc/car_cubit.dart';
import 'pages/base/page_loader.dart';
import 'application_wrapper.dart';

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
  Widget build(BuildContext _) {
    return BlocBuilder<CarCubit, CarCubitState>(
      builder: (context, state) {
        if (!state.isInited) {
          return const ApplicationWrapper(
            child: CupertinoPageScaffold(child: PageLoader()),
          );
        }
        if (state.car == null) {
          return ApplicationWrapper(
            child: widget.buildCreateCar(context),
          );
        }
        return ApplicationWrapper(
          child: widget.buildActiveCar(context),
        );
      },
    );
  }
}
