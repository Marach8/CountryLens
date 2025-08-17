import 'package:flutter/material.dart' show debugPrint;
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  factory GraphQLService() => _instance;
  GraphQLService._internal();
  static final GraphQLService _instance = GraphQLService._internal();

  late GraphQLClient _client;

  void init({required String endpoint}) {
    final HttpLink httpLink = HttpLink(endpoint);

    final Link loggingLink = Link.function(
      (Request request, [Stream<Response> Function(Request)? forward]) {
        debugPrint('=== GraphQL Request ===');
        debugPrint('Document: ${request.operation.document}');
        debugPrint('Variables: ${request.variables}');
        debugPrint('======================');

        return forward!(request).map(
          (Response response) {
            debugPrint('=== GraphQL Response ===');
            if (response.data != null) debugPrint('Data: ${response.data}');
            if (response.errors != null) debugPrint('Errors: ${response.errors}');
            debugPrint('========================');
            return response;
          }
        );
      }
    );

    final Link link = loggingLink.concat(httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  Future<QueryResult<Object?>> query(String query, {Map<String, dynamic>? variables}) async {
    try {
      final QueryOptions<Object?> options = QueryOptions<Object?>(
        document: gql(query),
        variables: variables ?? {},
      );
      return await _client.query(options);
    }
    catch (_) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>> mutate(String mutation, {Map<String, dynamic>? variables}) async {
    try {
      final MutationOptions<Object?> options = MutationOptions<Object?>(
        document: gql(mutation),
        variables: variables ?? <String, dynamic>{},
      );
      return await _client.mutate(options);
    }
    catch (_) {
      rethrow;
    }
  }
}
