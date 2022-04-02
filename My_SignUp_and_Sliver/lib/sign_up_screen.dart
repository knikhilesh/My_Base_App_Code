import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class MyCustomSignUpPage extends StatefulWidget {
  const MyCustomSignUpPage({Key key}) : super(key: key);

  @override
  _MyCustomSignUpPageState createState() => _MyCustomSignUpPageState();
}

bool isCheck = false;
bool _isObscure = false;

List<String> _genderList = ['Male', 'Female', 'Other'];
List<String> _countryList = ['India', 'USA', 'Japan'];

final _userNameController = TextEditingController();
String userName;
DateTime _selectedDate = DateTime.now();



class _MyCustomSignUpPageState extends State<MyCustomSignUpPage> {
  static final now = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1960),
        lastDate: DateTime(2122));
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }

  Widget buildDateField(){

    return TextFormField(
      enableInteractiveSelection: false,
        controller: _dateOfBirthController,
        onTap: () async {
          // Below line stops keyboard from appearing
          FocusScope.of(context).requestFocus(new FocusNode());
          // Show Date Picker Here
          await _selectDate(context);
          _dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(date);
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
          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today_outlined),
            color: Colors.black,
            onPressed: () {
              setState(() async{
                  // Below line stops keyboard from appearing
                  FocusScope.of(context).requestFocus(new FocusNode());
                  // Show Date Picker Here
                  await _selectDate(context);
                  _dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(date);
                  //setState(() {});

              });
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
          else if(!RegExp(r'^(3[01]|[12][0-9]|0[1-9])/(1[0-2]|0[1-9])/[0-9]{4}$').hasMatch(value)){
            return 'Please select date of birth !';
          }
          return null;
        },
        onSaved: (String val) {
          strDate = val;
        },
      );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _dateOfBirthController = TextEditingController();

  String _selectGender = 'Select Gender';
  String _locationValue = 'Location';
  String _genderValue;
  DateTime date;
  String strDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: Icon(
            Icons.arrow_back_sharp,
            color: Colors.orangeAccent,
            size: 30,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    child: Text(
                      'Create an Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),

                Container(
                  child: TextFormField(
                    controller: _userNameController,
                    cursorColor: Colors.black,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter username !';
                      } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                        return 'Please enter username !';
                      } else
                        return null;
                    },
                    onSaved: (String value) {
                      userName = _userNameController.text.toString();
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      //floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      labelText: 'User name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    cursorColor: Colors.black,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter valid email !';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter valid email !';
                      } else
                        return null;
                    },
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      labelText: 'Email address',
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter valid mobile number !';
                      } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                        return 'Please enter valid mobile number !';
                      } else
                        return null;
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      labelText: 'Mobile Number',
                      prefixIcon:
                      CountryCodePicker(
                        closeIcon: Icon(Icons.arrow_drop_down_sharp),
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IN',
                        favorite: ['+91', 'IN'],
                        countryFilter: ['IN', 'IND'],
                        showFlagDialog: false,
                        comparator: (a, b) => b.name.compareTo(a.name),
                        //Get the country information relevant to the initial selection
                        onInit: (code) => print(
                            "on init ${code.name} ${code.dialCode} ${code.name}"),
                      ),
                      suffixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 20,
                ),
                Container(
                  child: buildDateField(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value == null) {
                        return 'Please select gender !';
                      }
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
                      labelText: 'Select gender',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      //suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 12),
                        child: DropdownButton(
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.black,
                          ),
                          alignment: AlignmentDirectional.center,
                          hint: _genderValue == null
                              ? Text(_selectGender)
                              : Text(
                                  _genderValue,
                                  style: TextStyle(color: Colors.black),
                                ),
                          isExpanded: true,
                          iconSize: 32.0,
                          style: TextStyle(color: Colors.black),
                          items: ['Male', 'Female', 'Other'].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _genderValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value == null) {
                        return 'Please select location !';
                      }
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
                      labelText: 'Location',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      //suffixIcon: Icon(Icons.arrow_drop_down_sharp, color: Colors.black),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 12),
                        child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_sharp,
                              color: Colors.black),
                          alignment: AlignmentDirectional.center,
                          hint: _locationValue == null
                              ? Text(_selectGender)
                              : Text(
                                  _locationValue,
                                  style: TextStyle(color: Colors.black),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.black),
                          items: ['India', 'USA', 'Japan'].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _locationValue = val;
                              },
                            );
                          },
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter valid password !';
                      } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                        return 'Please enter valid password !';
                      } else
                        return null;
                    },
                    obscureText: _isObscure,
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
                      labelText: 'Password',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: StreamBuilder<Object>(
                            stream: null,
                            builder: (context, snapshot) {
                              return Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  activeColor: Colors.orangeAccent,
                                  side: BorderSide(
                                      width: 1, color: Colors.grey),
                                  value: isCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      isCheck = value;
                                    });
                                  });
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                isCheck = !isCheck;
                              });
                            },
                          text: 'By continuing Sign up you '
                              'agree to the following our ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isCheck = !isCheck;
                                    });
                                  },
                                text: 'Terms',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orangeAccent,
                                    fontSize: 15)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isCheck = !isCheck;
                                    });
                                  },
                                text: ' &'),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isCheck = !isCheck;
                                    });
                                  },
                                text: ' Conditions.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orangeAccent,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                /*CheckboxListTile(
                    activeColor: Colors.grey,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: RichText(
                      text: TextSpan(
                        text: 'By continuing Sign up you '
                            'agree to the following our ',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                        children: const <TextSpan>[
                          TextSpan(text: 'Terms', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orangeAccent, fontSize: 15)),
                          TextSpan(text: ' &'),
                          TextSpan(text: ' Conditions.',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orangeAccent, fontSize: 15)),
                        ],
                      ),
                    ),
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value!;
                      });
                    }),*/
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {

                        setState(() {
                          // email = _emailController.text.toString();
                          //userName = _userNameController.text.toString();
                          // password = _passwordController.text.toString();
                        });
                      }
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Have an account?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign In',
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("hello user");
                              })
                      ]),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
