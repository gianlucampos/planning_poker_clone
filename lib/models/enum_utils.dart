class EnumUtils {
  static T valueOf<T>(List<T> enumValues, String value) {
    return enumValues.singleWhere((elem) => _getStringValue(elem) == value);
  }

  static String _getStringValue(dynamic enumValue) {
    return enumValue.toString().split('.')[1];
  }
}
