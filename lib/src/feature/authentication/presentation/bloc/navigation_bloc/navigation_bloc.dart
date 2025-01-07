import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Cubit<int> {
  NavigationBloc() : super(0);

  changeSelectedIndex(newIndex) => emit(newIndex);
}
