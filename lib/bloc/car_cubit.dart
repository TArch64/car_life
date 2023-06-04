import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/models/Car.dart';

class CarCubitState {
  final Car? car;
  final bool isInited;

  const CarCubitState._({
    this.car,
    this.isInited = true
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln("CarCubitState {");
    buffer.writeln(" car = $car");
    buffer.writeln(" isInited = $isInited");
    buffer.writeln("}");
    return buffer.toString();
  }
}

class CarCubit extends Cubit<CarCubitState> {
  CarCubit(): super(const CarCubitState._(isInited: false));

  loadCar({ required AuthUser user }) async {
    final query = await Amplify.DataStore.query(
      Car.classType,
      where: Car.USERID.eq(user.userId),
      pagination: const QueryPagination.firstResult()
    );
    emit(CarCubitState._(car: query.singleOrNull));
  }

  updateCar(Car car) async {
    await Amplify.DataStore.save(car);
    emit(CarCubitState._(car: car));
  }
}