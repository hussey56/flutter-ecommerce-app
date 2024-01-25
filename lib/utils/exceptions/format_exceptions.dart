import 'package:ecom3/utils/exceptions/platform_exceptions.dart';

class HFormatExceptions implements Exception {
  final String message;

  const HFormatExceptions(
      [this.message =
          "An unexpected format error is occured. Please check again later"]);

  factory HFormatExceptions.fromMessage(String message) {
    return HFormatExceptions(message);
  }

  String get formattedMessage => message;

  factory HFormatExceptions.fromCode(String code) {
    switch (code) {
      case "dfs":
        return const HFormatExceptions('jsdfksdhfa');
      default:
        return const HFormatExceptions('jsdfksdhfa');
    }
  }
}
