import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(
  locale: 'en_US', // Use 'en_US' for USD currency format
  symbol: '\$', // Dollar sign symbol
);
