class Order {
  final String id; // Unique identifier for each order
  final String name;
  final String resto;
  final String image;
  final int price;

  Order({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.resto,
  });
}
