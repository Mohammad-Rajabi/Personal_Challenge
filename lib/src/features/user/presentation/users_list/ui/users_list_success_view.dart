import 'package:cached_network_image/cached_network_image.dart';
import 'package:finnogate_challenge/src/common_widgets/bottom_loading.dart';
import 'package:finnogate_challenge/src/features/user/presentation/users_list/bloc/users_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListSuccessView extends StatefulWidget {
  final ThemeData themeData;

  const UsersListSuccessView({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  @override
  State<UsersListSuccessView> createState() => UsersListSuccessViewState();
}

class UsersListSuccessViewState extends State<UsersListSuccessView> {
  double itemExtent = 150;

  late UsersListSuccessState state;

  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _listScrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _listScrollController
        .animateTo(context.read<UsersListBloc>().usersListScrollOffset,
            duration: const Duration(milliseconds: 10), curve: Curves.elasticIn));
  }

  void _onScroll() {
    if (_listScrollController.position.atEdge &&
        _listScrollController.position.pixels != 0) {
      context.read<UsersListBloc>().add(UsersListFetchMoreEvent(
          currentPage: state.currentPage,
          hasReachedMax: state.hasReachedMax,
          isUsersFetching: state.isUsersFetching));
    }

    context.read<UsersListBloc>().add(UsersListSaveScrollOffsetEvent(
        scrollOffset: _listScrollController.offset));
  }

  @override
  Widget build(BuildContext context) {
    state = (context.read<UsersListBloc>().state) as UsersListSuccessState;

    return SizedBox(
      height: itemExtent * state.users.length,
      child: ListView.builder(
          itemCount:
              state.hasReachedMax ? state.users.length : state.users.length + 1,
          controller: _listScrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index >= state.users.length) return const BottomLoading();
            var user = state.users[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade500,
                  boxShadow: [
                    BoxShadow(blurRadius: 8, color: Colors.grey.shade200)
                  ]),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.read<UsersListBloc>().add(
                      UsersListNavigateToUserProfileScreenEvent(user: user));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          width: 100,
                          height: 100,
                          imageUrl: user.avatar!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${user.firstName!} ${user.lastName!}',
                          style: widget.themeData.textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          user.email!,
                          style: widget.themeData.textTheme.subtitle2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }
}
