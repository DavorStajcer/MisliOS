import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'window_size_state.freezed.dart';

@freezed
class WindowSizeState with _$WindowSizeState {
  const factory WindowSizeState.undefined() = Undefined;
  const factory WindowSizeState.full(Size size) = Full;
  const factory WindowSizeState.medium(Size size) = Medium;
  const factory WindowSizeState.small(Size size) = Small;
}
