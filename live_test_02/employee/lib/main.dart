import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeApp());
}

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Employee App",
      home: HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Add Employee"),),

      body:Container(

        padding: EdgeInsets.all(16),
        child:  Column(

          children: [
            
            TextField(
              decoration: InputDecoration(label: Text("Name")),

            ),

            TextField(
              decoration: InputDecoration(label: Text("Age")),

            ),

            TextField(
              decoration: InputDecoration(label: Text("Salary")),

            ),

            SizedBox(height: 20,),


            ElevatedButton(onPressed: (){}, child: Text("Add Employee")),


          ],
        ),

      ),

    );
  }
}
