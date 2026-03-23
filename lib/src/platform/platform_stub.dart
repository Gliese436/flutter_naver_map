// Stub implementation - used as fallback for conditional imports.
// This file should never be imported directly.

bool get isAndroid =>
    throw UnsupportedError("Cannot determine platform without dart:io or dart:html");

bool get isIOS =>
    throw UnsupportedError("Cannot determine platform without dart:io or dart:html");

bool get isWeb => false;

String get operatingSystemName =>
    throw UnsupportedError("Cannot determine platform without dart:io or dart:html");

File createFile(String path) =>
    throw UnsupportedError("File operations are not supported on this platform");

/// Stub File class for platforms where dart:io is not available.
class File {
  final String path;
  File(this.path);
}
