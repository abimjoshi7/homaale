import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/support/presentation/bloc/post_support_ticket_bloc.dart';
import 'package:cipher/features/support/presentation/bloc/post_support_ticket_state.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_drop_down_field.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../task/presentation/bloc/task_bloc.dart';
import '../../../task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import '../../../tasker/presentation/cubit/tasker_cubit.dart';
import '../bloc/post_support_ticket_event.dart';
import '../bloc/support_ticket_type_options_bloc.dart';
import '../bloc/support_ticket_type_options_state.dart';

class CommonReportPage extends StatefulWidget {
  static const routeName = 'report-problem';

  const CommonReportPage({Key? key}) : super(key: key);

  @override
  State<CommonReportPage> createState() => _CommonReportPageState();
}

class _CommonReportPageState extends State<CommonReportPage> {
  final typeOfProblemController = TextEditingController();
  final specifyController = TextEditingController();
  final detailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? typeSlug;

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final isType = routeData?['isType'] as String?;
    final model = routeData?['model'] as String?;
    final objectId = routeData?['objectId'] as String?;

    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Report', trailingWidget: SizedBox()),
      body: BlocBuilder<SupportTicketTypeOptionsBloc,
          SupportTicketTypeOptionsState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isType == 'isTask') SingleTaskReportDisplay(),
                  if (isType == 'isService') SingleServiceReportDisplay(),
                  if (isType == 'isReportUser') UserReportDisplay(),
                  SizedBox(height: 5),
                  CustomFormField(
                    label: 'Type of problem',
                    isRequired: true,
                    child: (state is supportTicketTypeOptionsSuccess)
                        ? CustomDropDownField<String?>(
                      validator: (p0) => typeOfProblemController.text.isEmpty
                          ? "Required Field"
                          : null,
                            onChanged: (p0) => setState(
                              () {
                                final options = state.list.where(
                                  (element) => p0 == element.name,
                                );
                                typeOfProblemController.text =
                                    options.toString();
                                typeSlug = options.first.slug;
                              },
                            ),
                            list: List.generate(
                              state.list.length,
                              (index) {
                                print(' name: ${state.list[index].name}');
                                return state.list[index].name;
                              },
                            ),
                            hintText: "Subject",
                          )
                        : const CardLoading(height: 100),
                  ),
                  addVerticalSpace(10),
                  typeOfProblemController.text == 'Other' || isType != null
                      ? CustomFormField(
                          label: 'Please Specify',
                          isRequired: true,
                          child: CustomTextFormField(
                            maxLines: 3,
                            validator: validateNotEmpty,
                            controller: specifyController,
                            onSaved: (p0) => setState(
                              () {
                                specifyController.text = p0!;
                              },
                            ),
                            hintText: ' Specify your reason here..',
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      : SizedBox(),
                  addVerticalSpace(5),
                  CustomFormField(
                    label: 'Problem Detail',
                    isRequired: true,
                    child: CustomTextFormField(
                      maxLines: 3,
                      validator: validateNotEmpty,
                      controller: detailController,
                      onSaved: (p0) => setState(
                        () {
                          detailController.text = p0!;
                        },
                      ),
                      hintText: 'Please explain your problem briefly..',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  addVerticalSpace(10),
                  if (isType == null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.orange,
                          size: 20,
                        ),
                        addHorizontalSpace(5),
                        Expanded(
                          child: Text(
                            'If you are trying to report  any Tasker, '
                            'go to Tasker profile and report.',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  addVerticalSpace(20),
                  BlocBuilder<PostSupportTicketBloc, PostSupportTicketState>(
                      builder: (context, stateP) {
                    return CustomElevatedButton(
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          isType == null
                              ? context
                                  .read<PostSupportTicketBloc>()
                                  .add(PostSupportTicketLoadWithOutModel(
                                    description: detailController.text,
                                    reason: specifyController.text,
                                    typeSlug: typeSlug ?? '',
                                  ))
                              : context
                                  .read<PostSupportTicketBloc>()
                                  .add(PostSupportTicketLoad(
                                    description: detailController.text,
                                    reason: specifyController.text,
                                    objectId: objectId ?? "",
                                    model: model,
                                    typeSlug: typeSlug ?? '',
                                  ));
                          Future.delayed(const Duration(seconds: 1), () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Reported Successfully."),
                              duration: const Duration(seconds: 2),
                            ));
                            // if (TheStates.success == stateP.theState)
                            Navigator.pushNamed(context, Root.routeName);
                          });
                        }
                      },
                      label: 'Submit',
                    );
                  }),
                  addVerticalSpace(20),
                  CustomElevatedButton(
                    mainColor: Colors.white,
                    borderColor: Theme.of(context).primaryColor,
                    callback: () => Navigator.of(context).pop(),
                    label: 'Cancel',
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class SingleServiceReportDisplay extends StatelessWidget {
  const SingleServiceReportDisplay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TaskBloc? service = context.read<TaskBloc>();
    return ListTile(
      leading: Container(
        height: 60,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(
                // service.state.taskModel?.images?.first.media ??
                kServiceImageNImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text("${service.state.taskModel?.createdBy?.firstName ?? ''}"
          '${service.state.taskModel?.createdBy?.lastName ?? ''}'),
      subtitle: Text(service.state.taskModel?.title ?? ""),
    );
  }
}

class SingleTaskReportDisplay extends StatelessWidget {
  const SingleTaskReportDisplay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TaskEntityServiceBloc? taskEntityServiceBloc =
        context.read<TaskEntityServiceBloc>();
    return ListTile(
      leading: Container(
        height: 60,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image:
                // taskEntityServiceBloc.state.taskEntityService?.images?.first.media.isNotEmpty
                //
                //     ? NetworkImage(taskEntityServiceBloc
                //             .state.taskEntityService?.images?.first.media ??
                //         kServiceImageNImg)
                //     :
                NetworkImage(kServiceImageNImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
          "${taskEntityServiceBloc.state.taskEntityService?.createdBy?.firstName ?? ''}"
          " ${taskEntityServiceBloc.state.taskEntityService?.createdBy?.lastName ?? ''}"),
      subtitle:
          Text(taskEntityServiceBloc.state.taskEntityService?.title ?? ""),
    );
  }
}

class UserReportDisplay extends StatelessWidget {
  const UserReportDisplay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TaskerCubit? taskerCubit = context.read<TaskerCubit>();
    return ListTile(
      leading: Container(
        height: 60,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(
                // taskerBloc.state.taskEntityService?.images?.first.media ??
                kServiceImageNImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text("${taskerCubit.state.singleTasker.fullName ?? 're'}"),
      subtitle: Text(taskerCubit.state.singleTasker.designation ?? "ii"),
    );
  }
}
