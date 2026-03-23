import "dart:async";
import "dart:js_interop";
import "dart:ui_web" as ui_web;

import "package:flutter/widgets.dart";
import "package:web/web.dart" as web;

import "naver_maps_js_interop.dart";

/// 웹에서 네이버 지도를 표시하기 위한 View 위젯입니다.
class WebNaverMapView extends StatefulWidget {
  final Map<String, dynamic> creationParams;
  final void Function(int id, JSNaverMap jsMap) onMapCreated;

  const WebNaverMapView({
    super.key,
    required this.creationParams,
    required this.onMapCreated,
  });

  @override
  State<WebNaverMapView> createState() => _WebNaverMapViewState();
}

class _WebNaverMapViewState extends State<WebNaverMapView> {
  static int _nextViewId = 9000;
  late final int _viewId;
  late final String _viewType;
  JSNaverMap? _jsMap;

  @override
  void initState() {
    super.initState();
    _viewId = _nextViewId++;
    _viewType = "flutter_naver_map_web_$_viewId";

    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final div = web.document.createElement("div") as web.HTMLDivElement;
      div.id = "naver_map_$_viewId";
      div.style.width = "100%";
      div.style.height = "100%";

      // 지도 초기화는 DOM에 div가 추가된 후에 수행해야 합니다.
      Future.microtask(() => _initializeMap(div));

      return div;
    });
  }

  void _initializeMap(web.HTMLDivElement div) {
    final params = widget.creationParams;

    // 초기 카메라 위치 추출
    final initialCameraPosition = params["initialCameraPosition"];
    JSLatLng? center;
    double zoom = 11;

    if (initialCameraPosition is Map) {
      final target = initialCameraPosition["target"];
      if (target is Map) {
        final lat = (target["lat"] as num?)?.toDouble() ?? 37.5666102;
        final lng = (target["lng"] as num?)?.toDouble() ?? 126.9783881;
        center = createLatLng(lat, lng);
      }
      zoom = (initialCameraPosition["zoom"] as num?)?.toDouble() ?? 11;
    }

    center ??= createLatLng(37.5666102, 126.9783881);

    // 맵 옵션 구성
    final mapOptions = JSMapOptions(
      center: center,
      zoom: zoom.toJS,
      draggable: (params["scrollGesturesEnable"] as bool? ?? true).toJS,
      scrollWheel: (params["zoomGesturesEnable"] as bool? ?? true).toJS,
      pinchZoom: (params["zoomGesturesEnable"] as bool? ?? true).toJS,
      rotateEnabled: (params["rotateGesturesEnable"] as bool? ?? true).toJS,
      tiltEnabled: (params["tiltGesturesEnable"] as bool? ?? true).toJS,
      disableDoubleClickZoom:
          (!(params["zoomGesturesEnable"] as bool? ?? true)).toJS,
      logoControl: true.toJS,
      mapDataControl: true.toJS,
      scaleControl: false.toJS,
      zoomControl: false.toJS,
    );

    final jsMap = naverMaps.Map(div, mapOptions);

    // 맵 타입 설정
    final mapTypeRaw = params["mapType"];
    if (mapTypeRaw is int) {
      final mapTypeId = _mapTypeIntToString(mapTypeRaw);
      if (mapTypeId != null) {
        jsMap.setMapTypeId(mapTypeId.toJS);
      }
    }
    _jsMap = jsMap;

    widget.onMapCreated(_viewId, jsMap);
  }

  String? _mapTypeIntToString(int mapType) {
    switch (mapType) {
      case 0:
        return "NORMAL";
      case 1:
        return "SATELLITE";
      case 2:
        return "TERRAIN";
      case 3:
        return "NORMAL"; // navi → NORMAL fallback
      case 4:
        return "HYBRID";
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }

  @override
  void dispose() {
    _jsMap?.destroy();
    super.dispose();
  }
}
