import 'package:flutter/foundation.dart';

class ApiResponse<T> {

  late final T? results;

  ApiResponse({
    required this.results
  });

  static fromJson<T> (Map<dynamic, dynamic> json, Function tFromJson) {
    return ApiResponse<T>(
      results: tFromJson(json['results']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiResponse) {
      return other.results is List
          ? listEquals(other.results, results as List)
          : other.results == results;
    }

    return false;
  }
}