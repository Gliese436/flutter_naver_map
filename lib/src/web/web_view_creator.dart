import "package:flutter/widgets.dart";

import "naver_maps_js_interop.dart";
import "web_map_view.dart";

/// 웹 플랫폼에서 NaverMap 뷰를 생성합니다.
Widget createWebNaverMapView({
  required Map<String, dynamic> creationParams,
  required void Function(int id, dynamic jsMap) onMapCreated,
}) {
  return WebNaverMapView(
    creationParams: creationParams,
    onMapCreated: (int id, JSNaverMap jsMap) {
      onMapCreated(id, jsMap);
    },
  );
}
