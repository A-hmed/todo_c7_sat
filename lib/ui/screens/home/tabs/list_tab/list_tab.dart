import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_sat/providers/listProvider.dart';
import 'package:todo_c7_sat/ui/screens/home/tabs/list_tab/todo_item.dart';
import 'package:todo_c7_sat/model/todo_dm.dart';
import 'package:todo_c7_sat/utils/Constants.dart';
import 'package:todo_c7_sat/utils/my_theme_data.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    if(listProvider.todos.isEmpty) listProvider.fetchTodosFromFireStore();
    return  Container(
       child: Column(
         children: [
           Expanded(
             child: Stack(
               children: [
                 Column(
                   children: [
                     Expanded(
                       flex: 25,
                       child: Container(
                         color: MyThemeData.primirayColor,
                       ),
                     ),
                     Expanded(
                       flex: 75,
                       child: Container(
                         color: MyThemeData.accentColor,
                       ),
                     ),
                   ],
                 ),
                 CalendarTimeline(
                   initialDate: listProvider.selectedDay,
                   firstDate: listProvider.selectedDay.subtract( Duration(days: 365)),
                   lastDate: listProvider.selectedDay.add(Duration(days:365)),
                   onDateSelected: (date) {
                     listProvider.changeSelected(date);
                   },
                   leftMargin: 20,
                   monthColor: Colors.white,
                   dayColor: Colors.black,
                   activeDayColor: MyThemeData.primirayColor,
                   activeBackgroundDayColor: Colors.white,
                   dotsColor: Colors.transparent  ,
                   locale: 'en_ISO',
                 ),
               ],
             ),
           ),
           Expanded(
             flex: 4,
               child: ListView.builder(
                   itemCount: listProvider.todos.length,
                   itemBuilder: (_, index){
                 return TodoItem(listProvider.todos[index]);
               }))
         ],
       ),
    );
  }
}
