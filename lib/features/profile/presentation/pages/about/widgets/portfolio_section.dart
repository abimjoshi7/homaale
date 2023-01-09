import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_portfolio_cubit.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({
    super.key,
  });

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
              height: 180,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      print(state);
                      await context.read<TaskerPortfolioCubit>().getPortfolio();
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
                    await context.read<TaskerPortfolioCubit>().getPortfolio();
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
