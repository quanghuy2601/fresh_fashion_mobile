import 'package:fresh_fashion_mobile/src/base/initial_layer/cubit/language_cubit/language_cubit.dart';
import 'package:fresh_fashion_mobile/src/base/validation_layer/cubit/validation_cubit.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _configureDependentBloc();
  _configureDependentController();
}

Future<void> _configureDependentBloc() async {
  GetIt.instance.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  GetIt.instance.registerLazySingleton<ValidationCubit>(() => ValidationCubit());
  GetIt.instance.registerSingleton<NavigationBloc>(NavigationBloc());
}

Future<void> _configureDependentController() async {
  //
}
