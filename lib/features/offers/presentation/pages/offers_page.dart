import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/offers/data/repositories/offer_repository.dart';
import 'package:cipher/features/offers/presentation/bloc/offers_bloc.dart';
import 'package:cipher/features/offers/presentation/widgets/offer_card.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  static const routeName = '/offers-page';
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OffersBloc(OfferRepository())
        ..add(
          OfferListLoaded(),
        ),
      child: OffersPageMainView(),
    );
  }
}

class OffersPageMainView extends StatefulWidget {
  const OffersPageMainView({super.key});

  @override
  State<OffersPageMainView> createState() => _OffersPageMainViewState();
}

class _OffersPageMainViewState extends State<OffersPageMainView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    context.read<OffersBloc>().add(
          OfferListLoaded(),
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersBloc, OffersState>(
      builder: (context, state) {
        if (state.theStates == TheStates.loading)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        return Scaffold(
          appBar: CustomAppBar(appBarTitle: "Offers"),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TabBar(
                      labelPadding: kPadding10,
                      controller: _tabController,
                      indicatorColor: kColorSecondary,
                      tabs: const [
                        Text('All'),
                        Text('Coupons'),
                        Text('Scratch Cards'),
                        Text('Offers'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          GridView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: state.offerModel?.result?.length ?? 0,
                            itemBuilder: (context, index) => OfferCard(
                              index: index,
                              state: state,
                            ),
                          ),
                          Center(child: Text('No Offers available.')),
                          Center(child: Text('No Offers available.')),
                          Center(child: Text('No Offers available.')),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
