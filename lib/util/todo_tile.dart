import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onToggleItem;
  final Function(BuildContext)? onDelete;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onToggleItem,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius:  BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: taskCompleted ? Colors.yellow[700] : Colors.yellow[500],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onToggleItem,
                activeColor: Colors.blue[800],
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
