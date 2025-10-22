import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Eat Now'**
  String get appName;

  /// No description provided for @cartViewTitle.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get cartViewTitle;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price:'**
  String get price;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get count;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @dropdownValue.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical Ascending'**
  String get dropdownValue;

  /// No description provided for @sortByPriceDescending.
  ///
  /// In en, this message translates to:
  /// **'Price Descending'**
  String get sortByPriceDescending;

  /// No description provided for @sortByAlphabeticalAscending.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical Ascending'**
  String get sortByAlphabeticalAscending;

  /// No description provided for @sortByAlphabeticalDescending.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical Descending'**
  String get sortByAlphabeticalDescending;

  /// No description provided for @sortByPriceAscending.
  ///
  /// In en, this message translates to:
  /// **'Price Ascending'**
  String get sortByPriceAscending;

  /// No description provided for @productDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetailTitle;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'25-35 min'**
  String get deliveryTime;

  /// No description provided for @freeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get freeDelivery;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'10% Discount'**
  String get discount;

  /// No description provided for @snackBarTitleZeroOrder.
  ///
  /// In en, this message translates to:
  /// **'Cannot place an order with 0 items'**
  String get snackBarTitleZeroOrder;

  /// No description provided for @liked.
  ///
  /// In en, this message translates to:
  /// **'Liked'**
  String get liked;

  /// No description provided for @shippingCost.
  ///
  /// In en, this message translates to:
  /// **'Shipping Cost:'**
  String get shippingCost;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @searchInFoodSoyle.
  ///
  /// In en, this message translates to:
  /// **'Search in Eat Now'**
  String get searchInFoodSoyle;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @addFavoriteFood.
  ///
  /// In en, this message translates to:
  /// **'Add Favorite Food...'**
  String get addFavoriteFood;

  /// No description provided for @passwordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordTitle;

  /// No description provided for @emailTitle.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get emailTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginTitle;

  /// No description provided for @notAMemberSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Not a member? '**
  String get notAMemberSubtitle;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpTitle;

  /// No description provided for @haveAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccountTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @orderHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistoryTitle;

  /// No description provided for @liveSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Live Support'**
  String get liveSupportTitle;

  /// No description provided for @addressesTitle.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get addressesTitle;

  /// No description provided for @paymentMethodsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethodsTitle;

  /// No description provided for @contactPreferencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Preferences'**
  String get contactPreferencesTitle;

  /// No description provided for @logoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logoutTitle;

  /// No description provided for @confirmCart.
  ///
  /// In en, this message translates to:
  /// **'Confirm Cart'**
  String get confirmCart;

  /// No description provided for @orderPreparing.
  ///
  /// In en, this message translates to:
  /// **'Your order is being prepared...'**
  String get orderPreparing;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @paymentTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentTitle;

  /// No description provided for @deliveryAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddressTitle;

  /// No description provided for @changeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeTitle;

  /// No description provided for @paymentMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethodTitle;

  /// No description provided for @addNewCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Card'**
  String get addNewCardTitle;

  /// No description provided for @orderSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummaryTitle;

  /// No description provided for @subtotalTitle.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotalTitle;

  /// No description provided for @creditCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCardTitle;

  /// No description provided for @cashOnDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDeliveryTitle;

  /// No description provided for @completeOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete Order'**
  String get completeOrderTitle;

  /// No description provided for @cardNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumberTitle;

  /// No description provided for @expiryDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDateTitle;

  /// No description provided for @cvvTitle.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvvTitle;

  /// No description provided for @errorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get errorWeakPassword;

  /// No description provided for @errorEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'An account already exists with that email.'**
  String get errorEmailAlreadyInUse;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No user found for that email.'**
  String get errorUserNotFound;

  /// No description provided for @errorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password provided for that user.'**
  String get errorWrongPassword;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred.'**
  String get errorUnknown;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get errorUnexpected;

  /// No description provided for @orderConfirmedTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmed!'**
  String get orderConfirmedTitle;

  /// No description provided for @orderConfirmedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order has been successfully created and is being prepared.'**
  String get orderConfirmedSubtitle;

  /// No description provided for @orderNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumberTitle;

  /// No description provided for @estimatedDeliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Estimated Delivery Time'**
  String get estimatedDeliveryTime;

  /// No description provided for @deliveryTimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'25-35 minutes'**
  String get deliveryTimeMinutes;

  /// No description provided for @orderDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetailsTitle;

  /// No description provided for @continueShoppingTitle.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShoppingTitle;

  /// No description provided for @trackOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrderTitle;

  /// No description provided for @orderStatusPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get orderStatusPreparing;

  /// No description provided for @orderStatusOnTheWay.
  ///
  /// In en, this message translates to:
  /// **'On the Way'**
  String get orderStatusOnTheWay;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderStatusDelivered;

  /// No description provided for @thankYouMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing Eat Now!'**
  String get thankYouMessage;

  /// No description provided for @orderTotalTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Total'**
  String get orderTotalTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
