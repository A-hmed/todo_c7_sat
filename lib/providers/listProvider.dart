import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/todo_dm.dart';
import '../utils/Constants.dart';

class ListProvider extends ChangeNotifier {
  List<TodoDM> todos = [];
  DateTime selectedDay = DateTime.now();


  fetchTodosFromFireStore() async{
    var todosCollection = FirebaseFirestore.instance.collection(TodoDM.collecteionName);
    var query = await todosCollection.get();

    /// Converting list of doc to list of TodoDM
    todos =  query.docs.map((doc) {
      var map = doc.data();
      return TodoDM(id:map[idKey] ,title: map[titleKey],
          time: DateTime.fromMillisecondsSinceEpoch(map[dateTimeKey]),
          description: map[descriptionKey],
          isDone:map[isDoneKey]);
    }).toList();

    ///filter with selected day
    todos = todos.where((todo){

      return todo.time.year == selectedDay.year &&
          todo.time.month == selectedDay.month && todo.time.day == selectedDay.day;
    }).toList();

    ///sort list
    todos.sort((todo1, todo2){
      return todo1.time.compareTo(todo2.time);
    });
    notifyListeners();
  }

  changeSelected(DateTime newDate){
    selectedDay = newDate;
    fetchTodosFromFireStore();
  }
}