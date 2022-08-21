part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DashboardStartedEvent extends DashboardEvent {}

class DashboardRetryEvent extends DashboardEvent {}

class DashboardScrolledEvent extends DashboardEvent {}

class DashboardCoinsFetchMoreEvent extends DashboardEvent {
  bool hasReachedMax;
  int currentPage;
  bool isCoinsFetching;

  DashboardCoinsFetchMoreEvent({required this.hasReachedMax,required this.currentPage,required this.isCoinsFetching});
}

class DashboardOnCoinClickedEvent extends DashboardEvent{
String url;
  DashboardOnCoinClickedEvent({required this.url});
}

