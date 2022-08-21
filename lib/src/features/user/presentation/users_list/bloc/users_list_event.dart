part of 'users_list_bloc.dart';

abstract class UsersListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersListStartedEvent extends UsersListEvent {}

class UsersListRetryEvent extends UsersListEvent {}

class UsersListFetchMoreEvent extends UsersListEvent {
  bool hasReachedMax;
  int currentPage;
  bool isUsersFetching;

  UsersListFetchMoreEvent(
      {required this.hasReachedMax,
      required this.currentPage,
      required this.isUsersFetching});
}

class UsersListNavigateToUserProfileScreenEvent extends UsersListEvent {
  UserModel user;

  UsersListNavigateToUserProfileScreenEvent({required this.user});
}

class UsersListSaveScrollOffsetEvent extends UsersListEvent {
  double scrollOffset;

  UsersListSaveScrollOffsetEvent({required this.scrollOffset});
}
