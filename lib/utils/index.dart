import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/l10n/l10n.dart';
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

String checkOrderStatus(int orderStatus, AppLocalizations? l10n) {
  switch (orderStatus) {
    case OrderStatus.pending:
      return l10n!.pending;
    case OrderStatus.confirm:
      return l10n!.confirm;
    case OrderStatus.delivery:
      return l10n!.deliverying;
    case OrderStatus.cancel:
      return l10n!.cancel;
    case OrderStatus.complete:
      return l10n!.complete;
  }
  return "";
}
