bool get isAndroid => false;

bool get isIOS => false;

bool get isWeb => true;

String get operatingSystemName => "web";

File createFile(String path) =>
    throw UnsupportedError("File operations are not supported on web");

/// Stub File class for web platform where dart:io is not available.
class File {
  final String path;
  File(this.path);
}
