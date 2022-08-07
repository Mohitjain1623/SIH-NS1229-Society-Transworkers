import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String number = "";
  bool changeButton = false;
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 350));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        FocusScopeNode currentFocus =
        FocusScope.of(context);
        currentFocus.unfocus();
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // Image.asset(
              //   "assets/aazadi-ka-mahotsav.png",
              //   fit: BoxFit.cover,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        LengthLimitingTextInputFormatter(10)
                      ],
                      decoration: InputDecoration(

                          prefix: Text("+91 "),
                          border: OutlineInputBorder(),
                          hintText: "Enter Phone Number",
                          labelText: "Phone Number"),
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Enter Phone Number";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            currentFocus.unfocus();
                            number = value;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: showPassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          labelText: "Password"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should contain atleast 6 character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    AnimatedContainer(
                      // color: Colors.grey,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      // borderRadius:
                      // BorderRadius.circular(changeButton ? 50 : 8),
                      duration: Duration(milliseconds: 1500),
                      child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            width: changeButton ? 45 : 140.0,
                            height: 45.0,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                            duration: Duration(milliseconds: 320),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("or", style: TextStyle(fontSize: 16,color: Colors.grey),),
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, MyRoutes.homeRoute),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Create new account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                              )),
                      ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
