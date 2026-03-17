import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: TaskHomePage(),
    );
  }
}

class TaskHomePage extends StatefulWidget {
  @override
  _TaskHomePageState createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  List<String> tasks = [];
  TextEditingController controller = TextEditingController();

  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add(controller.text);
      });
      controller.clear();
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Manager"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter a task",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addTask,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTask(index),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
