import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_fashion_mobile/core/ui/resource/icon_path.dart';
import 'package:fresh_fashion_mobile/core/ui/style/base_color.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/domain/usecase/language_usecase.dart';

class LanguageModel {
  LanguageModel({
    required this.code,
    required this.name,
    required this.flag,
    required this.systemLanguageTranslation,
  });

  final String? code;
  final String name;
  final Widget flag;
  final String systemLanguageTranslation;
}

class SystemLanguage extends LanguageModel {
  SystemLanguage([String? currentLanguageCode])
      : super(
          code: null,
          name: translateSystemLanguageByCode(currentLanguageCode),
          flag: Container(
            height: 24,
            width: 24,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: BaseColor.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(IconPath.phone),
          ),
          systemLanguageTranslation: "",
        );
}

class Vietnamese extends LanguageModel {
  Vietnamese()
      : super(
          code: "vi",
          name: "Tiếng Việt",
          flag: SvgPicture.asset(IconPath.vietnamese),
          systemLanguageTranslation: "Ngôn ngữ hệ thống",
        );
}

class English extends LanguageModel {
  English()
      : super(
          code: "en",
          name: "English",
          flag: SvgPicture.asset(IconPath.english),
          systemLanguageTranslation: "System language",
        );
}

String translateSystemLanguageByCode(String? code) {
  if (code == null) return "System language";
  String result = "System language";
  allSupportedLanguages().forEach((element) {
    if (code == element.code) result = element.systemLanguageTranslation;
  });
  return result;
}
