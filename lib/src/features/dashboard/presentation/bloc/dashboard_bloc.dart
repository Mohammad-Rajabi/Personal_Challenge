import 'dart:async';

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
  late List<CoinModel> currentCoins;
  int currentPage = 1;
  final int perPage = 15;

  DashboardBloc({required RemoteCoinsDataSource remoteCoinsDataSource})
      : _remoteCoinsDataSource = remoteCoinsDataSource,
        super(DashboardLoading()) {
    on<DashboardStarted>(_onStarted);
    on<DashboardRetry>(_onRetry);
    on<DashboardCoinsFetchMore>(_onFetchCoinsMore);
    on<DashboardOnCoinClicked>(_onCoinClicked);
  }

  _onStarted(DashboardStarted event, Emitter<DashboardState> emit) async {
    try {
      final coinsResponse = await _remoteCoinsDataSource.getCoins(
          page: currentPage, perPage: perPage);
      currentCoins = List.from(coinsResponse,growable: true);
      emit(DashboardSuccess(coins: currentCoins,currentPage:currentPage));
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(DashboardNoInternet());
      } else {
        emit(DashboardFailure());
      }
    } catch (e) {
      emit(DashboardFailure());
    }
  }

  _onRetry(DashboardRetry event, Emitter<DashboardState> emit) {
    add(DashboardStarted());
  }

  _onFetchCoinsMore(
      DashboardCoinsFetchMore event, Emitter<DashboardState> emit) async {
    if (!event.hasReachedMax && !event.isCoinsFetching) {
      currentPage = event.currentPage + 1;
      final coins = await _remoteCoinsDataSource.getCoins(
          page: currentPage, perPage: perPage);
      currentCoins.addAll(coins);

      emit(DashboardSuccess(coins: currentCoins,currentPage: currentPage));
    }
  }

   _onCoinClicked(DashboardOnCoinClicked event, Emitter<DashboardState> emit) {
    emit(DashboardShowWebView(url: event.url));
  }
}
