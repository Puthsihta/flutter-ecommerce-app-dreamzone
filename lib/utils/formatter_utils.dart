abstract class FormatterUtils {
  static String formatDateTime() {
    return "";
  }

  static String isPluralItems(int qtyItem) {
    String isPlural = '';

    if (qtyItem <= 1 && qtyItem >= 0) {
      isPlural;
    } else {
      isPlural = 's';
    }

    return isPlural;
  }
}
