import 'dart:io';
import 'package:flutter/widgets.dart';

Widget buildSnapshotImage(dynamic snapshot) {
  return Image.file(File((snapshot as File).path));
}
