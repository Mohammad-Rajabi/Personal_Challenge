part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DashboardStarted extends DashboardEvent {}

class DashboardRetry extends DashboardEvent {}

class DashboardScrolled extends DashboardEvent {}

class DashboardCoinsFetchMore extends DashboardEvent {
  bool hasReachedMax;
  int currentPage;
  bool isCoinsFetching;

  DashboardCoinsFetchMore({required this.hasReachedMax,required this.currentPage,required this.isCoinsFetching});
}

class DashboardOnCoinClicked extends DashboardEvent{
String url;
  DashboardOnCoinClicked({required this.url});
}

