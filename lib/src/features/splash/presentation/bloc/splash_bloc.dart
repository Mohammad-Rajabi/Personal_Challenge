import 'package:finnogate_challenge/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:finnogate_challenge/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashNavigateToAuthScreenEvent>(_onNavigate);
  }

  _onNavigate(SplashNavigateToAuthScreenEvent event, Emitter<SplashState> emit) async {
    emit(SplashNavigatedToAuthScreenState());
  }
}
