import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misli_os_app/domain/models/misli_os_stats.dart';

part 'main_image_state.freezed.dart';

@freezed
class MainImageState with _$MainImageState {
  const factory MainImageState.failure(String message) = _Failure;
  const factory MainImageState.loading() = _Loading;
  const factory MainImageState.data(String imageUrl) = _Data;
}
