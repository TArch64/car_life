import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/models/Event.dart';

class EventsCubitState {
  final List<Event> events;

  const EventsCubitState._({ required this.events });
}

class EventsCubit extends Cubit<EventsCubitState> {
  StreamSubscription<QuerySnapshot<Event>>? _subscription;

  EventsCubit(): super(const EventsCubitState._(events: []));

  listen({ required Car car }) async {
    _subscription?.cancel();
    final stream = Amplify.DataStore.observeQuery(
      Event.classType,
      where: Event.CARID.eq(car.id),
    );
    _subscription = stream.listen((snapshot) async {
      emit(EventsCubitState._(events: snapshot.items));
    });
  }
}
