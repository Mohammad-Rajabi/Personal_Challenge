part of 'users_list_bloc.dart';

abstract class UsersListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersListStarted extends UsersListEvent {}

class UsersListRetry extends UsersListEvent {}

class UsersListFetchMore extends UsersListEvent {
  bool hasReachedMax;
  int currentPage;
  bool isUsersFetching;

  UsersListFetchMore({required this.hasReachedMax,required this.currentPage,required this.isUsersFetching});
}

class UsersListNavigateToUserProfileScreen extends UsersListEvent {
  UserModel user;

  UsersListNavigateToUserProfileScreen({required this.user});
}
