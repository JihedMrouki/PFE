// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final Provider<GraphQLClient> graphqlClientProvider =

//     Provider((_) => initClient(_apiGraphqlUrl, _wsEndpoint, _accessToken));

// GraphQLClient initClient(
//     String apiGraphqlUrl, String? wsEndpoint, String accessToken) {
//   final httpLink = HttpLink(apiGraphqlUrl);
//   final authLink = AuthLink(
//     getToken: () async => 'Bearer $accessToken',
//   );
//   var link = authLink.concat(httpLink);
//   if (wsEndpoint != null) {
//     final wsLink = WebSocketLink(wsEndpoint);
//     link = Link.split((request) => request.isSubscription, wsLink, link);
//   }
//   return GraphQLClient(
//     cache: GraphQLCache(),
//     link: link,
//   );
// }