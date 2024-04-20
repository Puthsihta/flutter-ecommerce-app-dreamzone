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
