import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_loading_state.freezed.dart';

@freezed
class HomePageLoadingState with _$HomePageLoadingState {
  const factory HomePageLoadingState.failure(String message) = _Failure;
  const factory HomePageLoadingState.loading() = _Loading;
  const factory HomePageLoadingState.allDataFetched() = _AllDataFetched;
}
