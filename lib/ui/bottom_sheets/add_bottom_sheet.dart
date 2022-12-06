import 'package:flutter/material.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  GlobalKey<FormState> myKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Form(
        key: myKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12,),
            Text("Add new Task", textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              validator: (text){
                if(text == null || text.trim().isEmpty) {
                   return "Please enter title";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Description",
              ),
              validator: (text){
                if(text == null || text.trim().isEmpty) {
                  return "Please enter title";
                }
              },
              minLines: 3,
              maxLines: 4 ,
            ),
            SizedBox(height: 24,),
            Text("Select date", textAlign: TextAlign.start,style: Theme.of(context).textTheme.displayMedium,),
            InkWell(
                onTap: (){
                  showMyDatePicker();
                },
                child: Text("12/11/2022", textAlign: TextAlign.center, style: Theme.of(context).textTheme.displaySmall,)),
            Spacer(),
            Container(
                margin: EdgeInsets.all(12),
                child: ElevatedButton(onPressed: (){
                  myKey.currentState!.validate();
                }, child: Text("Add")))
          ],
        ),
      ),
    );
  }

  void showMyDatePicker() {
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
