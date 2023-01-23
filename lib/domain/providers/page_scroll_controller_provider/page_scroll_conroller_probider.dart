import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageScrollControllerProvider = Provider<ScrollController>(
  (ref) => ScrollController(),
);
