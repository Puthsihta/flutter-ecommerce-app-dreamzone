import 'package:dreamzone/constants/constants.dart';
import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(
  locale: 'en_US', // Use 'en_US' for USD currency format
  symbol: '\$', // Dollar sign symbol
);

List<dynamic> objectToArray(object) {
  List<dynamic> array = [];

  object.forEach((
    key,
    value,
  ) {
    array.add({});
  });

  return array;
}

String checkOrderStatus(int orderStatus) {
  switch (orderStatus) {
    case OrderStatus.pending:
      return "Pending";
    case OrderStatus.confirm:
      return "Confirm";
    case OrderStatus.delivery:
      return "Delivering";
    case OrderStatus.cancel:
      return "Cancelled";
    case OrderStatus.complete:
      return "Complete";
  }
  return "";
}
