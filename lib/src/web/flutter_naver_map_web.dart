import "package:flutter_web_plugins/flutter_web_plugins.dart";

/// Web plugin registration for flutter_naver_map.
class FlutterNaverMapWebPlugin {
  static void registerWith(Registrar registrar) {
    // 웹에서는 MethodChannel 대신 JS interop을 직접 사용하므로
    // 별도의 채널 등록은 필요하지 않습니다.
    // platform view factory는 NaverMap 위젯 초기화 시 등록됩니다.
  }
}
