import 'package:flutter/widgets.dart';

/// AppPadding sınıfı, uygulamanın genel padding (dış boşluk) değerlerini
/// merkezi bir şekilde yönetmek için oluşturulmuştur.
///
/// Tüm değerler sabit olarak tanımlanmıştır ve yalnızca statik şekilde kullanılabilir.
class AppPadding {
  AppPadding._();

  static const double xSmall = 8.0;
  static const double small = 12.0;
  static const double regular = 14.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double xLarge = 24.0;

  static const EdgeInsets horizontalxSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontalNormal = EdgeInsets.symmetric(horizontal: 12.0); // 12.0 için
  static const EdgeInsets horizontalRegular = EdgeInsets.symmetric(horizontal: 14.0); // 14.0 için

  static const EdgeInsets allxSmall = EdgeInsets.all(xSmall);
  static const EdgeInsets allSmall = EdgeInsets.all(small);
  static const EdgeInsets allRegular = EdgeInsets.all(regular);
  static const EdgeInsets allMedium = EdgeInsets.all(medium);
  static const EdgeInsets allLarge = EdgeInsets.all(large);
  static const EdgeInsets allxLarge = EdgeInsets.all(xLarge);

  static const EdgeInsets rightLarge = EdgeInsets.only(right: 30.0); // Sağ için 30.0
  static const EdgeInsets rightNormal = EdgeInsets.only(right: small);

   static const EdgeInsets leftSmall = EdgeInsets.only(right: small);

  static const EdgeInsets bottomMedium = EdgeInsets.only(bottom: medium);

  static const EdgeInsets customLargeSmall = EdgeInsets.only(
    top: 10,
    left: 30,
    bottom: 10,
    right: 30,
  ); // Özel bir padding
}
