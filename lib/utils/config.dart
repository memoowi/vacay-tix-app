class Config {
  static const String baseUrl = "http://10.0.2.2:8000";
  static const String baseApiUrl = "$baseUrl/api";
  static const String loginUrl = "$baseApiUrl/login";
  static const String registerUrl = "$baseApiUrl/register";
  static const String logoutUrl = "$baseApiUrl/logout";
  static const String userUrl = "$baseApiUrl/user";

  static const String bookingUrl = "$baseApiUrl/bookings";
  static const String bookingDetailsUrl = "$baseApiUrl/bookings/details";

  static const String qrCodeUrl = "$baseApiUrl/qr-code";
  static const String generateQrCodeUrl = "$baseApiUrl/generate-qr-code";
}
