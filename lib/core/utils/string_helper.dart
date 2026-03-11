class StringHelper {
  StringHelper._();

  static  String capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  static String formatId(String id) => 'Nº${id.toString().padLeft(3, '0')}';
}
