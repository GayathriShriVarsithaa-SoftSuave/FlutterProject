import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoList> {
  final TextEditingController controller = TextEditingController();
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your task',
                    ),
                    controller: controller,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tasks.add(controller.text);
                      controller.clear();
                    });
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
               return(Row(
                  children: [
                    Text(tasks[index]),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
