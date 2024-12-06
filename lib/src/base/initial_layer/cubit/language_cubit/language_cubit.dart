import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fashion_mobile/generated/l10n.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/data/model/language_model.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/domain/usecase/language_usecase.dart';
import 'package:fresh_fashion_mobile/src/common/utils/controller/snackbar_controller.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  String? _languageCode;

  final useCase = LanguageUseCase();

  LanguageCubit() : super(LanguageInitialState());

  Future<void> setupLanguage() async {
    String? currentLanguageCode = await useCase.getCurrentLanguageCode();
    String? systemLanguageCode;
    List<Locale> systemLocales = await useCase.getSystemLocales();
    for (var locale in systemLocales) {
      if (S.delegate.isSupported(locale)) {
        systemLanguageCode = locale.languageCode;
        break;
      }
    }
    _languageCode = currentLanguageCode;
    emit(SetupSuccessLanguageState(currentLanguageCode, systemLanguageCode));
  }

  Future changeLanguage({
    String? languageCode,
    String? notifyLanguageCode,
  }) async {
    await useCase.setLanguageCode(languageCode).whenComplete(() async {
      await setupLanguage();
      await Future.delayed(const Duration(seconds: 1));
      showSnackBar(content: S.current.txt_update_language_notify, state: SnackBarState.success);
    });
  }

  String? getLanguageCode() => _languageCode;

  List<LanguageModel> getSupportedLanguages(String? currentLanguageCode) => useCase.getSupportedLanguages(currentLanguageCode);
}
