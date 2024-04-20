import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(
  locale: 'en_US', // Use 'en_US' for USD currency format
  symbol: '\$', // Dollar sign symbol
);

// String getGenderText(BuildContext context) {
//     if (gender == null) {
//       return '';
//     }
//     if (gender?.toLowerCase() == 'Male'.toLowerCase()) {
//       return context.l10n.registrationInputLabelMale;
//     }
//     if (gender?.toLowerCase() == 'Female'.toLowerCase()) {
//       return context.l10n.registrationInputLabelFemale;
//     }
//     return '';
//   }