import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_portfolio.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart' as pro;

class PortfolioView extends StatefulWidget {
  const PortfolioView({
    super.key,
  });

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView>
    with TheModalBottomSheet {
  final _controller = ScrollController();
  final _scrollBloc = locator<ScrollBloc>();

  @override
  void initState() {
    super.initState();
    _scrollBloc.add(
      FetchItemsEvent(
        url: kPortfolio,
        data: {},
        newFetch: true,
      ),
    );
    _controller.addListener(
      () {
        ScrollHelper.nextPageTrigger(
          _controller,
          _scrollBloc.add(
            FetchItemsEvent(
              url: kPortfolio,
              data: {},
              newFetch: false,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  // final _pagingController = PagingController(
  //   firstPageKey: 'http://172.16.16.50:8014/api/v1/tasker/portfolio/?page=1',
  // );

  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     // _fetchPage(pageKey);
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _pagingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskerPortfolioCubit, TaskerPortfolioState>(
      listenWhen: (previous, current) {
        if (previous.states != TheStates.success &&
            current.states == TheStates.success) return true;
        return false;
      },
      listener: (context, state) {
        // if (state.taskerPortfolio.id != null) {
        //   Navigator.pushNamed(
        //     context,
        //     EditPortfolio.routeName,
        //   );
        // }
      },
      builder: (context, state) {
        if (state.taskerPortfolioList.isNotEmpty) {
          return SizedBox(
            height: state.taskerPortfolioList.length == 0
                ? 50
                : MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPortfolioSection(context),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.taskerPortfolioList.length,
                    // itemCount: state.taskerPortfolioList.result!.length,
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
                                    state.taskerPortfolioList[index].id ?? 0,
                                  )
                                  .then(
                                    (value) => Navigator.pop(context),
                                  );
                            },
                            isSuccess: true,
                          ),
                        );
                      },
                      onTap: () => context
                          .read<TaskerPortfolioCubit>()
                          .getSingleTaskerPortfolio(
                              state.taskerPortfolioList[index].id ?? 0),
                      child: PortfolioCard(
                        islocalImage: false,
                        imagePath:
                            state.taskerPortfolioList[index].images!.isNotEmpty
                                ? (state.taskerPortfolioList[index].images
                                        ?.first.media ??
                                    kNoImageNImg)
                                : kNoImageNImg,
                        label: state.taskerPortfolioList[index].title ?? '',
                      ),
                    ),
                    separatorBuilder: (context, index) => kWidth10,
                  ),
                ),
              ],
            ),
          );
        } else {
          return _buildPortfolioSection(context);
        }
      },
    );
  }

  Widget _buildPortfolioSection(BuildContext context) {
    return Row(
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
    );
  }
}
