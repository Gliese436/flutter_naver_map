// ignore_for_file: non_constant_identifier_names

import "dart:js_interop";
import "package:web/web.dart" as web;

/* ───────────────── Global Accessors ───────────────── */

@JS("naver.maps")
external JSNaverMaps get naverMaps;

@JS("naver.maps.Event")
external JSNaverMapsEvent get naverMapsEvent;

/* ───────────────── naver.maps namespace ───────────────── */

extension type JSNaverMaps._(JSObject _) implements JSObject {
  external JSNaverMap Map(web.HTMLElement mapDiv, [JSMapOptions? options]);
  external JSLatLng LatLng(JSNumber lat, JSNumber lng);
  external JSLatLngBounds LatLngBounds(JSLatLng sw, JSLatLng ne);
  external JSPoint Point(JSNumber x, JSNumber y);
  external JSSize Size(JSNumber width, JSNumber height);
  external JSMarker Marker(JSMarkerOptions options);
  external JSPolyline Polyline(JSPolylineOptions options);
  external JSPolygon Polygon(JSPolygonOptions options);
  external JSCircle Circle(JSCircleOptions options);
  external JSInfoWindow InfoWindow(JSInfoWindowOptions options);
  external JSGroundOverlay GroundOverlay(
      JSString url, JSLatLngBounds bounds, JSGroundOverlayOptions options);
}

/* ───────────────── Event ───────────────── */

extension type JSNaverMapsEvent._(JSObject _) implements JSObject {
  external JSMapEventListener addListener(
      JSObject target, JSString eventName, JSFunction handler);
  external void removeListener(JSMapEventListener listener);
}

extension type JSMapEventListener._(JSObject _) implements JSObject {}

/* ───────────────── LatLng ───────────────── */

extension type JSLatLng._(JSObject _) implements JSObject {
  external JSNumber lat();
  external JSNumber lng();
}

JSLatLng createLatLng(double lat, double lng) =>
    naverMaps.LatLng(lat.toJS, lng.toJS);

/* ───────────────── LatLngBounds ───────────────── */

extension type JSLatLngBounds._(JSObject _) implements JSObject {
  external JSLatLng getSW();
  external JSLatLng getNE();
  external JSLatLng getCenter();
}

JSLatLngBounds createLatLngBounds(JSLatLng sw, JSLatLng ne) =>
    naverMaps.LatLngBounds(sw, ne);

/* ───────────────── Point ───────────────── */

extension type JSPoint._(JSObject _) implements JSObject {
  external JSNumber get x;
  external JSNumber get y;
}

JSPoint createPoint(double x, double y) =>
    naverMaps.Point(x.toJS, y.toJS);

/* ───────────────── Size ───────────────── */

extension type JSSize._(JSObject _) implements JSObject {
  external JSNumber get width;
  external JSNumber get height;
}

/* ───────────────── MapOptions ───────────────── */

extension type JSMapOptions._(JSObject _) implements JSObject {
  external factory JSMapOptions({
    JSLatLng? center,
    JSNumber? zoom,
    JSNumber? minZoom,
    JSNumber? maxZoom,
    JSBoolean? draggable,
    JSBoolean? scrollWheel,
    JSBoolean? pinchZoom,
    JSBoolean? disableDoubleClickZoom,
    JSBoolean? disableDoubleTapZoom,
    JSBoolean? disableTwoFingerTapZoom,
    JSBoolean? tiltEnabled,
    JSBoolean? rotateEnabled,
    JSBoolean? logoControl,
    JSBoolean? mapDataControl,
    JSBoolean? scaleControl,
    JSBoolean? zoomControl,
    JSString? mapTypeId,
    JSNumber? tilt,
    JSNumber? bearing,
  });
}

/* ───────────────── Map ───────────────── */

