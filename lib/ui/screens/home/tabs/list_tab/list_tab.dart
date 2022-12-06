import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_sat/ui/screens/home/tabs/list_tab/todo_item.dart';
import 'package:todo_c7_sat/ui/screens/home/tabs/todo_dm.dart';
import 'package:todo_c7_sat/utils/my_theme_data.dart';

class ListTab extends StatelessWidget {

  
  DateTime selectedDay = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                   initialDate: selectedDay,
                   firstDate: selectedDay.subtract( Duration(days: 365)),
                   lastDate: selectedDay.add(Duration(days:365)),
                   onDateSelected: (date) {
                     selectedDay = date;
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
                   itemCount: 10,
                   itemBuilder: (_, index){
                 return TodoItem(TodoDM(title: "Play basketball", description: "My Description",
                     time: DateTime.now(), isDone: false), );
               }))
         ],
       ),
    );
  }
}
