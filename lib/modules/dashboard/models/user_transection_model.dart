import 'dart:convert';

class UserTransectionModel {
  String id;
  String itemName;
  String price;
  String brandName;
  String returnDate;
  String address;
  UserTransectionModel({
    required this.id,
    required this.itemName,
    required this.price,
    required this.brandName,
    required this.returnDate,
    required this.address,
  });

  UserTransectionModel copyWith({
    String? id,
    String? itemName,
    String? price,
    String? brandName,
    String? returnDate,
    String? address,
  }) {
    return UserTransectionModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      price: price ?? this.price,
      brandName: brandName ?? this.brandName,
      returnDate: returnDate ?? this.returnDate,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'itemName': itemName});
    result.addAll({'price': price});
    result.addAll({'brandName': brandName});
    result.addAll({'returnDate': returnDate});
    result.addAll({'address': address});

    return result;
  }

  factory UserTransectionModel.fromMap(Map<String, dynamic> map) {
    return UserTransectionModel(
      id: map['id'] ?? '',
      itemName: map['itemName'] ?? '',
      price: map['price'] ?? '',
      brandName: map['brandName'] ?? '',
      returnDate: map['returnDate'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTransectionModel.fromJson(String source) =>
      UserTransectionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserTransectionModel(id: $id, itemName: $itemName, price: $price, brandName: $brandName, returnDate: $returnDate, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserTransectionModel &&
        other.id == id &&
        other.itemName == itemName &&
        other.price == price &&
        other.brandName == brandName &&
        other.returnDate == returnDate &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemName.hashCode ^
        price.hashCode ^
        brandName.hashCode ^
        returnDate.hashCode ^
        address.hashCode;
  }
}
