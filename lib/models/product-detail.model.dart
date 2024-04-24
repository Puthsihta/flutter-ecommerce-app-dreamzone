class ProductDetail {
  bool? message;
  int? statusCode;
  Null? error;
  Data? data;

  ProductDetail({this.message, this.statusCode, this.error, this.data});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Product? product;
  List<RelatedProduct>? relatedProduct;

  Data({this.product, this.relatedProduct});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['related_product'] != null) {
      relatedProduct = <RelatedProduct>[];
      json['related_product'].forEach((v) {
        relatedProduct!.add(new RelatedProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.relatedProduct != null) {
      data['related_product'] =
          this.relatedProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? shopId;
  String? categoryId;
  Null? subCategoryId;
  String? productCode;
  String? name;
  int? price;
  String? pv;
  int? discount;
  String? discountType;
  Null? startDiscount;
  Null? endDiscount;
  String? status;
  String? limitOrder;
  Null? filter;
  String? image;
  Null? video;
  String? autoPlay;
  String? description;
  String? isTopProduct;
  String? bestSeller;
  bool? isFavorite;
  List<Gallery>? gallery;
  String? imageUrl;

  Product(
      {this.id,
      this.shopId,
      this.categoryId,
      this.subCategoryId,
      this.productCode,
      this.name,
      this.price,
      this.pv,
      this.discount,
      this.discountType,
      this.startDiscount,
      this.endDiscount,
      this.status,
      this.limitOrder,
      this.filter,
      this.image,
      this.video,
      this.autoPlay,
      this.description,
      this.isTopProduct,
      this.bestSeller,
      this.isFavorite,
      this.gallery,
      this.imageUrl});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productCode = json['product_code'];
    name = json['name'];
    price = json['price'];
    pv = json['pv'];
    discount = json['discount'];
    discountType = json['discount_type'];
    startDiscount = json['start_discount'];
    endDiscount = json['end_discount'];
    status = json['status'];
    limitOrder = json['limit_order'];
    filter = json['filter'];
    image = json['image'];
    video = json['video'];
    autoPlay = json['auto_play'];
    description = json['description'];
    isTopProduct = json['is_top_product'];
    bestSeller = json['best_seller'];
    isFavorite = json['is_favorite'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['product_code'] = this.productCode;
    data['name'] = this.name;
    data['price'] = this.price;
    data['pv'] = this.pv;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['start_discount'] = this.startDiscount;
    data['end_discount'] = this.endDiscount;
    data['status'] = this.status;
    data['limit_order'] = this.limitOrder;
    data['filter'] = this.filter;
    data['image'] = this.image;
    data['video'] = this.video;
    data['auto_play'] = this.autoPlay;
    data['description'] = this.description;
    data['is_top_product'] = this.isTopProduct;
    data['best_seller'] = this.bestSeller;
    data['is_favorite'] = this.isFavorite;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Gallery {
  String? image;
  String? imageUrl;

  Gallery({this.image, this.imageUrl});

  Gallery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class RelatedProduct {
  int? id;
  String? shopId;
  String? name;
  int? price;
  int? discount;
  String? discountType;
  Null? startDiscount;
  Null? endDiscount;
  String? image;
  int? pv;
  bool? isFavorite;
  String? imageUrl;

  RelatedProduct(
      {this.id,
      this.shopId,
      this.name,
      this.price,
      this.discount,
      this.discountType,
      this.startDiscount,
      this.endDiscount,
      this.image,
      this.pv,
      this.isFavorite,
      this.imageUrl});

  RelatedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    startDiscount = json['start_discount'];
    endDiscount = json['end_discount'];
    image = json['image'];
    pv = json['pv'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['start_discount'] = this.startDiscount;
    data['end_discount'] = this.endDiscount;
    data['image'] = this.image;
    data['pv'] = this.pv;
    data['is_favorite'] = this.isFavorite;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
