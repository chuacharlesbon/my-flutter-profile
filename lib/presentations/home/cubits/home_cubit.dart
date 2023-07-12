import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myflutterprofile/core/enums/state_status_enums.dart';
import 'package:myflutterprofile/presentations/home/datasource/home_datasource.dart';
import 'package:myflutterprofile/presentations/home/datasource/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late final HomeDataSource datasource;
  HomeCubit() : super(const HomeState()) {
    datasource = HomeDataSource();
  }

  void fetchEvent() async {
    // Update State: status with new value
    emit(state.copyWith(status: StateStatus.loading));

    // Raw Value of Server Response
    final result = await datasource.getData1();

    if(result is Map<String, dynamic>){
      // Converted Data as Model
      HomeModel newResult = HomeModel.fromJson(result);

      // Sample Delay Simulation
      // Assuming duration fetching data from actual server
      Timer tempTimer = Timer(const Duration(seconds: 3), () {});
      tempTimer = Timer(const Duration(seconds: 3), () {
        
        // Update desired states using response object properties
        emit(
          state.copyWith(
              status: StateStatus.loaded,
              itemA: newResult.details,
              itemB: newResult.options,
              componentA: state.componentA.copyWith(
                  dataA: newResult.data1,
                  dataB: newResult.details?['sample'] ?? 'Placeholder')),
        );
        tempTimer.cancel();
      });
    }else{
      // Sample Delay Simulation
      // Assuming duration fetching data from actual server
      Timer tempTimer = Timer(const Duration(seconds: 3), () {});
      tempTimer = Timer(const Duration(seconds: 3), () {
        
        // Update desired states using response object properties
        emit(
          state.copyWith(
              status: StateStatus.error,),
        );
        tempTimer.cancel();
      });
    }
    
  }
}
