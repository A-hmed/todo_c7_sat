import 'package:flutter/material.dart';
import 'package:todo_c7_sat/ui/bottom_sheets/add_bottom_sheet.dart';
import 'package:todo_c7_sat/ui/screens/home/tabs/list_tab/list_tab.dart';
import 'package:todo_c7_sat/ui/screens/home/tabs/settings_tab.dart';

class Home extends StatefulWidget {
   static String routeName = 'Home screen';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<Widget> tabs = [ListTab(), SettingsTab()];

   int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        toolbarHeight: MediaQuery.of(context).size.height * .1,
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white, width: 3)
        ),
        onPressed: (){
          showAddBottomSheet();
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          onTap: (index){
            currentIndex = index;
            setState((){});
          },
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/ic_menu.png"),), label: "menu"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void showAddBottomSheet() {
    showModalBottomSheet(context: context, builder: (_){
      return AddBottomSheet();
    });
  }
}
