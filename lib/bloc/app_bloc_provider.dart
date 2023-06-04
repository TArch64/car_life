import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit.dart';
import 'car_cubit.dart';
import 'event_cubit.dart';

class AppBlocProvider extends MultiBlocProvider {
  AppBlocProvider({ required super.child, super.key }): super(
    providers: [
      BlocProvider(create: (_) => AuthCubit()),
      BlocProvider(create: (_) => CarCubit()),
      BlocProvider(create: (_) => EventCubit()),
    ]
  );
}
