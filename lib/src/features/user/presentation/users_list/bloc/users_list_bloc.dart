import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:finnogate_challenge/src/features/user/data/remote_user_date_source.dart';
import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:finnogate_challenge/src/features/user/domain/users_list_api_response/users_list_api_response.dart';
import 'package:finnogate_challenge/src/exceptions/NoInternetException.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_list_event.dart';

part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  RemoteUserDataSource _remoteUserDataSource;
  late List<UserModel> currentUsers;
  int currentPage = 1;

  UsersListBloc({required RemoteUserDataSource remoteUserDataSource})
      : _remoteUserDataSource = remoteUserDataSource,
        super(UsersListLoading()) {
    on<UsersListStarted>(_onStarted);
    on<UsersListRetry>(_onRetry);
    on<UsersListNavigateToUserProfileScreen>(_onNavigatedTo);
    on<UsersListFetchMore>(_onFetchUsersMore);
  }

  _onStarted(UsersListStarted event, Emitter<UsersListState> emit) async {
    try {
      final usersListApiResponse =
          await _remoteUserDataSource.getUsers(currentPage);
      currentUsers = List.from(usersListApiResponse.users,growable: true);
      emit(UsersListSuccess(data: usersListApiResponse));
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other &&
          dioError.error is NoInternetException) {
        emit(UsersListNoInternet());
      } else {
        emit(UsersListFailure());
      }
    } catch (e) {
      emit(UsersListFailure());
    }
  }

  _onRetry(UsersListRetry event, Emitter<UsersListState> emit) {
    add(UsersListStarted());
  }

  _onNavigatedTo(UsersListNavigateToUserProfileScreen event,
      Emitter<UsersListState> emit) {
    emit(UsersListNavigatedToUserProfileScreen(user: event.user));
  }

  _onFetchUsersMore(
      UsersListFetchMore event, Emitter<UsersListState> emit) async {
    if (!event.hasReachedMax && !event.isUsersFetching) {
      final usersListApiResponse =
          await _remoteUserDataSource.getUsers(event.currentPage + 1);
      currentUsers.addAll(usersListApiResponse.users);
      if (usersListApiResponse.page == usersListApiResponse.totalPages) {
        emit(UsersListSuccess(
            data: usersListApiResponse.copyWith(users: currentUsers),
            hasReachedMax: true));
      } else {
        emit(UsersListSuccess(
            data: usersListApiResponse.copyWith(users: currentUsers)));
      }
    }
  }
}
