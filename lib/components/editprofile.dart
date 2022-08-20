import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final formKey = GlobalKey<FormState>();

  var Gender;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image(
                image: AssetImage(
                  'face1.jpg',
                ),
                width: 80,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Name: ",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "William John Malik",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Gender: ",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: "Male",
                            groupValue: Gender,
                            onChanged: (value) {
                              setState(() {
                                Gender = value;
                              });
                              print(Gender);
                            }),
                        Text("Male"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Female",
                            groupValue: Gender,
                            onChanged: (value) {
                              setState(() {
                                Gender = value;
                              });
                              print(Gender);
                            }),
                        Text("Female")
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "E-mail: ",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Williamjohn@gmail.com",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Phone Number: ",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+91-0000000000",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("Valid");
                    } else {
                      print("Invalid");
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