extension type JSNaverMap._(JSObject _) implements JSObject {
  external void setCenter(JSLatLng latlng);
  external JSLatLng getCenter();
  external void setZoom(JSNumber zoom, [JSBoolean? effect]);
  external JSNumber getZoom();
  external void panTo(JSLatLng latlng, [JSObject? transitionOptions]);
  external void panBy(JSPoint point);
  external void morph(JSLatLng coord, [JSNumber? zoom, JSObject? options]);
  external void updateBy(JSLatLng coord, JSNumber zoom);
  external void fitBounds(JSObject bounds, [JSObject? options]);
  external JSLatLngBounds getBounds();
  external JSMapProjection getProjection();
  external JSObject getSize();
  external void setSize(JSSize size);
  external JSString getMapTypeId();
  external void setMapTypeId(JSString typeId);
  external JSNumber getMinZoom();
  external JSNumber getMaxZoom();
  external void setOptions(JSAny keyOrOptions, [JSAny? value]);
  external void destroy();
  external void autoResize();
  external void refresh([JSBoolean? noEffect]);
}

/* ───────────────── Projection ───────────────── */

extension type JSMapProjection._(JSObject _) implements JSObject {
  external JSLatLng fromPagePixelToCoord(JSPoint pixel);
  external JSPoint fromCoordToPagePixel(JSLatLng coord);
}

/* ───────────────── MarkerOptions ───────────────── */

extension type JSMarkerOptions._(JSObject _) implements JSObject {
  external factory JSMarkerOptions({
    JSLatLng position,
    JSNaverMap? map,
    JSObject? icon,
    JSString? title,
    JSBoolean? clickable,
    JSBoolean? draggable,
    JSBoolean? visible,
    JSNumber? zIndex,
  });
}

/* ───────────────── Marker ───────────────── */

extension type JSMarker._(JSObject _) implements JSObject {
  external void setMap(JSNaverMap? map);
  external JSNaverMap? getMap();
  external void setPosition(JSLatLng position);
  external JSLatLng getPosition();
  external void setIcon(JSAny icon);
  external JSAny getIcon();
  external void setVisible(JSBoolean visible);
  external JSBoolean getVisible();
  external void setZIndex(JSNumber zIndex);
  external JSNumber getZIndex();
  external void setClickable(JSBoolean clickable);
  external void setDraggable(JSBoolean draggable);
  external void setTitle(JSString title);
  external void setOptions(JSAny keyOrOptions, [JSAny? value]);
}

/* ───────────────── ImageIcon (for Marker icon) ───────────────── */

extension type JSImageIcon._(JSObject _) implements JSObject {
  external factory JSImageIcon({
    JSString url,
    JSSize? size,
    JSSize? scaledSize,
    JSPoint? origin,
    JSPoint? anchor,
  });
}

/* ───────────────── HtmlIcon (for Marker icon) ───────────────── */

extension type JSHtmlIcon._(JSObject _) implements JSObject {
  external factory JSHtmlIcon({
    JSString content,
    JSSize? size,
    JSPoint? anchor,
  });
}

/* ───────────────── PolylineOptions ───────────────── */

extension type JSPolylineOptions._(JSObject _) implements JSObject {
  external factory JSPolylineOptions({
    JSNaverMap? map,
    JSArray<JSLatLng> path,
    JSString? strokeColor,
    JSNumber? strokeWeight,
    JSNumber? strokeOpacity,
    JSString? strokeLineCap,
    JSString? strokeLineJoin,
    JSArray<JSNumber>? strokeStyle,
    JSBoolean? clickable,
    JSBoolean? visible,
    JSNumber? zIndex,
  });
}

/* ───────────────── Polyline ───────────────── */

extension type JSPolyline._(JSObject _) implements JSObject {
  external void setMap(JSNaverMap? map);
  external JSNaverMap? getMap();
  external void setPath(JSArray<JSLatLng> path);
  external JSArray<JSLatLng> getPath();
  external void setOptions(JSAny keyOrOptions, [JSAny? value]);
  external void setVisible(JSBoolean visible);
  external void setZIndex(JSNumber zIndex);
  external void setStyles(JSObject styles);
}

/* ───────────────── PolygonOptions ───────────────── */

extension type JSPolygonOptions._(JSObject _) implements JSObject {
  external factory JSPolygonOptions({
    JSNaverMap? map,
    JSArray<JSArray<JSLatLng>> paths,
    JSString? fillColor,
    JSNumber? fillOpacity,
    JSString? strokeColor,
    JSNumber? strokeWeight,
    JSNumber? strokeOpacity,
    JSBoolean? clickable,
    JSBoolean? visible,
    JSNumber? zIndex,
  });
}

