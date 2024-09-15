class Item {
  final String id;
  final String name;
  final int price;

  Item({
    required this.id,
    required this.name,
    required this.price,
  });

  // JSONからItemを生成するファクトリコンストラクタ
  factory Item.fromJson(Map<String, dynamic> json, String id) {
    return Item(
      id: id,
      name: json['name'] as String,
      price: json['price'] as int,
    );
  }

  // ItemをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}