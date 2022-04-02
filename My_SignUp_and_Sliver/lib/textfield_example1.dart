import 'package:flutter/material.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';


class TextFieldExample1 extends StatefulWidget {
   TextFieldExample1({Key key}) : super(key: key);


  @override
  _TextFieldExample1State createState() => _TextFieldExample1State();
}

bool _isObscure = false;

class _TextFieldExample1State extends State<TextFieldExample1> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();

  static final now = DateTime.now();
  DateTime date;
  String strDate;

  final dropdownDatePicker = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: TextStyle(fontWeight: FontWeight.bold),
    dropdownColor: Colors.blue[200],
    dateHint: DateHint(year: 'year', month: 'month', day: 'day'),
    ascending: false,
  );

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }

  String email;
  String userName;
  String password;
  bool _validateEmail = false;
  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = '';
    userName = '';
    password = '';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

 /* bool _validateTextFieldData( text){
    if(text == RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')){
      setState(() {
        _validateEmail = false;
      });
    }else if(text != text.isEmpty){
      setState(() {
        _validateEmail = true;
      });
    }
    return true;
}*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child: Form(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        errorText:
                            _validateEmail ? "Please enter valid email !" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        //for custom focused border color, shape
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Enter email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      controller: _userNameController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        errorText: _validate ? "Please enter username !" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        //for custom focused border color, shape
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Enter user name",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        errorText: _validate ? "Please enter password !" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        //for custom focused border color, shape
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Enter password",
                        suffixIcon: IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: 50,
                    child: TextFormField(

                      controller: _dateOfBirthController,
                      onTap: () async {
                        // Below line stops keyboard from appearing
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Show Date Picker Here
                        await _selectDate(context);
                        //_dateOfBirthController.text = DateFormat('yyyy/MM/dd').format(date);
                        //setState(() {});
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.grey,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        labelText: 'Date of Birth',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today_outlined),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      validator: (String value) {
                        print('date:: ${date.toString()}');
                        if (value.isEmpty) {
                          return 'Please select date of birth !';
                        }
                        return null;
                      },
                      onSaved: (String val) {
                        strDate = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 8,
                      ),
                      onPressed: () {
                        setState(() {
                          email = _emailController.text.toString();
                          userName = _userNameController.text.toString();
                          password = _passwordController.text.toString();
                        });
                      },
                      child: Text("Sign Up"),
                    ),
                  ),

                  Container(
                    child: Text(
                        '\n User Name: $userName \n Email: $email \n Password: $password'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
