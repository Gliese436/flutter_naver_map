import "dart:developer";

import "package:flutter/foundation.dart" show kIsWeb;
import "package:flutter/services.dart";
import "package:flutter_naver_map/flutter_naver_map.dart";
import "package:flutter_naver_map/src/messaging/messaging.dart";
import "package:meta/meta.dart";

import "package:flutter_naver_map/src/platform/platform_stub.dart"
    if (dart.library.io) "package:flutter_naver_map/src/platform/platform_io.dart"
    if (dart.library.js_interop) "package:flutter_naver_map/src/platform/platform_web.dart"
    as platform_info;

class FlutterNaverMap {
  @internal
  static bool isInitialized = false;

  @internal
  static int? androidSdkVersion;

  Function(NAuthFailedException ex)? onAuthFailed;

  /// 지도 사용 전에 호출해야 하는 초기화 메서드입니다.
  ///
  /// Naver Cloud Platform의 새로운 인증을 지원합니다.
  ///
  /// NCP 콘솔 좌측 사이드바의
  ///
  /// [Services > Application Services > Maps](https://console.ncloud.com/maps/application)에서
  /// [Application 등록](https://console.ncloud.com/maps/application/create)을 클릭 후,
  ///
  /// API 선택에서 "Dynamic Map"을 체크합니다.
  ///
  /// 이후, 인증정보에서 Client ID 값을 확인하실 수 있습니다.
  Future<void> init({
    String? clientId,
    Function(NAuthFailedException ex)? onAuthFailed,
  }) async {
    if (kIsWeb) {
      // 웹에서는 index.html의 script 태그로 JS SDK가 로딩됨.
      // MethodChannel은 사용하지 않음.
      isInitialized = true;
      log("SDK Initialized! (web)", name: "FlutterNaverMap");
      return;
    }

    if (!isInitialized) {
      NChannel.sdkChannel.setMethodCallHandler(_handler);
    }

    this.onAuthFailed = onAuthFailed;

    final result = await NChannel.sdkChannel.invokeMethod("initializeNcp",
        {"clientId": clientId, "setAuthFailedListener": onAuthFailed != null});

    if (result != null) androidSdkVersion = result["androidSdkVersion"];
    isInitialized = true;

    log("SDK Initialized! (${platform_info.operatingSystemName}${platform_info.isAndroid ? ", SDK $androidSdkVersion" : ""})",
        name: "FlutterNaverMap");
  }

  @internal
  Future<String?> getNativeMapSdkVersion() async {
    if (kIsWeb) return null;
    final version = await NChannel.sdkChannel.invokeMethod<String>(
        "getNativeMapSdkVersion");
    return version;
  }

  Future<void> _handler(MethodCall call) async {
    if (call.method == "onAuthFailed" && onAuthFailed != null) {
      onAuthFailed!.call(NAuthFailedException.fromMessageable(call.arguments));
    }
  }
}
