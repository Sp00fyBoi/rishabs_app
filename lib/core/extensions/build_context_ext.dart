import 'package:flutter/material.dart';
import '../../config/app_theme.dart';
import '../../config/app_sizes.dart';

extension BuildContextExtension on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  // Colors
  Color get primaryColor => AppTheme.primaryColor;
  Color get secondaryColor => AppTheme.secondaryColor;
  Color get backgroundColor => AppTheme.backgroundColor;
  Color get textPrimaryColor => AppTheme.textPrimary;
  Color get textSecondaryColor => AppTheme.textSecondary;
  Color get borderColor => AppTheme.borderColor;

  // Device Info
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
  bool get isDesktop => screenWidth >= 1200;

  // Padding & Margins
  EdgeInsets get screenPadding => const EdgeInsets.all(AppSizes.screenPaddingHorizontal);
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: AppSizes.screenPaddingHorizontal);
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: AppSizes.screenPaddingVertical);

  // Navigation
  void pop<T>([T? result]) => Navigator.pop(this, result);
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }
}
