import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Operations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Operations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TextEditingController> dateControllers = [];
  List<DateTime?> selectedDates = [];
  TextEditingController itemController = TextEditingController();
  int selectedIndex = -1;

  void addItem() {
    setState(() {
      dateControllers.add(TextEditingController());
      selectedDates.add(null);
    });
  }

  void deleteItem(int index) {
    setState(() {
      dateControllers.removeAt(index);
      selectedDates.removeAt(index);
    });
  }

  void updateItem(int index) {
    setState(() {
      selectedDates[index] = DateTime.now();
      itemController.clear();
      selectedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: itemController,
              decoration: InputDecoration(
                labelText: 'Item',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addItem,
            child: Text('Add Item'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dateControllers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: TextFormField(
                    controller: dateControllers[index],
                    decoration: InputDecoration(
                      labelText: 'Date',
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          selectedDates[index] = selectedDate;
                          dateControllers[index].text =
                              selectedDate.toString().split(' ')[0];
                        });
                      }
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            itemController.text = '';
                            selectedIndex = index;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteItem(index);
                        },
                      ),
                    ],
                  ),
                  tileColor: selectedIndex == index
                      ? Colors.lightBlueAccent
                      : Colors.transparent,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedIndex >= 0) {
                updateItem(selectedIndex);
              }
            },
            child: Text('Update Item'),
          ),
        ],
      ),
    );
  }
}
