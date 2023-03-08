import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PopularTaskerPage extends StatelessWidget {
  static const routeName = '/popular-tasker-page';
  const PopularTaskerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskerCubit, TaskerState>(
        builder: (context, state) {
          return Column(
            children: [
              addVerticalSpace(
                50,
              ),
              const CustomHeader(
                label: 'Popular Taskers',
              ),
              const Divider(),
              addVerticalSpace(
                16,
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  children: [
                    const Icon(
                      Icons.filter_alt_outlined,
                      color: kColorSilver,
                    ),
                    addHorizontalSpace(5),
                    ChoiceChip(
                      label: Row(
                        children: const [
                          Text(
                            'Category',
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: kColorGrey),
                      selected: false,
                      disabledColor: Colors.white,
                    ),
                    addHorizontalSpace(5),
                    ChoiceChip(
                      label: Row(
                        children: const [
                          Text(
                            'Buddhanagar',
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: kColorGrey),
                      selected: false,
                      disabledColor: Colors.white,
                    ),
                    addHorizontalSpace(5),
                    ChoiceChip(
                      label: Row(
                        children: const [
                          Text(
                            'Any Price',
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: kColorGrey),
                      selected: false,
                      disabledColor: Colors.white,
                    ),
                    addHorizontalSpace(5),
                  ],
                ),
              ),
              addVerticalSpace(
                8,
              ),
              if (state.taskerListRes != null)
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<TaskerCubit>().loadSingleTasker(
                                state.taskerListRes?.result?[index].user?.id ??
                                    '',
                              );
                          context.read<TaskerCubit>().loadSingleTasker(
                                state.taskerListRes?.result?[index].user?.id ??
                                    '',
                              );
                          context.read<TaskerCubit>().loadSingleTaskerReviews(
                                state.taskerListRes?.result?[index].user?.id ??
                                    '',
                              );

                          Navigator.pushNamed(
                            context,
                            TaskerProfile.routeName,
                          );
                        },
                        child: TaskerCard(
                          networkImageUrl:
                              state.taskerListRes?.result?[index].profileImage,
                          label:
                              "${state.taskerListRes?.result?[index].user?.firstName} ${state.taskerListRes?.result?[index].user?.lastName}",
                          designation:
                              state.taskerListRes?.result?[index].designation,
                          happyClients: state
                              .taskerListRes?.result?[index].stats?.happyClients
                              .toString(),
                          ratings:
                              "${state.taskerListRes?.result?[index].rating?.avgRating ?? '5'} (${state.taskerListRes?.result?[index].rating?.userRatingCount ?? '0'})",
                          rate:
                              "Rs. ${state.taskerListRes?.result?[index].hourlyRate}",
                          callback: () {},
                        ),
                      ),
                    ),
                    itemCount: state.taskerListRes?.result?.length ?? 0,
                  ),
                )
              else
                const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
