import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddServicePage extends StatefulWidget {
  static const routeName = '/add-service-page';
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  String? priceType;
  final controller = TextEditingController();
  bool isDiscounted = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            child: Text('Add Service'),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomFormField(
                          label: 'Service Title',
                          child: CustomTextFormField(
                            hintText: 'Trimming & Cutting',
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Category',
                          child: CustomTextFormField(
                            hintText: 'Trimming & Cutting',
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Service Description',
                          child: CustomTextFormField(
                            hintText: 'Trimming & Cutting',
                            maxLines: 3,
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Service Highlights',
                          child: CustomTextFormField(
                            hintText: 'Trimming & Cutting',
                            maxLines: 3,
                          ),
                          isRequired: false,
                        ),
                        CustomFormField(
                          label: 'Base Price',
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'Fixed',
                                    groupValue: priceType,
                                    onChanged: (value) => setState(
                                      () {
                                        priceType = value;
                                      },
                                    ),
                                  ),
                                  Text('Fixed'),
                                  addHorizontalSpace(10),
                                  Radio<String>(
                                    value: 'Variable',
                                    groupValue: priceType,
                                    onChanged: (value) => setState(
                                      () {
                                        priceType = value;
                                      },
                                    ),
                                  ),
                                  Text('Variable'),
                                ],
                              )
                            ],
                          ),
                          isRequired: true,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: NumberIncDecField(
                                controller: controller,
                              ),
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: CustomDropDownField(
                                list: ['Per Project'],
                                hintText: 'Specify',
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          children: [
                            CustomCheckBox(
                              isChecked: isDiscounted,
                              onTap: () => setState(
                                () {
                                  isDiscounted = !isDiscounted;
                                },
                              ),
                            ),
                            addHorizontalSpace(10),
                            Text('Add Discount'),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          children: [
                            Flexible(
                              child: NumberIncDecField(
                                controller: controller,
                              ),
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: CustomDropDownField(
                                list: ['Per Project'],
                                hintText: 'Specify',
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: kColorSecondary,
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: Text(
                                'After 20% discount on the budget i.e. Rs 240, new budget will be Rs 960',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          children: [
                            Flexible(
                              child: CustomFormField(
                                label: 'Start Date',
                                child: CustomFormContainer(
                                  hintText: 'dd/mm/yy',
                                  leadingWidget: Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorGrey,
                                  ),
                                ),
                                isRequired: false,
                              ),
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: CustomFormField(
                                label: 'End Date',
                                child: CustomFormContainer(
                                  hintText: 'dd/mm/yy',
                                  leadingWidget: Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorGrey,
                                  ),
                                ),
                                isRequired: false,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomCheckBox(
                              isChecked: isDiscounted,
                              onTap: () => setState(
                                () {
                                  isDiscounted = !isDiscounted;
                                },
                              ),
                            ),
                            addHorizontalSpace(10),
                            Text(
                              'Set specific time',
                              style: kPurpleText16,
                            ),
                            addVerticalSpace(10),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            7,
                            (index) => ChoiceChip(
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.all(3),
                              labelPadding: EdgeInsets.all(
                                8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              label: Text(weekNames[index]),
                              selected: false,
                            ),
                          ),
                        ),
                        addHorizontalSpace(10),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: kColorSecondary,
                            size: 10,
                          ),
                          addHorizontalSpace(10),
                          Text('Sunday')
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: CustomFormContainer(
                              leadingWidget: Icon(
                                Icons.access_time,
                              ),
                              hintText: '08:30 am',
                            ),
                          ),
                          Flexible(
                            child: Text('-'),
                          ),
                          Flexible(
                            child: CustomFormContainer(
                              leadingWidget: Icon(
                                Icons.access_time,
                              ),
                              hintText: '08:30 am',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
