part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {}

class DashboardNoInternetState extends DashboardState {}

class DashboardFailureState extends DashboardState {}

class DashboardSuccessState extends DashboardState {
  List<CoinModel> coins;
  bool hasReachedMax;
  bool isCoinsFetching;
  int currentPage;

  DashboardSuccessState(
      {required this.coins,
      required this.currentPage,
      this.hasReachedMax = false,
      this.isCoinsFetching = false});

  DashboardSuccessState copyWith(
      {List<CoinModel>? coins,
      bool? hasReachedMax,
      bool? isCoinsFetching,
      int? currentPage}) {
    return DashboardSuccessState(
        coins: coins ?? this.coins,
        currentPage: currentPage ?? this.currentPage,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        isCoinsFetching: isCoinsFetching ?? this.isCoinsFetching);
  }

  @override
  List<Object> get props => [coins, hasReachedMax, currentPage];
}

class DashboardNavigatedToWebViewScreenState extends DashboardState {
  String url;

  DashboardNavigatedToWebViewScreenState({required this.url});
}
