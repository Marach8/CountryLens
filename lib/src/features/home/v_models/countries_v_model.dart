import 'package:countrylens/src/global_export.dart';

class CountriesBloc extends Cubit<CLAppState<List<Country>>> {
  CountriesBloc(this._repo) : super(CLAppState<List<Country>>.initialState());

  final HomeRepo _repo;

  List<Country> _cachedCountries = <Country>[];

  Future<void> fetchCountries() async {
    emit(CLAppState<List<Country>>.loadingState());
    try {
      final ApiResponse<List<Country>> loadCountries = await _repo.fetchCountries();
      loadCountries.when(
        successful: (Successful<List<Country>> data){
          _cachedCountries = data.data!;
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


  Future<void> searchCountries(String searchQuery) async {
    emit(CLAppState<List<Country>>.loadingState());
    if (searchQuery.isEmpty) {
      emit(CLAppState<List<Country>>.successState(_cachedCountries));
      return;
    }

    final List<Country> filteredCountries = _cachedCountries.where(
      (Country country) => country.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false
    ).toList();

    if(filteredCountries.isEmpty){
      emit(
        CLAppState<List<Country>>.failureState(
          '',
          type: FailureType.searchFailure
        )
      );
      return;
    }

    emit(CLAppState<List<Country>>.successState(filteredCountries));
  }
}
