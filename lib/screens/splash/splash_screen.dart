import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_constants.dart';
import '../../config/app_theme.dart';
import '../../config/app_sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(AppConstants.splashScreenDuration, () {
      if (mounted) {
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Background with decorative circles
          Positioned.fill(
            child: CustomPaint(
              painter: _CircleBackgroundPainter(),
            ),
          ),

          // Main Content
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              padding: const EdgeInsets.all(AppSizes.xxxl),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: AppSizes.xxl),

                  // App Name
                  Text(
                    AppConstants.appName,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppTheme.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSizes.lg),

                  // Version
                  Text(
                    'v${AppConstants.appVersion}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.secondaryColor,
                    ),
                  ),

                  const SizedBox(height: AppSizes.xxxl),

                  // Loading Indicator
                  const CircularProgressIndicator(
                    color: AppTheme.secondaryColor,
                    strokeWidth: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for background circles
class _CircleBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final positions = [
      (Offset(50, 50), 40.0),
      (Offset(size.width - 60, 80), 50.0),
      (Offset(size.width - 100, size.height - 120), 45.0),
      (Offset(60, size.height - 80), 35.0),
      (Offset(size.width * 0.7, size.height * 0.3), 60.0),
      (Offset(size.width * 0.2, size.height * 0.7), 55.0),
    ];

    for (var (offset, radius) in positions) {
      canvas.drawCircle(offset, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_CircleBackgroundPainter oldDelegate) => false;
}

