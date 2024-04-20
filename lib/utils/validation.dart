String checkOrderStatusLottie(String orderStatus) {
  switch (orderStatus) {
    case "Pending":
      return 'assets/jsons/pending.json';
    case "Confirm":
      return 'assets/jsons/comfirm.json';
    case "Delivery":
      return 'assets/jsons/tracking.json';
    case "Complete":
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

  static String? validateDescription(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return 'lease tell us so we can make improvements';
  }

  static String? validatePhoneNumber(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return 'Please enter a valid phone number';
  }
}
