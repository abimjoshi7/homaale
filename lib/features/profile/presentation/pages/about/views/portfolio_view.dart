import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_portfolio.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({
    super.key,
  });

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
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
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.taskerPortfolioRes.length,
                    // itemCount: state.taskerPortfolioRes.result!.length,
                    itemBuilder: (context, index) => InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomToast(
                            heading: 'Delete',
                            content:
                                'Are you sure to delete selected portfolio?',
                            onTap: () async {
                              await context
                                  .read<TaskerPortfolioCubit>()
                                  .deleteTaskerPortfolio(
                                    state.taskerPortfolioRes[index].id ?? 0,
                                  )
                                  .then(
                                    (value) => Navigator.pop(context),
                                  );
                            },
                            isSuccess: true,
                          ),
                        );
                      },
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
                        imagePath:
                            // state
                            //         .taskerPortfolioRes[index].images?[0]['media']
                            //         .toString() ??
                            'https://cdn.pixabay.com/photo/2022/07/11/10/42/boho-style-7314646_960_720.png',
                        label: state.taskerPortfolioRes[index].title ?? '',
                      ),
                    ),
                    separatorBuilder: (context, index) => kWidth10,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
