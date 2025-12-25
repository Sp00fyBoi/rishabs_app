import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppInitializer {
  /// Initialize all app configurations and services
  static Future<void> initialize() async {
    // Load environment variables
    await _loadEnvironment();

    // Initialize other services
    await _initializeServices();
  }

  /// Load environment variables from .env file
  static Future<void> _loadEnvironment() async {
    try {
      await dotenv.load(fileName: ".env");
      print('✓ Environment variables loaded');
    } catch (e) {
      print('✗ Error loading environment: $e');
    }
  }

  /// Initialize app services (Firebase, Analytics, etc.)
  static Future<void> _initializeServices() async {
    try {
      // Add service initialization here
      // Example:
      // await Firebase.initializeApp();
      // await Analytics.initialize();

      print('✓ App services initialized');
    } catch (e) {
      print('✗ Error initializing services: $e');
    }
  }
}
