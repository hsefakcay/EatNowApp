class IconSizes {
  //static const double iconSmall = 16.0;
  //static const double iconMedium = 24.0;
  //static const double iconLarge = 32.0;
}

enum IconSize {
  extraSmall(12),
  small(16),
  normal(24),
  medium(32),
  large(48);

  // Constructor
  const IconSize(this.value);

  final double value;
}
