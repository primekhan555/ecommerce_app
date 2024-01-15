class ProductsModel {
  String? searchTerm;
  String? categoryName;
  int? itemCount;
  String? redirectUrl;
  List<Products>? products;
  // List<Facets>? facets;
  // Diagnostics? diagnostics;
  // SearchPassMeta? searchPassMeta;
  // Null? queryId;
  // List<Null>? discoverSearchProductTypes;
  // Campaigns? campaigns;

  ProductsModel(
      {this.searchTerm,
      this.categoryName,
      this.itemCount,
      this.redirectUrl,
      this.products,
      // this.facets,
      // this.diagnostics,
      // this.searchPassMeta,
      // this.queryId,
      // this.discoverSearchProductTypes,
      // this.campaigns
      });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    searchTerm = json['searchTerm'];
    categoryName = json['categoryName'];
    // itemCount = json['itemCount'];
    redirectUrl = json['redirectUrl'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add( Products.fromJson(v));
      });
    }
    // if (json['facets'] != null) {
    //   facets = <Facets>[];
    //   json['facets'].forEach((v) {
    //     facets!.add(new Facets.fromJson(v));
    //   });
    // }
    // diagnostics = json['diagnostics'] != null
    //     ? new Diagnostics.fromJson(json['diagnostics'])
    //     : null;
    // searchPassMeta = json['searchPassMeta'] != null
    //     ? new SearchPassMeta.fromJson(json['searchPassMeta'])
    //     : null;
    // queryId = json['queryId'];
    // if (json['discoverSearchProductTypes'] != null) {
    //   discoverSearchProductTypes = <Null>[];
    //   json['discoverSearchProductTypes'].forEach((v) {
    //     discoverSearchProductTypes!.add(new Null.fromJson(v));
    //   });
    // }
    // campaigns = json['campaigns'] != null
    //     ? new Campaigns.fromJson(json['campaigns'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchTerm'] = searchTerm;
    data['categoryName'] = categoryName;
    data['itemCount'] = itemCount;
    data['redirectUrl'] = redirectUrl;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    // if (this.facets != null) {
    //   data['facets'] = this.facets!.map((v) => v.toJson()).toList();
    // }
    // if (this.diagnostics != null) {
    //   data['diagnostics'] = this.diagnostics!.toJson();
    // }
    // if (this.searchPassMeta != null) {
    //   data['searchPassMeta'] = this.searchPassMeta!.toJson();
    // }
    // data['queryId'] = this.queryId;
    // if (this.discoverSearchProductTypes != null) {
    //   data['discoverSearchProductTypes'] =
    //       this.discoverSearchProductTypes!.map((v) => v.toJson()).toList();
    // }
    // if (this.campaigns != null) {
    //   data['campaigns'] = this.campaigns!.toJson();
    // }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  Price? price;
  String? colour;
  // int? colourWayId;
  String? brandName;
  bool? hasVariantColours;
  bool? hasMultiplePrices;
  // Null? groupId;
  int? productCode;
  String? productType;
  String? url;
  String? imageUrl;
  List<String>? additionalImageUrls;
  // Null? videoUrl;
  bool? showVideo;
  bool? isSellingFast;
  // Null? sponsoredCampaignId;
  // List<FacetGroupings>? facetGroupings;
  // Null? advertisement;

  Products(
      {this.id,
      this.name,
      this.price,
      this.colour,
      // this.colourWayId,
      this.brandName,
      this.hasVariantColours,
      this.hasMultiplePrices,
      // this.groupId,
      this.productCode,
      this.productType,
      this.url,
      this.imageUrl,
      this.additionalImageUrls,
      // this.videoUrl,
      this.showVideo,
      this.isSellingFast,
      // this.sponsoredCampaignId,
      // this.facetGroupings,
      // this.advertisement
      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ?  Price.fromJson(json['price']) : null;
    colour = json['colour'];
    // colourWayId = json['colourWayId'];
    brandName = json['brandName'];
    hasVariantColours = json['hasVariantColours'];
    hasMultiplePrices = json['hasMultiplePrices'];
    // groupId = json['groupId'];
    // productCode = json['productCode'];
    productType = json['productType'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    additionalImageUrls = json['additionalImageUrls'].cast<String>();
    // videoUrl = json['videoUrl'];
    showVideo = json['showVideo'];
    isSellingFast = json['isSellingFast'];
    // sponsoredCampaignId = json['sponsoredCampaignId'];
    // if (json['facetGroupings'] != null) {
    //   facetGroupings = <FacetGroupings>[];
    //   json['facetGroupings'].forEach((v) {
    //     facetGroupings!.add(new FacetGroupings.fromJson(v));
    //   });
    // }
    // advertisement = json['advertisement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['colour'] = colour;
    // data['colourWayId'] = this.colourWayId;
    data['brandName'] = brandName;
    data['hasVariantColours'] = hasVariantColours;
    data['hasMultiplePrices'] = hasMultiplePrices;
    // data['groupId'] = this.groupId;
    data['productCode'] = productCode;
    data['productType'] = productType;
    data['url'] = url;
    data['imageUrl'] = imageUrl;
    data['additionalImageUrls'] = additionalImageUrls;
    // data['videoUrl'] = this.videoUrl;
    data['showVideo'] = showVideo;
    data['isSellingFast'] = isSellingFast;
    // data['sponsoredCampaignId'] = this.sponsoredCampaignId;
    // if (this.facetGroupings != null) {
    //   data['facetGroupings'] =
    //       this.facetGroupings!.map((v) => v.toJson()).toList();
    // }
    // data['advertisement'] = this.advertisement;
    return data;
  }
}

class Price {
  Current? current;
  // Previous? previous;
  // Rrp? rrp;
  bool? isMarkedDown;
  bool? isOutletPrice;
  String? currency;

  Price(
      {this.current,
      // this.previous,
      // this.rrp,
      this.isMarkedDown,
      this.isOutletPrice,
      this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ?  Current.fromJson(json['current']) : null;
    // previous = json['previous'] != null
    //     ? new Previous.fromJson(json['previous'])
    //     : null;
    // rrp = json['rrp'] != null ? new Rrp.fromJson(json['rrp']) : null;
    isMarkedDown = json['isMarkedDown'];
    isOutletPrice = json['isOutletPrice'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (current != null) {
      data['current'] = current!.toJson();
    }
    // if (this.previous != null) {
    //   data['previous'] = this.previous!.toJson();
    // }
    // if (this.rrp != null) {
    //   data['rrp'] = this.rrp!.toJson();
    // }
    data['isMarkedDown'] = isMarkedDown;
    data['isOutletPrice'] = isOutletPrice;
    data['currency'] = currency;
    return data;
  }
}

class Current {
  double? value;
  String? text;

  Current({this.value, this.text});

  Current.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;
    return data;
  }
}

// class Previous {
//   int? value;
//   String? text;

//   Previous({this.value, this.text});

//   Previous.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['text'] = this.text;
//     return data;
//   }
// }

// class Rrp {
//   Null? value;
//   String? text;

//   Rrp({this.value, this.text});

//   Rrp.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['text'] = this.text;
//     return data;
//   }
// }

// class FacetGroupings {
//   List<Products>? products;
//   String? type;

//   FacetGroupings({this.products, this.type});

//   FacetGroupings.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     data['type'] = this.type;
//     return data;
//   }
// }

// class Products {
//   int? productId;

//   Products({this.productId});

//   Products.fromJson(Map<String, dynamic> json) {
//     productId = json['productId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['productId'] = this.productId;
//     return data;
//   }
// }

// class Facets {
//   String? id;
//   String? name;
//   List<FacetValues>? facetValues;
//   String? displayStyle;
//   String? facetType;
//   bool? hasSelectedValues;

//   Facets(
//       {this.id,
//       this.name,
//       this.facetValues,
//       this.displayStyle,
//       this.facetType,
//       this.hasSelectedValues});

//   Facets.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['facetValues'] != null) {
//       facetValues = <FacetValues>[];
//       json['facetValues'].forEach((v) {
//         facetValues!.add(new FacetValues.fromJson(v));
//       });
//     }
//     displayStyle = json['displayStyle'];
//     facetType = json['facetType'];
//     hasSelectedValues = json['hasSelectedValues'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.facetValues != null) {
//       data['facetValues'] = this.facetValues!.map((v) => v.toJson()).toList();
//     }
//     data['displayStyle'] = this.displayStyle;
//     data['facetType'] = this.facetType;
//     data['hasSelectedValues'] = this.hasSelectedValues;
//     return data;
//   }
// }

// class FacetValues {
//   int? count;
//   String? id;
//   String? name;
//   bool? isSelected;

//   FacetValues({this.count, this.id, this.name, this.isSelected});

//   FacetValues.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     id = json['id'];
//     name = json['name'];
//     isSelected = json['isSelected'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['isSelected'] = this.isSelected;
//     return data;
//   }
// }

// class Diagnostics {
//   String? requestId;
//   int? processingTime;
//   int? queryTime;
//   bool? recommendationsEnabled;
//   RecommendationsAnalytics? recommendationsAnalytics;
//   bool? advertisementsEnabled;
//   AdvertisementsAnalytics? advertisementsAnalytics;

//   Diagnostics(
//       {this.requestId,
//       this.processingTime,
//       this.queryTime,
//       this.recommendationsEnabled,
//       this.recommendationsAnalytics,
//       this.advertisementsEnabled,
//       this.advertisementsAnalytics});

//   Diagnostics.fromJson(Map<String, dynamic> json) {
//     requestId = json['requestId'];
//     processingTime = json['processingTime'];
//     queryTime = json['queryTime'];
//     recommendationsEnabled = json['recommendationsEnabled'];
//     recommendationsAnalytics = json['recommendationsAnalytics'] != null
//         ? new RecommendationsAnalytics.fromJson(
//             json['recommendationsAnalytics'])
//         : null;
//     advertisementsEnabled = json['advertisementsEnabled'];
//     advertisementsAnalytics = json['advertisementsAnalytics'] != null
//         ? new AdvertisementsAnalytics.fromJson(json['advertisementsAnalytics'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['requestId'] = this.requestId;
//     data['processingTime'] = this.processingTime;
//     data['queryTime'] = this.queryTime;
//     data['recommendationsEnabled'] = this.recommendationsEnabled;
//     if (this.recommendationsAnalytics != null) {
//       data['recommendationsAnalytics'] =
//           this.recommendationsAnalytics!.toJson();
//     }
//     data['advertisementsEnabled'] = this.advertisementsEnabled;
//     if (this.advertisementsAnalytics != null) {
//       data['advertisementsAnalytics'] = this.advertisementsAnalytics!.toJson();
//     }
//     return data;
//   }
// }

// class RecommendationsAnalytics {
//   int? personalisationStatus;
//   int? numberOfItems;
//   int? numberOfRecs;
//   String? personalisationType;
//   String? experimentTrackerkey;
//   List<Null>? items;

//   RecommendationsAnalytics(
//       {this.personalisationStatus,
//       this.numberOfItems,
//       this.numberOfRecs,
//       this.personalisationType,
//       this.experimentTrackerkey,
//       this.items});

//   RecommendationsAnalytics.fromJson(Map<String, dynamic> json) {
//     personalisationStatus = json['personalisationStatus'];
//     numberOfItems = json['numberOfItems'];
//     numberOfRecs = json['numberOfRecs'];
//     personalisationType = json['personalisationType'];
//     experimentTrackerkey = json['experimentTrackerkey'];
//     if (json['items'] != null) {
//       items = <Null>[];
//       json['items'].forEach((v) {
//         items!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['personalisationStatus'] = this.personalisationStatus;
//     data['numberOfItems'] = this.numberOfItems;
//     data['numberOfRecs'] = this.numberOfRecs;
//     data['personalisationType'] = this.personalisationType;
//     data['experimentTrackerkey'] = this.experimentTrackerkey;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class AdvertisementsAnalytics {
//   int? status;
//   bool? customerOptIn;
//   int? numberOfItemsFromPartner;
//   List<Null>? items;
//   List<Null>? itemsFromPartner;
//   PlacementBeacons? placementBeacons;

//   AdvertisementsAnalytics(
//       {this.status,
//       this.customerOptIn,
//       this.numberOfItemsFromPartner,
//       this.items,
//       this.itemsFromPartner,
//       this.placementBeacons});

//   AdvertisementsAnalytics.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     customerOptIn = json['customerOptIn'];
//     numberOfItemsFromPartner = json['numberOfItemsFromPartner'];
//     if (json['items'] != null) {
//       items = <Null>[];
//       json['items'].forEach((v) {
//         items!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['itemsFromPartner'] != null) {
//       itemsFromPartner = <Null>[];
//       json['itemsFromPartner'].forEach((v) {
//         itemsFromPartner!.add(new Null.fromJson(v));
//       });
//     }
//     placementBeacons = json['placementBeacons'] != null
//         ? new PlacementBeacons.fromJson(json['placementBeacons'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['customerOptIn'] = this.customerOptIn;
//     data['numberOfItemsFromPartner'] = this.numberOfItemsFromPartner;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     if (this.itemsFromPartner != null) {
//       data['itemsFromPartner'] =
//           this.itemsFromPartner!.map((v) => v.toJson()).toList();
//     }
//     if (this.placementBeacons != null) {
//       data['placementBeacons'] = this.placementBeacons!.toJson();
//     }
//     return data;
//   }
// }

// class PlacementBeacons {
//   Null? onLoadBeacon;
//   Null? onViewBeacon;

//   PlacementBeacons({this.onLoadBeacon, this.onViewBeacon});

//   PlacementBeacons.fromJson(Map<String, dynamic> json) {
//     onLoadBeacon = json['onLoadBeacon'];
//     onViewBeacon = json['onViewBeacon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['onLoadBeacon'] = this.onLoadBeacon;
//     data['onViewBeacon'] = this.onViewBeacon;
//     return data;
//   }
// }

// class SearchPassMeta {
//   bool? isPartial;
//   bool? isSpellcheck;
//   List<Null>? searchPass;
//   List<Null>? alternateSearchTerms;

//   SearchPassMeta(
//       {this.isPartial,
//       this.isSpellcheck,
//       this.searchPass,
//       this.alternateSearchTerms});

//   SearchPassMeta.fromJson(Map<String, dynamic> json) {
//     isPartial = json['isPartial'];
//     isSpellcheck = json['isSpellcheck'];
//     if (json['searchPass'] != null) {
//       searchPass = <Null>[];
//       json['searchPass'].forEach((v) {
//         searchPass!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['alternateSearchTerms'] != null) {
//       alternateSearchTerms = <Null>[];
//       json['alternateSearchTerms'].forEach((v) {
//         alternateSearchTerms!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isPartial'] = this.isPartial;
//     data['isSpellcheck'] = this.isSpellcheck;
//     // if (this.searchPass != null) {
//     //   data['searchPass'] = this.searchPass!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.alternateSearchTerms != null) {
//     //   data['alternateSearchTerms'] =
//     //       this.alternateSearchTerms!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class Campaigns {
//   List<Null>? imageTiles;
//   List<Null>? promoBanners;
//   List<Null>? sponsoredProducts;

//   Campaigns({this.imageTiles, this.promoBanners, this.sponsoredProducts});

//   Campaigns.fromJson(Map<String, dynamic> json) {
//     if (json['imageTiles'] != null) {
//       imageTiles = <Null>[];
//       json['imageTiles'].forEach((v) {
//         imageTiles!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['promoBanners'] != null) {
//       promoBanners = <Null>[];
//       json['promoBanners'].forEach((v) {
//         promoBanners!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['sponsoredProducts'] != null) {
//       sponsoredProducts = <Null>[];
//       json['sponsoredProducts'].forEach((v) {
//         sponsoredProducts!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.imageTiles != null) {
//       data['imageTiles'] = this.imageTiles!.map((v) => v.toJson()).toList();
//     }
//     if (this.promoBanners != null) {
//       data['promoBanners'] = this.promoBanners!.map((v) => v.toJson()).toList();
//     }
//     if (this.sponsoredProducts != null) {
//       data['sponsoredProducts'] =
//           this.sponsoredProducts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
