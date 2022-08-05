part of 'users_list_bloc.dart';

abstract class UsersListState extends Equatable{

  @override
  List<Object> get props=>[];
}

class UsersListLoading extends UsersListState {}

class UsersListSuccess extends UsersListState {
  UsersListApiResponse data;
  bool hasReachedMax;
  bool isUsersFetching;

  UsersListSuccess({required this.data,this.hasReachedMax = false,this.isUsersFetching=false});

  UsersListSuccess copyWith({
    UsersListApiResponse? data,
    bool? hasReachedMax
  }) {
    return UsersListSuccess(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
  @override
  List<Object> get props=>[data,hasReachedMax];
}


class UsersListNoInternet extends UsersListState {}

class UsersListFailure extends UsersListState {}

class UsersListNavigatedToUserProfileScreen extends UsersListState {
UserModel user;
  UsersListNavigatedToUserProfileScreen({required this.user});
@override
List<Object> get props=>[user];
}
