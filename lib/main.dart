import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController test = TextEditingController();
  GlobalKey<FormState> formKey= GlobalKey();
  bool isChecked=false;
  String text = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title:Text("CheckBox & TextFormField",style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text("Enter your username !"),
                SizedBox(height: 10),
                TextFormField(
                  controller: test,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ ne peut pas être vide';
                      }
                      return null;
                  },
                  keyboardType: TextInputType.name,
                  maxLength: 13,
                  maxLines: 2,
                  minLines: 1,
                  decoration: InputDecoration(
                    label: Text("Username",style: TextStyle(color: Colors.red),),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.green
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CheckboxListTile(title :Text("CheckBox") ,value:isChecked, onChanged: (val){
                  setState(() {
                    isChecked=val!;
                    if (isChecked) {
                      text = test.text+" "+isChecked.toString();
                    } else {
                      text = "";
                    }
                  });
                }),
                Text(text)
              ]
            ),  
          )
        ),
      ),
    );
  }
}