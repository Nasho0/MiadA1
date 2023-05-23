import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//Name:MIAD WAN MAHRI
//MATRIC:2016152

void main() {     //MAIN FUNCTION
  runApp(MyApp());
}
//The StatelessWidget
class MyApp extends StatelessWidget {
  @override
  
  //The context inside the widget
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title:"Assign1 APP", // app title
      theme: ThemeData( // more details about theme
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFe91e63),
        canvasColor: const Color(0xFFfdd8d8),
      ),
      home: ProfilePage(),
    );
    return materialApp;
  }
}
// class to extend page from StatefulWidget
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _textFieldController = TextEditingController();
  String _displayText = 'Write down your information';
  String _displayText2 = 'Me: ';
  @override
//Name
  final TextEditingController _nameController = TextEditingController();
//matricNo
final TextEditingController _matController = TextEditingController();
//Age
  final TextEditingController _ageController = TextEditingController();
//PhpneNo
  final TextEditingController _phoController = TextEditingController();
//Email
  final TextEditingController _emController = TextEditingController();
  File? _image; //for pic
  String? _name;
  int? _mat;
  int? _age;
  int? _pho;
  String? _em;

  @override
  void dispose() {
    _nameController.dispose();  //Name
    _matController.dispose();   //matricNo
    _ageController.dispose();   //Age
    _phoController.dispose();   //PhpneNo
    _emController.dispose();   //Email
    super.dispose();
  }

// function to pick the image
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  void _printProfile() {
    setState(() {
    _name = _nameController.text;
    _mat = int.tryParse(_matController.text);
    _age = int.tryParse(_ageController.text);
    _pho = int.tryParse(_phoController.text);
    _em = _emController.text;

    print('Name: $_name');
    print('Matric No: $_mat');
    print('Age: $_age');
    print('Phone No: $_pho');
    print('Email: $_em');

    });
  }

  @override
  Widget build(BuildContext context) {
    var fontFamily2 = "Roboto";
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Assign1 APP"),
      ),
      
       body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            _buildProfilePicture(),   //image

            SizedBox(height: 20),
            _buildNameTextField(),    //Name

            SizedBox(height: 20),
            _buildMatTextField(),    //MatricNo

            SizedBox(height: 20),
            _buildAgeTextField(),   //Age

            SizedBox(height: 20),
            _buildPhoTextField(),   //PhpneNo

            SizedBox(height: 20),
            _buildEmTextField(),    //Email

            SizedBox(height: 20),
            _buildPrintButton(),    //print

            SizedBox(height: 20),
            _buildDisplayWidgets(),   //Display
          ],
        ),
      ),
    );
    return scaffold;
  }

//widget for pic
  Widget _buildProfilePicture() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: _image != null
            ? CircleAvatar(
                backgroundImage: FileImage(_image!),
                radius: 50,
              )
            :CircleAvatar(
                child: Icon(Icons.person),
                radius: 50,
              ),
      ),
    );
  }

//Widget for Name 
  Widget _buildNameTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

//Widget for MatricNo
  Widget _buildMatTextField(){
     return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _matController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'MatricNo',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

//Widget for Age
  Widget _buildAgeTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _ageController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Age',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

//widge for PhoneNo
Widget _buildPhoTextField(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _phoController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'PhoneNo',
          border: OutlineInputBorder(),
        ),
      ),
    );
}

//Widge for Email
Widget _buildEmTextField(){
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _emController,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
    );
}
//Widge to print
  Widget _buildPrintButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: _printProfile,
        child: Text('Print'),
      ),
    );
  }

//Widge to Display
  Widget _buildDisplayWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (_name != null) Text('Name: $_name'),
        if (_mat != null) Text('Matric: $_mat'),
        if (_age != null) Text('Age: $_age'),
        if (_pho != null) Text('PhoneNo: $_pho'),
        if (_em != null) Text('Email: $_em'),
      ],
    );
  } 
}
