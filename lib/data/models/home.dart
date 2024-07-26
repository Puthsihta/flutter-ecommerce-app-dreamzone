// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:flutter/foundation.dart';

class Home {
  List<Banner> banner;
  List<Categories> categories;
  List<Product> bestSalling;
  List<Shop> featuresShop;
  List<Product> products;

  Home({
    required this.banner,
    required this.categories,
    required this.bestSalling,
    required this.featuresShop,
    required this.products,
  });

  Home copyWith({
    List<Banner>? banner,
    List<Categories>? categories,
    List<Product>? bestSalling,
    List<Shop>? featuresShop,
    List<Product>? products,
  }) {
    return Home(
      banner: banner ?? this.banner,
      categories: categories ?? this.categories,
      bestSalling: bestSalling ?? this.bestSalling,
      featuresShop: featuresShop ?? this.featuresShop,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'banner': banner.map((x) => x.toMap()).toList(),
      'categories': categories.map((x) => x.toMap()).toList(),
      'bestSalling': bestSalling.map((x) => x.toMap()).toList(),
      'featuresShop': featuresShop.map((x) => x.toMap()).toList(),
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Home.fromMap(Map<String, dynamic> map) {
    return Home(
      banner: List<Banner>.from(
        (map['banner'] as List<dynamic>).map<Banner>(
          (x) => Banner.fromMap(x as Map<String, dynamic>),
        ),
      ),
      categories: List<Categories>.from(
        (map['categories'] as List<dynamic>).map<Categories>(
          (x) => Categories.fromMap(x as Map<String, dynamic>),
        ),
      ),
      bestSalling: List<Product>.from(
        (map['bestSalling'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      featuresShop: List<Shop>.from(
        (map['featuresShop'] as List<dynamic>).map<Shop>(
          (x) => Shop.fromMap(x as Map<String, dynamic>),
        ),
      ),
      products: List<Product>.from(
        (map['products'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Home.fromJson(String source) =>
      Home.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Home(banner: $banner, categories: $categories, bestSalling: $bestSalling, featuresShop: $featuresShop, products: $products)';
  }

  @override
  bool operator ==(covariant Home other) {
    if (identical(this, other)) return true;

    return listEquals(other.banner, banner) &&
        listEquals(other.categories, categories) &&
        listEquals(other.bestSalling, bestSalling) &&
        listEquals(other.featuresShop, featuresShop) &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return banner.hashCode ^
        categories.hashCode ^
        bestSalling.hashCode ^
        featuresShop.hashCode ^
        products.hashCode;
  }
}

class Banner {
  int? id;
  String? title;
  String? description;
  String? image_url;
  String? link;
  String? created_at;
  String? updated_at;

  Banner({
    this.id,
    this.title,
    this.description,
    this.image_url,
    this.link,
    this.created_at,
    this.updated_at,
  });

  Banner copyWith({
    int? id,
    String? title,
    String? description,
    String? image_url,
    String? link,
    String? created_at,
    String? updated_at,
  }) {
    return Banner(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image_url: image_url ?? this.image_url,
      link: link ?? this.link,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image_url': image_url,
      'link': link,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Banner.fromJson(String source) =>
      Banner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Banner(id: $id, title: $title, description: $description, image_url: $image_url, link: $link, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Banner other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image_url == image_url &&
        other.link == link &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image_url.hashCode ^
        link.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}

class Categories {
  int? id;
  String? name;
  String? description;
  String? image_url;
  String? created_at;
  String? updated_at;

  Categories({
    this.id,
    this.name,
    this.description,
    this.image_url,
    this.created_at,
    this.updated_at,
  });

  Categories copyWith({
    int? id,
    String? name,
    String? description,
    String? image_url,
    String? created_at,
    String? updated_at,
  }) {
    return Categories(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image_url: image_url ?? this.image_url,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image_url': image_url,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Categories(id: $id, name: $name, description: $description, image_url: $image_url, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image_url == image_url &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image_url.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}

class HomePrefeed {
  List<Product> homeProduct;

  HomePrefeed({
    required this.homeProduct,
  });

  HomePrefeed copyWith({
    List<Product>? homeProduct,
  }) {
    return HomePrefeed(
      homeProduct: homeProduct ?? this.homeProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeProduct': homeProduct.map((x) => x.toMap()).toList(),
    };
  }

  factory HomePrefeed.fromMap(Map<String, dynamic> map) {
    return HomePrefeed(
      homeProduct: List<Product>.from(
        (map['home_product'] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePrefeed.fromJson(String source) =>
      HomePrefeed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomePrefeed(homeProduct: $homeProduct)';

  @override
  bool operator ==(covariant HomePrefeed other) {
    if (identical(this, other)) return true;

    return listEquals(other.homeProduct, homeProduct);
  }

  @override
  int get hashCode => homeProduct.hashCode;
}
