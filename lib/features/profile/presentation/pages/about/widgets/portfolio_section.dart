import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_portfolio_cubit.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_portfolio.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({
    super.key,
  });

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  int pageNumber = 1;
  final _pagingController = PagingController(
    firstPageKey: 'http://172.16.16.50:8014/api/v1/tasker/portfolio/?page=1',
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      // _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 210,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Portfolio',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AddPortfolio.routeName,
                          );
                        },
                        child: const Text(
                          'Add New',
                          style: TextStyle(
                            color: Color(0xffF98900),
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHeight10,
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.user.portfolio == null
                          ? 1
                          : state.user.portfolio!.length,
                      // itemCount: state.taskerPortfolioRes.result!.length,
                      itemBuilder: (context, index) => PortfolioCard(
                        // imagePath: state.user.portfolio![index].images[index],
                        imagePath: 'assets/Casual life 3D - 39.png',
                        label: state.user.portfolio == null
                            ? ''
                            : state.user.portfolio![index]!.title!,
                        // label: state.taskerPortfolioRes.result![index]!.title!,
                      ),
                      separatorBuilder: (context, index) => kWidth10,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    await context.read<TaskerPortfolioCubit>().getPortfolio(5);
                  },
                  child: const Text(
                    'Portfolio',
                  ),
                ),
                kHeight10,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      PortfolioCard(
                        label: 'Kitchen Cleaning',
                        imagePath: 'assets/Casual life 3D - 39.png',
                      ),
                      kWidth5,
                      PortfolioCard(
                        label: 'Kitchen Cleaning',
                        imagePath: 'assets/Casual life 3D - 39.png',
                      ),
                      kWidth5,
                      PortfolioCard(
                        label: 'Motor Cleaning',
                        imagePath: 'assets/Casual life 3D - 39.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
