import 'package:flutter/material.dart';

void main() {
  runApp(ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contacts App",
      home: HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  HomeActivityState createState() => HomeActivityState();
}

class HomeActivityState extends State<HomeActivity> {
  List<Map<String, String>> contactList = [];

  final TextEditingController nameController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  addData() {
    String name = nameController.text;
    String number = numberController.text;
    setState(() {
      contactList.add({'name': name, 'number': number});
    });
    nameController.clear();
    numberController.clear();
  }

  deleteData(int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Confirmation"),
              content: Text("Are you sure you want to delete this contact?"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel_outlined, color: Colors.blue),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        contactList.removeAt(index);
                        Navigator.pop(context);
                      });
                    },
                    icon: Icon(Icons.delete_forever, color: Colors.blue))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            "Contact List",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF667C89)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Number"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF667C89),
                ),
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                   onLongPress: () {
                      deleteData(index);
                   },
                    child: Card(
                      color: Color(0xFFEEEEEE),
                      child: ListTile(
                        title: Text(
                          contactList[index]['name']!,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(contactList[index]['number']!),
                        leading: Icon(Icons.person, color: Colors.brown),
                        trailing: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
