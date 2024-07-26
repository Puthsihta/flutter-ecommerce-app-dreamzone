// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dreamzone/data/models/sub_category.dart';

class Categories {
  List<SubCategories> subCategories;

  Categories({
    required this.subCategories,
  });

  Categories copyWith({
    List<SubCategories>? subCategories,
  }) {
    return Categories(
      subCategories: subCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subCategories': subCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      subCategories: List<SubCategories>.from(
        (map['sub_categories'] as List<dynamic>).map<SubCategories>(
          (x) => SubCategories.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categories(subCategories: $subCategories)';

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return listEquals(other.subCategories, subCategories);
  }

  @override
  int get hashCode => subCategories.hashCode;
}
