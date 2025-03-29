import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit( {      bool isDark=false
    }
  ) : super(ThemeState(isDark: isDark));

  void toggleTheme() {
    emit(ThemeState(isDark: !state.isDark));
  }
  setDarkMode()=>emit(ThemeState(isDark: true));
  setLightMode()=>emit(ThemeState(isDark: false));
}
