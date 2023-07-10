import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myflutterprofile/core/enums/state_status_enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  //late final HomeRepository _repository;
  HomeCubit() : super(const HomeState()) {
    //_repository = HomeRepository();
  }

  void fetchEvent() async {
    emit(state.copyWith(status: StateStatus.loading));

    //final result = await _repository.getEvent();
    Map<String, dynamic> result = {
      "status_code": 200,
      "message": "This is the state",
      "data": {}
    };
    List<dynamic> tempList = [
      "Statement",
      0,
      {"entry": true}
    ];

    // Sample Delay Simulation
    // Assuming duration fetching data from actual server
    Timer tempTimer = Timer(const Duration(seconds: 3), () {});
    tempTimer = Timer(const Duration(seconds: 3), () {
      emit(
        state.copyWith(
            status: StateStatus.loaded,
            itemA: result,
            itemB: tempList,
            componentA: state.componentA.copyWith(
                dataA: tempList[0], dataB: result['message'] ?? "Placeholder")),
      );
      tempTimer.cancel();
    });
  }
}
