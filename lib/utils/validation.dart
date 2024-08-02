import 'package:dreamzone/constants/constants.dart';

String checkOrderStatusLottie(int orderStatus) {
  switch (orderStatus) {
    case OrderStatus.pending:
      return 'assets/jsons/pending.json';
    case OrderStatus.confirm:
      return 'assets/jsons/comfirm.json';
    case OrderStatus.delivery:
      return 'assets/jsons/tracking.json';
    case OrderStatus.complete:
      return 'assets/jsons/complete.json';
    default:
      return ''; // when no color match
  }
}

class TextFieldValidate {
  static String? validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
      ).hasMatch(value)) {
        return 'Invalid Email Address';
      }
    }
    return null;
  }
}

String validateInputPassword(String input) {
  // Your validation logic here
  String errorMessage = "";
  if (input.isEmpty) {
    errorMessage = "Invalid password";
  } else if (input.length < 6) {
    errorMessage = "Password must be at least 6 characters";
  }
  return errorMessage;
}

String validateInputPhone(String input) {
  // Your validation logic here
  String errorMessage = "";
  if (input.isEmpty) {
    errorMessage = "Required";
  } else if (input.length < 8) {
    errorMessage = "Invalid phone number";
  }
  return errorMessage;
}
