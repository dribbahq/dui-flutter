extension StringExtension on String {
  String capitalize() {
    try {
      return "${this[0].toUpperCase()}${substring(1)}";
    } catch (e) {
      return this;
    }
  }
}
