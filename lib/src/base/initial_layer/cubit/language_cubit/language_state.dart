part of 'language_cubit.dart';

abstract class LanguageState {}

class LanguageInitialState extends LanguageState {}

class SetupSuccessLanguageState extends LanguageState {
  SetupSuccessLanguageState(this.languageCode, this.systemLanguageCode);

  final dynamic languageCode;
  final dynamic systemLanguageCode;

  List<Object> get props => [languageCode, systemLanguageCode];
}
