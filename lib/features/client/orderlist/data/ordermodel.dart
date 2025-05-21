class Item {
  final String description;
  final String id;
  final String name;
  final String resto;
  final String resto_id;
  final String image;
  final int price;
  int quantity;

  Item({
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.resto,
    this.resto_id = "1",
    this.quantity = 1,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'].toString(),
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      resto: json['resto'],
      // Optional: use provided quantity or fallback to 1
      quantity: json['quantity'] ?? 1,
      // Optional: use provided resto_id or fallback to "1"
      resto_id: json['resto_id']?.toString() ?? "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'resto': resto,
      'quantity': quantity,
      'resto_id': resto_id,
    };
  }
}
