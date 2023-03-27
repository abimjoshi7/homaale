import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final TaskEntityServiceState state;
  const ImageSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: "Images",
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: state.taskEntityService?.images?.length,
          itemBuilder: (context, index) => Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  state.taskEntityService!.images!.isEmpty
                      ? kServiceImageNImg
                      : state.taskEntityService?.images?[index].media
                              .toString() ??
                          kServiceImageNImg,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
