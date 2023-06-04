import 'package:flutter/cupertino.dart';

import 'bloc/app_bloc_provider.dart';
import 'pages/sign_in/sign_in_page.dart';
import 'pages/cars/add/add_car_page.dart';
import 'pages/events/events_page.dart';
import 'auth_handler.dart';
import 'car_handler.dart';

class Application extends StatelessWidget {
  const Application({ super.key });

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: AuthHandler(
        buildAuth: (_) => const SignInPage(),
        buildApp: (_) => CarHandler(
          buildCreateCar: (_) => const AddCarPage(),
          buildActiveCar: (_) => const EventsPage(),
        ),
      )
    );
  }
}
