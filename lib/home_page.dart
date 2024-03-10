import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/util/dialog_box.dart';
import 'package:todo_list/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box
  final _myBox = Hive.box('mybox');
  Database db = Database();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void handleToggle(int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateData();
  }

  void handleSaveTask() {
    if(_controller.text != ""){
      setState(() {
        db.taskList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateData();
    }
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSaved: handleSaveTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void handleDelete(int index){
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow[800],
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: db.taskList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final task = db.taskList[index];
              return TodoTile(
                taskName: task[0],
                taskCompleted: task[1],
                onToggleItem: (value) => handleToggle(index),
                onDelete: (context)=> handleDelete(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
