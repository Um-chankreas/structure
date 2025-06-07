extension FormatString on String {
  double toDoubleOrAero() => double.tryParse(this) ?? 0.0;
  int toIntOrZero() => int.tryParse(this) ?? 0;
}
