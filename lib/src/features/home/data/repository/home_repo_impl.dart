import 'dart:developer' show log;
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../global_export.dart';


class HomeRepoImpl implements HomeRepo {
  factory HomeRepoImpl() => _instance;
  HomeRepoImpl._internal();
  static final HomeRepoImpl _instance = HomeRepoImpl._internal();

  final GraphQLService _graphQLService = GraphQLService();

  @override
  Future<ApiResponse<List<Country>>> fetchCountries() async {
    try {
      const String query = r'''
        query {
          countries {
            name
            emoji
            capital
            continent {
              name
            }
          }
        }
      ''';

      final QueryResult<Object?> result = await _graphQLService.query(query);

      if (result.hasException) {
        throw result.exception!;
      }

      final List<dynamic> data = result.data?['countries'] ?? [];
      final List<Country> countries = data.map((dynamic e) => Country.fromJson(e)).toList();

      return Successful<List<Country>>(data: countries);
    } 
    catch (e) {
      return Unsuccessful<List<Country>>(
        error: CLException(e, StackTrace.current)
      );
    }
  }
}