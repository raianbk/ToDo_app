import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyList extends StatelessWidget {
  MyList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.onPressed});

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20,right:20,top: 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: onPressed ,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(10),
                autoClose: true,
                backgroundColor: Colors.red,
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .2),
                  offset: Offset(2, 3),
                  blurRadius: 0,
                )
              ],
            ),
            child: Row(children: [
              //task name
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )

              //checkbox
            ]),
          ),
        ));
  }
}
