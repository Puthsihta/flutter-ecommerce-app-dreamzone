class Home {
  bool? message;
  int? statusCode;
  Null? error;
  Data? data;

  Home({this.message, this.statusCode, this.error, this.data});

  Home.fromJson(Map<String, dynamic> json) {
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
  List<Slides>? slides;
  List<Product>? product;
  List<Shop>? shop;
  List<BestSeller>? bestSeller;

  Data({this.slides, this.product, this.shop, this.bestSeller});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(new Slides.fromJson(v));
      });
    }
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    if (json['shop'] != null) {
      shop = <Shop>[];
      json['shop'].forEach((v) {
        shop!.add(new Shop.fromJson(v));
      });
    }
    if (json['bestSeller'] != null) {
      bestSeller = <BestSeller>[];
      json['bestSeller'].forEach((v) {
        bestSeller!.add(new BestSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slides != null) {
      data['slides'] = this.slides!.map((v) => v.toJson()).toList();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.map((v) => v.toJson()).toList();
    }
    if (this.bestSeller != null) {
      data['bestSeller'] = this.bestSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slides {
  int? id;
  String? title;
  String? image;
  String? imageMobile;
  String? type;
  int? sortOrder;
  String? url;
  int? status;
  String? imageUrl;
  String? imageMobileUrl;

  Slides(
      {this.id,
      this.title,
      this.image,
      this.imageMobile,
      this.type,
      this.sortOrder,
      this.url,
      this.status,
      this.imageUrl,
      this.imageMobileUrl});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageMobile = json['image_mobile'];
    type = json['type'];
    sortOrder = json['sort_order'];
    url = json['url'];
    status = json['status'];
    imageUrl = json['image_url'];
    imageMobileUrl = json['image_mobile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['image_mobile'] = this.imageMobile;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['url'] = this.url;
    data['status'] = this.status;
    data['image_url'] = this.imageUrl;
    data['image_mobile_url'] = this.imageMobileUrl;
    return data;
  }
}

class Product {
  int? id;
  int? shopId;
  int? categoryId;
  int? subCategoryId;
  String? productCode;
  String? name;
  int? price;
  String? pv;
  int? discount;
  String? discountType;
  Null? startDiscount;
  Null? endDiscount;
  int? status;
  int? limitOrder;
  Null? filter;
  String? image;
  Null? video;
  int? autoPlay;
  String? description;
  int? isTopProduct;
  int? bestSeller;
  bool? isFavorite;
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
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Shop {
  int? id;
  int? industryId;
  int? provinceId;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? address;
  String? imageBanner;
  int? discount;
  Null? discountType;
  String? description;
  int? status;
  int? isFeature;
  Null? isDiscount;
  Null? latitude;
  Null? longitude;
  String? website;
  int? sortOrder;
  String? imageUrl;
  String? imageBannerUrl;

  Shop(
      {this.id,
      this.industryId,
      this.provinceId,
      this.name,
      this.phone,
      this.email,
      this.logo,
      this.address,
      this.imageBanner,
      this.discount,
      this.discountType,
      this.description,
      this.status,
      this.isFeature,
      this.isDiscount,
      this.latitude,
      this.longitude,
      this.website,
      this.sortOrder,
      this.imageUrl,
      this.imageBannerUrl});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    industryId = json['industry_id'];
    provinceId = json['province_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    address = json['address'];
    imageBanner = json['image_banner'];
    discount = json['discount'];
    discountType = json['discount_type'];
    description = json['description'];
    status = json['status'];
    isFeature = json['is_feature'];
    isDiscount = json['is_discount'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    website = json['website'];
    sortOrder = json['sort_order'];
    imageUrl = json['image_url'];
    imageBannerUrl = json['image_banner_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['industry_id'] = this.industryId;
    data['province_id'] = this.provinceId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['address'] = this.address;
    data['image_banner'] = this.imageBanner;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['description'] = this.description;
    data['status'] = this.status;
    data['is_feature'] = this.isFeature;
    data['is_discount'] = this.isDiscount;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['website'] = this.website;
    data['sort_order'] = this.sortOrder;
    data['image_url'] = this.imageUrl;
    data['image_banner_url'] = this.imageBannerUrl;
    return data;
  }
}

class BestSeller {
  int? id;
  int? shopId;
  int? categoryId;
  Null? subCategoryId;
  String? productCode;
  String? name;
  int? price;
  Null? pv;
  int? discount;
  String? discountType;
  Null? startDiscount;
  Null? endDiscount;
  int? status;
  int? limitOrder;
  Null? filter;
  String? image;
  Null? video;
  int? autoPlay;
  String? description;
  int? isTopProduct;
  int? bestSeller;
  String? imageUrl;

  BestSeller(
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
      this.imageUrl});

  BestSeller.fromJson(Map<String, dynamic> json) {
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
    data['image_url'] = this.imageUrl;
    return data;
  }
}
