import 'dart:developer' show log;

import 'package:countrylens/src/global_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesBloc extends Cubit<CLAppState<List<Country>>> {
  CountriesBloc(this._repo) : super(CLAppState.initialState());

  final HomeRepo _repo;

  Future<void> fetchCountries() async {
    emit(CLAppState.loadingState());
    try {
      final ApiResponse<List<Country>> loadCountries = await _repo.fetchCountries();
      loadCountries.when(
        successful: (Successful<List<Country>> data){
          emit(CLAppState.successState(data.data!));
        },
        unSuccessful: (Unsuccessful<List<Country>> error){
          emit(CLAppState.failureState(error.error.errorMsg));
        }
      );
    } 
    catch (e) {
      emit(CLAppState.failureState(e.toString()));
    }
  }
}
