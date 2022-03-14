class TextUtils {
  String textCapitalize(String text) {
    String textCapitalized = "";

    textCapitalized = text.replaceFirst(text[0], text[0].toUpperCase());

    return textCapitalized;
  }
}
