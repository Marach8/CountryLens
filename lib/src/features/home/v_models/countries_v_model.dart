import 'package:countrylens/src/global_export.dart';

class CountriesBloc extends Cubit<CLAppState<List<Country>>> {
  CountriesBloc(this._repo) : super(CLAppState<List<Country>>.initialState());

  final HomeRepo _repo;

  Future<void> fetchCountries() async {
    emit(CLAppState<List<Country>>.loadingState());
    try {
      final ApiResponse<List<Country>> loadCountries = await _repo.fetchCountries();
      loadCountries.when(
        successful: (Successful<List<Country>> data){
          emit(CLAppState<List<Country>>.successState(data.data!));
        },
        unSuccessful: (Unsuccessful<List<Country>> error){
          emit(CLAppState<List<Country>>.failureState(error.error.errorMsg));
        }
      );
    } 
    catch (e) {
      emit(CLAppState<List<Country>>.failureState(e.toString()));
    }
  }
}
