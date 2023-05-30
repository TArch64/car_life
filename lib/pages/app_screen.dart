import 'package:flutter/cupertino.dart';

import 'sign_in/sign_in_page.dart';
import 'cars/add/add_car_page.dart';
import 'events/events_page.dart';
import 'auth_handler.dart';
import 'car_handler.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return AuthHandler(
      buildAuth: (_) => const SignInPage(),
      buildApp: (_) => CarHandler(
        buildCreateCar: (_) => const AddCarPage(),
        buildActiveCar: (_) => const EventsPage(),
      ),
    );
  }
}
