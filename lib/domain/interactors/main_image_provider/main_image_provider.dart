import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/data/repository/general_info_repository.dart';
import 'package:misli_os_app/domain/interactors/main_image_provider/main_image_state.dart';

final mainImageProvider =
    StateNotifierProvider<MainImageNotifier, MainImageState>((ref) {
  final generalRepo = ref.read(generalRepositoryProvider);
  return MainImageNotifier(generalRepo)..fetchStats();
});

class MainImageNotifier extends StateNotifier<MainImageState> {
  final GeneralInfoRepository _generalRepository;
  MainImageNotifier(this._generalRepository)
      : super(const MainImageState.loading());

  Future<void> fetchStats() async {
    state = const MainImageState.loading();
    try {
      final mainImageUrl = await _generalRepository.getMainImageUrl();
      state = MainImageState.data(mainImageUrl);
    } on AppException catch (e) {
      state = MainImageState.failure(e.message);
    }
  }

  reloadHomePage({bool force = false}) {
    state.maybeWhen(
      data: (_) async {
        if (force) {
          await fetchStats();
        }
      },
      orElse: () async => await fetchStats(),
    );
  }
}
