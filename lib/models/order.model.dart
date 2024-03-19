class Order {
  int id;
  String invoiceNumber;
  int totalItem;
  int totalPrice;
  String status;
  String orderDate;

  Order({
    required this.id,
    required this.invoiceNumber,
    required this.totalItem,
    required this.totalPrice,
    required this.status,
    required this.orderDate,
  });
}
