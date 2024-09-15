class ProductDetail {
  final String id;
  final String name;
  final String description;
  final double price;

  ProductDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  // JSONからProductDetailを生成するファクトリコンストラクタ
  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
    );
  }

  // ProductDetailをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}