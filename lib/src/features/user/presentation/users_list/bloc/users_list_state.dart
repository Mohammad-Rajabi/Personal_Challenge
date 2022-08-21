part of 'users_list_bloc.dart';

abstract class UsersListState extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersListLoadingState extends UsersListState {}

class UsersListSuccessState extends UsersListState {
  List<UserModel> users;
  bool hasReachedMax;
  bool isUsersFetching;
  int currentPage;

  UsersListSuccessState(
      {required this.users,
      required this.currentPage,
      this.hasReachedMax = false,
      this.isUsersFetching = false});

  UsersListSuccessState copyWith(
      {List<UserModel>? users,
      bool? hasReachedMax,
      bool? isUsersFetching,
      int? currentPage}) {
    return UsersListSuccessState(
        users: users ?? this.users,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        isUsersFetching: isUsersFetching ?? this.isUsersFetching,
        currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object> get props => [users, hasReachedMax, isUsersFetching];
}

class UsersListNoInternetState extends UsersListState {}

class UsersListFailureState extends UsersListState {}

class UsersListNavigatedToUserProfileScreenState extends UsersListState {
  UserModel user;

  UsersListNavigatedToUserProfileScreenState({required this.user});

  @override
  List<Object> get props => [user];
}
