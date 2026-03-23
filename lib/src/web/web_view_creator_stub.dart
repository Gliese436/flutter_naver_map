import "package:flutter/widgets.dart";

/// Stub — 웹이 아닌 플랫폼에서는 호출되지 않아야 합니다.
Widget createWebNaverMapView({
  required Map<String, dynamic> creationParams,
  required void Function(int id, dynamic jsMap) onMapCreated,
}) {
  throw UnsupportedError("Web NaverMap is not supported on this platform");
}
