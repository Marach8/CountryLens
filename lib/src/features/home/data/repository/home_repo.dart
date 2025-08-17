import '../../../../global_export.dart';

abstract class HomeRepo {
  Future<ApiResponse<List<Country>>> fetchCountries();
}