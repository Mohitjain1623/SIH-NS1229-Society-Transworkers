import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import '../routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          setState(() {
            stateTextWithIcon = ButtonState.loading;
          });
          await Future.delayed(Duration(milliseconds: 2000));
          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
          stateTextWithIcon = ButtonState.success;
          await Future.delayed(Duration(milliseconds: 1000));
          await Navigator.pushReplacementNamed(context, MyRoutes.dashboardRoute);
          setState(() {
            stateTextWithIcon = ButtonState.idle;
          });
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
      setState(() {
        stateTextWithIcon = stateTextWithIcon;
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
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
                            text: "Login",
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
                          context, MyRoutes.signupRoute),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(32.0, 10.0, 32.0, 10.0),
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
