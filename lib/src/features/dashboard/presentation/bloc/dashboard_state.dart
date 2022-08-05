part of 'dashboard_bloc.dart';


abstract class DashboardState extends Equatable{

  @override
  List<Object> get props=>[];
}

class DashboardLoading extends DashboardState {}

class DashboardNoInternet extends DashboardState {}

class DashboardFailure extends DashboardState {}

class DashboardSuccess extends DashboardState {
  List<CoinModel> coins;
  bool hasReachedMax;
  bool isCoinsFetching;
  int currentPage;

  DashboardSuccess({required this.coins,required this.currentPage,this.hasReachedMax = false,this.isCoinsFetching=false});

  DashboardSuccess copyWith({
    List<CoinModel>? coins,
    bool? hasReachedMax,
    int? currentPage
  }) {
    return DashboardSuccess(
      coins: coins ?? this.coins,
      currentPage: currentPage?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
  @override
  List<Object> get props=>[coins,hasReachedMax,currentPage];
}

class DashboardShowWebView extends DashboardState{
String url;
  DashboardShowWebView({required this.url});
}


