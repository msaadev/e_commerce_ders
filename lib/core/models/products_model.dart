class ProductModel {
  int? id;
  String? productName;
  String? type;
  double? oldPrice;
  double? newPrice;
  String? productImage;
  int? quantity;
  String? currentStore;

  ProductModel(
      {this.id,
      this.productName,
      this.type,
      this.oldPrice,
      this.newPrice,
      this.productImage,
      this.quantity,
      this.currentStore});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    type = json['type'];
    oldPrice = json['oldPrice'];
    newPrice = json['newPrice'];
    productImage = json['productImage'];
    quantity = json['quantity'];
    currentStore = json['currentStore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['type'] = type;
    data['oldPrice'] = oldPrice;
    data['newPrice'] = newPrice;
    data['productImage'] = productImage;
    data['quantity'] = quantity;
    data['currentStore'] = currentStore;
    return data;
  }
}
