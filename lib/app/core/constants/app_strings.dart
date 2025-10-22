/// Uygulama genelinde kullanılan string sabitleri
/// Bu dosya hardcoded string'leri önlemek ve merkezi yönetim sağlamak için oluşturulmuştur
class AppStrings {
  // Private constructor - Bu sınıf sadece static member'lar içerir
  AppStrings._();

  // ==================== API & URL'ler ====================
  static const String baseImageUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
  static const String animationPath = "lib/app/assets/animations/food_animation.json";

  // ==================== UI Text'leri ====================
  static const String nameSurnameLabel = "Name Surname";
  static const String nameSurnameHint = "Hüseyin Sefa";
  static const String phoneNumber = "+90 507 XXXX XX";
  static const String emailHint = "hsaforwork@gmail.com";

  // ==================== Currency & Formatting ====================
  static const String currencySymbol = "₺";
  static const String percentageSymbol = "%";
  static const String likePercentage = "87";

  // ==================== Validation Messages ====================
  static const String emptyString = "";
  static const String zeroQuantity = "0";

  // ==================== Debug & Log Messages ====================
  static const String favoriteFoodLog = "favori yemek";
  static const String unknownErrorLog = "Unknown error:";

  // ==================== UI Constants ====================
  static const String likePercentagePrefix = "% ";
  static const String likePercentageSuffix = " Beğenildi";

  // ==================== Color Hex Values ====================
  static const String lightGreyColorHex = "0xffF7F7F9";

  // ==================== Icon & UI Constants ====================
  static const double shadowSpreadRadius = 10.0;
  static const double shadowBlurRadius = 30.0;
  static const double borderRadius = 14.0;
  static const double circleBorderRadius = 24.0;

  // ==================== Validation Patterns ====================
  static const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String phonePattern = r'^\+90[0-9]{10}$';

  // ==================== Error Messages ====================
  static const String networkErrorMessage = "Network error occurred";
  static const String validationErrorMessage = "Validation error occurred";
  static const String unknownErrorMessage = "Unknown error occurred";

  // ==================== Success Messages ====================
  static const String successMessage = "Operation completed successfully";
  static const String favoriteAddedMessage = "Added to favorites";
  static const String favoriteRemovedMessage = "Removed from favorites";

  // ==================== Loading Messages ====================
  static const String loadingMessage = "Loading...";
  static const String processingMessage = "Processing...";

  // ==================== Default Values ====================
  static const int defaultQuantity = 1;
  static const int defaultOrderQuantity = 0;
  static const double defaultHeight = 200.0;
  static const double defaultWidth = 0.22;
  static const double defaultScreenHeight = 0.05;
  static const double defaultScreenWidth = 0.27;

  // ==================== Animation & Asset Paths ====================
  static const String lottieAnimationPath = "lib/app/assets/animations/food_animation.json";
  static const String databasePath = "lib/app/assets/database/yemek_soyle.sqlite";

  // ==================== API Endpoints ====================
  static const String foodsEndpoint = "/yemekler";
  static const String cartEndpoint = "/sepet";
  static const String favoritesEndpoint = "/favoriler";

  // ==================== Storage Keys ====================
  static const String userEmailKey = "user_email";
  static const String userPasswordKey = "user_password";
  static const String favoriteFoodsKey = "favorite_foods";
  static const String cartItemsKey = "cart_items";

  // ==================== Theme & Styling ====================
  static const String fontFamily = "Roboto";
  static const double defaultFontSize = 16.0;
  static const double smallFontSize = 14.0;
  static const double largeFontSize = 18.0;

  // ==================== Navigation Routes ====================
  static const String homeRoute = "/home";
  static const String cartRoute = "/cart";
  static const String favoritesRoute = "/favorites";
  static const String profileRoute = "/profile";
  static const String loginRoute = "/login";
  static const String signupRoute = "/signup";
  static const String detailRoute = "/detail";

  // ==================== Feature Flags ====================
  static const bool enableDebugMode = true;
  static const bool enableAnalytics = false;
  static const bool enableCrashReporting = true;

  // ==================== Time Constants ====================
  static const int snackbarDuration = 3000; // milliseconds
  static const int animationDuration = 300; // milliseconds
  static const int debounceDelay = 500; // milliseconds

  // ==================== Size Constants ====================
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  // ==================== Grid Constants ====================
  static const int gridCrossAxisCount = 2;
  static const double gridChildAspectRatio = 1 / 1.6;
  static const double gridMainAxisSpacing = 10.0;
  static const double gridCrossAxisSpacing = 5.0;

  // ==================== Cart Constants ====================
  static const double cartCardAspectRatio = 1 / 0.4;
  static const double cartImageWidth = 0.22;
  static const double cartControlsWidth = 0.27;

  // ==================== Detail Page Constants ====================
  static const double detailImageHeight = 0.05;
  static const double detailButtonHeight = 0.08;
  static const double detailButtonWidth = 0.5;
}
