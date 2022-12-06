import 'package:flutter/material.dart';
import 'package:todo_c7_sat/ui/screens/home/tabs/todo_dm.dart';
import 'package:todo_c7_sat/utils/my_theme_data.dart';

class TodoItem extends StatelessWidget {
  TodoDM todo;
  TodoItem(this.todo);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 50,
            color: MyThemeData.primirayColor,
            margin: EdgeInsets.all(12),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(todo.title, style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 18,),
              Text(todo.description, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.start,)
            ],),
          ),
         Spacer(),
          Container(
            decoration: BoxDecoration(
                color: MyThemeData.primirayColor,
                borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Image.asset("assets/ic_check.png"),
          ),
          Spacer(flex: 1,),
        ],
      ),
    );
  }
}
