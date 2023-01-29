import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_portfolio.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
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
      },
      builder: (context, state) {
        if (state is TaskerGetPortfolioSuccess) {
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
                      itemCount: state.taskerPortfolioRes.length,
                      // itemCount: state.taskerPortfolioRes.result!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            constraints: const BoxConstraints(
                              maxHeight: 800,
                            ),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => EditPortfolio(
                              id: state.taskerPortfolioRes[index].id ?? 0,
                            ),
                          );
                        },
                        child: PortfolioCard(
                          islocalImage: false,
                          imagePath: state
                                  .taskerPortfolioRes[index].images?[0]['media']
                                  .toString() ??
                              'https://cdn.pixabay.com/photo/2022/07/11/10/42/boho-style-7314646_960_720.png',
                          label: state.taskerPortfolioRes[index].title ?? '',
                        ),
                      ),
                      separatorBuilder: (context, index) => kWidth10,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
          // return Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () async {
          //           // await context.read<TaskerPortfolioCubit>().getPortfolio(5);
          //         },
          //         child: const Text(
          //           'Portfolio',
          //         ),
          //       ),
          //       kHeight10,
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Row(
          //           children: const [
          //             PortfolioCard(
          //               label: 'Kitchen Cleaning',
          //               imagePath: 'assets/Casual life 3D - 39.png',
          //             ),
          //             kWidth5,
          //             PortfolioCard(
          //               label: 'Kitchen Cleaning',
          //               imagePath: 'assets/Casual life 3D - 39.png',
          //             ),
          //             kWidth5,
          //             PortfolioCard(
          //               label: 'Motor Cleaning',
          //               imagePath: 'assets/Casual life 3D - 39.png',
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        }
      },
    );
  }
}
