import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/models/Event.dart';

class EventCubitState {
  final List<Event> events;

  const EventCubitState._({ required this.events });
}

class EventCubit extends Cubit<EventCubitState> {
  StreamSubscription<QuerySnapshot<Event>>? _subscription;

  EventCubit(): super(const EventCubitState._(events: []));

  listen({ required Car car }) async {
    _subscription?.cancel();
    final stream = Amplify.DataStore.observeQuery(
      Event.classType,
      where: Event.CARID.eq(car.id),
    );
    _subscription = stream.listen((snapshot) async {
      emit(EventCubitState._(events: snapshot.items));
    });
  }
}
