import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_portfolio_cubit.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
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
  int? _pageCount = 10;
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
    return BlocConsumer<TaskerPortfolioCubit, TaskerPortfolioState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is TaskerGetPortfolioSuccess) {
          _pageCount = state.taskerPortfolioRes.count;
          final isLastPage = state.taskerPortfolioRes.count! < _pageCount!;
        }
      },
      builder: (context, state) {
        if (state is TaskerGetPortfolioSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      print(state);
                      await context
                          .read<TaskerPortfolioCubit>()
                          .getPortfolio(2);
                    },
                    child: const Text(
                      'Portfolio',
                    ),
                  ),
                  kHeight10,
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.taskerPortfolioRes.result!.length,
                      itemBuilder: (context, index) => PortfolioCard(
                        imagePath: 'assets/Casual life 3D - 39.png',
                        label: state.taskerPortfolioRes.result![index]!.title!,
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
                    print(state);
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
                    children: [
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
