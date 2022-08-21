import 'package:cached_network_image/cached_network_image.dart';
import 'package:finnogate_challenge/src/common_widgets/bottom_loading.dart';
import 'package:finnogate_challenge/src/features/dashboard/domain/coin_model.dart';
import 'package:finnogate_challenge/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

class DashboardSuccessView extends StatefulWidget {
  final ThemeData themeData;

  const DashboardSuccessView({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  @override
  State<DashboardSuccessView> createState() => DashboardSuccessViewState();
}

class DashboardSuccessViewState extends State<DashboardSuccessView> {
  late ThemeData themeData;
  late AppLocalizations localizations;
  late DashboardSuccessState state;
  double itemExtent = 70;
  final formatter = intl.NumberFormat("#,##0.0######");
  final percentageFormat = intl.NumberFormat("##0.0##");
  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    _listScrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    themeData = Theme.of(context);
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  void _onScroll() {
    if (_listScrollController.position.atEdge && _listScrollController.position.pixels !=0) {
      context.read<DashboardBloc>().add(DashboardCoinsFetchMoreEvent(
          hasReachedMax: state.hasReachedMax,
          currentPage: state.currentPage,
          isCoinsFetching: state.isCoinsFetching));
    }
  }

  @override
  Widget build(BuildContext context) {
    state = (context.read<DashboardBloc>().state as DashboardSuccessState);

    return SizedBox(
      height: itemExtent * state.coins.length,
      child: ListView.builder(
          itemCount:
              state.hasReachedMax ? state.coins.length : state.coins.length + 1,
          itemExtent: itemExtent,
          controller: _listScrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index >= state.coins.length) return const BottomLoading();
            var coin = state.coins[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: InkWell(
                onTap: () {
                  context.read<DashboardBloc>().add(DashboardOnCoinClickedEvent(
                      url: 'https://www.tradingview.com/symbols/BTCUSD/'));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      color: themeData.colorScheme.onSurface,
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: themeData.textTheme.subtitle1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _coinSymbol(coin),
                            _coinCurrentPrice(coin),
                            _priceChange24H(coin)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _priceChange24H(CoinModel coin) => Text(
      coin.priceChange24H! > 2
          ? formatter.format(coin.priceChange24H!)
          : percentageFormat.format(coin.priceChange24H!),
      style: coin.priceChange24H! > 0
          ? themeData.textTheme.subtitle2!.copyWith(color: Colors.green[600])
          : themeData.textTheme.subtitle2!.copyWith(color: Colors.red));

  Widget _coinCurrentPrice(CoinModel coin) => Text(
        formatter.format(coin.currentPrice!),
        style: themeData.textTheme.subtitle2,
      );

  Widget _coinSymbol(CoinModel coin) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            width: 32,
            height: 32,
            imageUrl: coin.image!,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          coin.symbol!,
          style: themeData.textTheme.subtitle2,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }
}
