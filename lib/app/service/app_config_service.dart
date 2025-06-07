class AppConfig {
  static bool isNotNullOrEmpty(dynamic value) {
    if (value == null) return false;
    final stringValue = value.toString().trim();
    return stringValue.isNotEmpty && stringValue != 'null';
  }
}
