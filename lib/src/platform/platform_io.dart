import "dart:io" as io;

export "dart:io" show File;

bool get isAndroid => io.Platform.isAndroid;

bool get isIOS => io.Platform.isIOS;

bool get isWeb => false;

String get operatingSystemName => io.Platform.operatingSystem;

io.File createFile(String path) => io.File(path);
