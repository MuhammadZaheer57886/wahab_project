import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                
                const SizedBox(
                  height: 20,
                ),
                
                const SizedBox(
                  height: 20,
                ),
                //login colum and butten
                Padding(
                  
                  padding:
                      const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
              margin: const EdgeInsets.only(bottom: 32.0),
              child: const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                      Form(
                        
                        
                          child: TextFormField(
                            decoration: const InputDecoration(
                              
                              label: Text("Email*"),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username can not be empty";
                              }
                              return null;
                            },
                            //for state fulwiget
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                          ),
                        ),
                      TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                            label: Text("Password"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password can not be empty";
                            } else if (value.length < 8) {
                              return "Password must be up to 8 Characters";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        color:const Color.fromARGB(255, 14, 2, 88),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 30, 150, 215),
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50 : 300,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                        
                      ),
                      const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            '-------------------------------------OR-------------------------------------'
                          ),
                        ),
                      ),
                      Material(
                        color: const Color.fromARGB(255, 14, 2, 88),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 30, 150, 215),
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: 300,
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
