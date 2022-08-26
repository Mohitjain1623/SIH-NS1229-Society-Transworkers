import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/interestpage.dart';
import 'package:pib_project/util/apifinal.dart';
import 'package:pib_project/util/dashboard.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import '../routes.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String username = "";
  String email = "";
  String number = "";
  String password = "";
  bool showPassword = true;
  final _formKey = GlobalKey<FormState>();
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      switch (stateTextWithIcon) {
        case ButtonState.idle:
          stateTextWithIcon = ButtonState.loading;
          setState(() {});
          await Future.delayed(Duration(milliseconds: 2000));
          // number = "";

          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
          print("username: $username");
          print("email: $email");
          print("number: $number");
          print("password: $password");
          await ApiCalling()
              .createUser(username, email, number, password)
              .then((value) async {
            if (value == "200") {
              setState(() {});
              stateTextWithIcon = ButtonState.success;
              await Future.delayed(Duration(milliseconds: 1000));
              await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoard(),
                  ));
              setState(() {});
            } else {
              stateTextWithIcon = ButtonState.fail;
              await Future.delayed(Duration(milliseconds: 1000));
            }
          });

          stateTextWithIcon = ButtonState.idle;

          setState(() {});
          break;
        case ButtonState.fail:
          stateTextWithIcon = ButtonState.idle;
          break;
        case ButtonState.loading:
          break;
        case ButtonState.success:
          stateTextWithIcon = ButtonState.idle;
          break;
      }
      // setState(() {
      //   stateTextWithIcon = stateTextWithIcon;
      // });
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
                height: MediaQuery.of(context).size.height * 0.15,
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
                      // keyboardType: const TextInputType.numberWithOptions(
                      //     signed: true, decimal: true),
                      decoration: InputDecoration(
                          // prefix: Text("+91 "),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: "Enter Username",
                          labelText: "Username"),
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 3) {
                          return "Enter Username";
                        }
                        username = value;
                        return null;
                      },
                      // onChanged: (value) {
                      //   if (value.length == 10) {
                      //     setState(() {
                      //       FocusScopeNode currentFocus =
                      //       FocusScope.of(context);
                      //       currentFocus.unfocus();
                      //       number = value;
                      //     });
                      //   }
                      // },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      // keyboardType: const TextInputType.numberWithOptions(
                      //     signed: true, decimal: true),
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      //   LengthLimitingTextInputFormatter(10)
                      // ],
                      decoration: InputDecoration(
                          // prefix: Text("+91 "),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: "Enter Email",
                          labelText: "Email"),
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Enter Email";
                        }
                        email = value;
                        return null;
                      },
                      // onChanged: (value) {
                      //   if (value.length == 10) {
                      //     setState(() {
                      //       FocusScopeNode currentFocus =
                      //       FocusScope.of(context);
                      //       currentFocus.unfocus();
                      //       number = value;
                      //     });
                      //   }
                      // },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        LengthLimitingTextInputFormatter(10)
                      ],
                      decoration: InputDecoration(
                          prefix: Text("+91 "),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: "Enter Phone Number",
                          labelText: "Phone Number"),
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Enter Phone Number";
                        }
                        number = value;
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: "Enter Password",
                          labelText: "Password"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should contain atleast 6 character";
                        }
                        password = value;
                        return null;
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: "Confirm Password",
                          labelText: "Re-Enter Password"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should contain atleast 6 character";
                        }
                        // else if (value != number) {
                        //   return "Password should be same";
                        // }
                        password = value;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    // AnimatedContainer(
                    //   // color: Colors.grey,
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue,
                    //     borderRadius: BorderRadius.circular(20.0),
                    //   ),
                    // borderRadius:
                    // BorderRadius.circular(changeButton ? 50 : 8),
                    // duration: Duration(milliseconds: 1500),
                    ProgressButton.icon(
                        onPressed: () => moveToHome(context),
                        state: stateTextWithIcon,
                        iconedButtons: const {
                          ButtonState.idle: IconedButton(
                            icon:
                                Icon(Icons.login_rounded, color: Colors.white),
                            color: Colors.black,
                            text: "Sign Up",
                          ),
                          ButtonState.loading: IconedButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                            text: "Loading",
                          ),
                          ButtonState.success: IconedButton(
                            icon: Icon(Icons.check, color: Colors.white),
                            color: Colors.green,
                            text: "Success",
                          ),
                          ButtonState.fail: IconedButton(
                            icon: Icon(Icons.cancel, color: Colors.white),
                            color: Colors.redAccent,
                            text: "Failure",
                          ),
                        }),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "or",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, MyRoutes.loginRoute),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Login",
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
