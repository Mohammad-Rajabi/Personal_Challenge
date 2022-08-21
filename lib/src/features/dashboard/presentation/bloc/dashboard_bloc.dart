import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:finnogate_challenge/src/exceptions/NoInternetException.dart';
import 'package:finnogate_challenge/src/features/dashboard/data/remote_user_date_source.dart';
import 'package:finnogate_challenge/src/features/dashboard/domain/coin_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  RemoteCoinsDataSource _remoteCoinsDataSource;
  int currentPage = 1;
  final int perPage = 15;
  late List<CoinModel> coins;

  DashboardBloc({required RemoteCoinsDataSource remoteCoinsDataSource})
      : _remoteCoinsDataSource = remoteCoinsDataSource,
        super(DashboardLoadingState()) {
    on<DashboardStartedEvent>(_onStarted);
    on<DashboardRetryEvent>(_onRetry);
    on<DashboardCoinsFetchMoreEvent>(_onFetchCoinsMore);
    on<DashboardOnCoinClickedEvent>(_onCoinClicked);
  }

  _onStarted(DashboardStartedEvent event, Emitter<DashboardState> emit) async {
    try {
      final coinsResponse = await _remoteCoinsDataSource.getCoins(
          page: currentPage, perPage: perPage);
      coins = List.from(coinsResponse, growable: true);
      emit(DashboardSuccessState(
          coins: List.from(coinsResponse, growable: true),
          currentPage: currentPage));
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(DashboardNoInternetState());
      } else {
        emit(DashboardFailureState());
      }
    } catch (e) {
      emit(DashboardFailureState());
    }
  }

  _onRetry(DashboardRetryEvent event, Emitter<DashboardState> emit) {
    add(DashboardStartedEvent());
  }

  _onFetchCoinsMore(
      DashboardCoinsFetchMoreEvent event, Emitter<DashboardState> emit) async {
    if (!event.hasReachedMax && !event.isCoinsFetching) {
      emit(DashboardSuccessState(
          coins: this.coins, currentPage: currentPage, isCoinsFetching: true));

      currentPage = event.currentPage + 1;

      final coins = await _remoteCoinsDataSource.getCoins(
          page: currentPage, perPage: perPage);

      this.coins.addAll(coins);

      emit(DashboardSuccessState(
          coins: this.coins, currentPage: currentPage, isCoinsFetching: false));
    }
  }

  _onCoinClicked(
      DashboardOnCoinClickedEvent event, Emitter<DashboardState> emit) {
    emit(DashboardNavigatedToWebViewScreenState(url: event.url));
  }
}
