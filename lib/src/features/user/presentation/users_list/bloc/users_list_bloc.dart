import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:finnogate_challenge/src/features/user/data/remote_user_date_source.dart';
import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:finnogate_challenge/src/exceptions/NoInternetException.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_list_event.dart';

part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  RemoteUserDataSource _remoteUserDataSource;
  int currentPage = 1;
  late List<UserModel> users;
  bool keepAlive = false;
   double usersListScrollOffset = 0;

  UsersListBloc({required RemoteUserDataSource remoteUserDataSource})
      : _remoteUserDataSource = remoteUserDataSource,
        super(UsersListLoadingState()) {
    on<UsersListStartedEvent>(_onStarted);
    on<UsersListRetryEvent>(_onRetry);
    on<UsersListNavigateToUserProfileScreenEvent>(_onNavigatedTo);
    on<UsersListFetchMoreEvent>(_onFetchUsersMore);
    on<UsersListSaveScrollOffsetEvent>(_onSaveScrollOffset);
  }

  _onStarted(UsersListStartedEvent event, Emitter<UsersListState> emit) async {
    if (!keepAlive) {
      keepAlive= true;
      try {
        final usersListApiResponse =
            await _remoteUserDataSource.getUsers(currentPage);
        users = List.from(usersListApiResponse.users, growable: true);
        emit(UsersListSuccessState(
            users: List.from(usersListApiResponse.users, growable: true),
            currentPage: currentPage));
      } on DioError catch (dioError) {
        if (dioError.type == DioErrorType.other &&
            dioError.error is NoInternetException) {
          emit(UsersListNoInternetState());
        } else {
          emit(UsersListFailureState());
        }
      } catch (e) {
        emit(UsersListFailureState());
      }
    }
  }

  _onRetry(UsersListRetryEvent event, Emitter<UsersListState> emit) {
    add(UsersListStartedEvent());
  }

  _onNavigatedTo(UsersListNavigateToUserProfileScreenEvent event,
      Emitter<UsersListState> emit) {
    emit(UsersListNavigatedToUserProfileScreenState(user: event.user));
  }

  _onFetchUsersMore(
      UsersListFetchMoreEvent event, Emitter<UsersListState> emit) async {
    if (!event.hasReachedMax && !event.isUsersFetching) {
      emit(UsersListSuccessState(
          users: users, currentPage: currentPage, isUsersFetching: true));
      currentPage = event.currentPage + 1;

      final usersListApiResponse =
          await _remoteUserDataSource.getUsers(currentPage);

      users.addAll(usersListApiResponse.users);

      emit(UsersListSuccessState(
        users: users,
        currentPage: currentPage,
        hasReachedMax:
            (usersListApiResponse.page == usersListApiResponse.totalPages),
        isUsersFetching: false,
      ));
    }
  }

   _onSaveScrollOffset(UsersListSaveScrollOffsetEvent event, Emitter<UsersListState> emit) {
      usersListScrollOffset = event.scrollOffset;
  }
}
