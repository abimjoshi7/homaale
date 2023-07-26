import 'package:flutter/material.dart';

class TaskOrServiceSectionModalBottomSheet extends StatefulWidget {
  static SelectedService selectedService = SelectedService.task;

  const TaskOrServiceSectionModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<TaskOrServiceSectionModalBottomSheet> createState() =>
      _TaskOrServiceSectionModalBottomSheetState();
}

class _TaskOrServiceSectionModalBottomSheetState
    extends State<TaskOrServiceSectionModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('I’m looking for Task'),
          leading: Radio<SelectedService>(
            value: SelectedService.task,
            groupValue: TaskOrServiceSectionModalBottomSheet.selectedService,
            onChanged: (SelectedService? value) {
              setState(() {
                TaskOrServiceSectionModalBottomSheet.selectedService = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('I’m looking for Service'),
          leading: Radio<SelectedService>(
            value: SelectedService.service,
            groupValue: TaskOrServiceSectionModalBottomSheet.selectedService,
            onChanged: (SelectedService? value) {
              setState(() {
                TaskOrServiceSectionModalBottomSheet.selectedService = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}

enum SelectedService { task, service }
