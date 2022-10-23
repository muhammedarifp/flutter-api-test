import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'test_mod.g.dart';

@JsonSerializable()
class TestMod {
  int? page;
  @JsonKey(name: 'results')
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  TestMod({this.page, this.results, this.totalPages, this.totalResults});

  factory TestMod.fromJson(Map<String, dynamic> json) {
    return _$TestModFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TestModToJson(this);
}
