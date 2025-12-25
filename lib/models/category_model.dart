class Category {
  final String id;
  final String name;
  final String icon;
  final int itemCount;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.itemCount,
  });
}

class Order {
  final String id;
  final String itemName;
  final String status;
  final DateTime orderDate;
  final double amount;
  final String? image;

  Order({
    required this.id,
    required this.itemName,
    required this.status,
    required this.orderDate,
    required this.amount,
    this.image,
  });
}
