

import 'PopularSourceResponse.dart';

class SearchResponse {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  String? success;
  String? status_message;
  SearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  this.success,
    this.status_message
  });

  SearchResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    success = json['success'];
    status_message = json['status_message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results!.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
