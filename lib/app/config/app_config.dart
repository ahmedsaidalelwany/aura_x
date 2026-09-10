import '../../core/constants/app_constants.dart';

abstract final class AppConfig {
  static const name = AppConstants.appName;
  static const aurExtension = AppConstants.fileExtension;
  static const formatVersion = AppConstants.formatVersion;
  static const offlineFirst = true;
  static const googleDriveOptional = true;
}
