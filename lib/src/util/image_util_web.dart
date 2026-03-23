import "dart:convert" show base64Encode;
import "dart:typed_data" show Uint8List;

import "package:crypto/crypto.dart" show sha256;

class ImageUtil {
  static final Map<String, String> _dataUrlMap = {};

  static Future<String> saveImage(Uint8List bytes, [String? cacheKey]) async {
    final key = cacheKey ?? _generateImageHashFromBytes(bytes);
    if (_dataUrlMap.containsKey(key)) {
      return _dataUrlMap[key]!;
    }
    final dataUrl = "data:image/png;base64,${base64Encode(bytes)}";
    _dataUrlMap[key] = dataUrl;
    return dataUrl;
  }

  static String _generateImageHashFromBytes(Uint8List bytes) {
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
