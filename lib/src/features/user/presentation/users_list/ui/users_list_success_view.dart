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

  late UsersListSuccess state;

  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    _listScrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_listScrollController.position.extentAfter <= 200) {
      context.read<UsersListBloc>().add(UsersListFetchMore(
          currentPage: state.data.page!,
          hasReachedMax: state.data.page! == state.data.totalPages,
          isUsersFetching: state.isUsersFetching));
    }
  }

  @override
  Widget build(BuildContext context) {
    state = (context.read<UsersListBloc>().state as UsersListSuccess);
    return SizedBox(
      height: itemExtent * state.data.users.length,
      child: ListView.builder(
          itemCount: state.hasReachedMax
              ? state.data.users.length
              : state.data.users.length + 1,
          itemExtent: itemExtent,
          controller: _listScrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index >= state.data.users.length) return const BottomLoading();
            var user = state.data.users[index];
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
                  context
                      .read<UsersListBloc>()
                      .add(UsersListNavigateToUserProfileScreen(user: user));
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
