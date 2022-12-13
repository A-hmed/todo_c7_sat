import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_sat/model/todo_dm.dart';
import 'package:todo_c7_sat/providers/listProvider.dart';
import 'package:todo_c7_sat/utils/my_theme_data.dart';

class TodoItem extends StatelessWidget {
  TodoDM todo;
  TodoItem(this.todo);
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        //dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
              onPressed: (_){
                deleteTodo();
              },
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(20),
            icon: Icons.delete,
            label: "Delete",
            foregroundColor: Colors.white,
          )
        ],
      ),
      child: Container(
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
      ),
    );
  }

  void deleteTodo() {
    FirebaseFirestore.instance.collection("todos")
        .doc(todo.id).delete().timeout(Duration(milliseconds: 500), onTimeout: (){
      provider.fetchTodosFromFireStore();
    });
  }
}
