import 'package:finnogate_challenge/src/features/splash/presentation/bloc/splash_event.dart';
import 'package:finnogate_challenge/src/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashNavigatedTo>(_onNavigate);
  }

  _onNavigate(SplashNavigatedTo event, Emitter<SplashState> emit) async {
    emit(SplashNavigated());
  }
}