/* ───────────────── Polygon ───────────────── */

extension type JSPolygon._(JSObject _) implements JSObject {
  external void setMap(JSNaverMap? map);
  external JSNaverMap? getMap();
  external void setPaths(JSArray<JSArray<JSLatLng>> paths);
  external void setOptions(JSAny keyOrOptions, [JSAny? value]);
  external void setVisible(JSBoolean visible);
  external void setZIndex(JSNumber zIndex);
}

/* ───────────────── CircleOptions ───────────────── */

extension type JSCircleOptions._(JSObject _) implements JSObject {
  external factory JSCircleOptions({
    JSNaverMap? map,
    JSLatLng center,
    JSNumber radius,
    JSString? fillColor,
    JSNumber? fillOpacity,
    JSString? strokeColor,
    JSNumber? strokeWeight,
    JSNumber? strokeOpacity,
    JSBoolean? clickable,
    JSBoolean? visible,
    JSNumber? zIndex,
  });
}

/* ───────────────── Circle ───────────────── */

extension type JSCircle._(JSObject _) implements JSObject {
  external void setMap(JSNaverMap? map);
  external JSNaverMap? getMap();
  external void setCenter(JSLatLng center);
  external void setRadius(JSNumber radius);
  external void setOptions(JSAny keyOrOptions, [JSAny? value]);
  external void setVisible(JSBoolean visible);
  external void setZIndex(JSNumber zIndex);
}

/* ───────────────── InfoWindowOptions ───────────────── */

extension type JSInfoWindowOptions._(JSObject _) implements JSObject {
  external factory JSInfoWindowOptions({
    JSString? content,
    JSLatLng? position,
    JSNumber? maxWidth,
    JSPoint? pixelOffset,
    JSNumber? zIndex,
    JSBoolean? disableAutoPan,
  });
}

/* ───────────────── InfoWindow ───────────────── */

extension type JSInfoWindow._(JSObject _) implements JSObject {
  external void open(JSNaverMap map, [JSObject? anchor]);
  external void close();
  external void setContent(JSString content);
  external void setPosition(JSLatLng position);
  external void setOptions(JSAny keyOrOptions, [JSAny? value]);
  external JSNaverMap? getMap();
  external void setZIndex(JSNumber zIndex);
}

/* ───────────────── GroundOverlayOptions ───────────────── */

extension type JSGroundOverlayOptions._(JSObject _) implements JSObject {
  external factory JSGroundOverlayOptions({
    JSNaverMap? map,
    JSNumber? opacity,
    JSBoolean? clickable,
  });
}

/* ───────────────── GroundOverlay ───────────────── */

extension type JSGroundOverlay._(JSObject _) implements JSObject {
  external void setMap(JSNaverMap? map);
  external JSNaverMap? getMap();
  external void setOpacity(JSNumber opacity);
  external void setBounds(JSLatLngBounds bounds);
}

/* ───────────────── Utility: Color conversion ───────────────── */

/// Flutter Color를 CSS rgba 문자열로 변환합니다.
String colorToCssString(int colorValue) {
  final a = ((colorValue >> 24) & 0xFF) / 255.0;
  final r = (colorValue >> 16) & 0xFF;
  final g = (colorValue >> 8) & 0xFF;
  final b = colorValue & 0xFF;
  return "rgba($r, $g, $b, ${a.toStringAsFixed(2)})";
}

/// Flutter Color를 CSS hex 문자열로 변환합니다 (opacity 별도).
String colorToHexString(int colorValue) {
  final r = (colorValue >> 16) & 0xFF;
  final g = (colorValue >> 8) & 0xFF;
  final b = colorValue & 0xFF;
  return "#${r.toRadixString(16).padLeft(2, "0")}"
      "${g.toRadixString(16).padLeft(2, "0")}"
      "${b.toRadixString(16).padLeft(2, "0")}";
}

double colorToOpacity(int colorValue) {
  return ((colorValue >> 24) & 0xFF) / 255.0;
}
