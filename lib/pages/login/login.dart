import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wahab_saab/pages/signup/sigup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(String email, String password) async {
  try {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    Response response = await dio.post(
      'https://staging.teacheraclickaway.com/api/teacher/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      // Login successful
      print('Login successful!');
    } else {
      // Login failed
      print('Login failed!');
    }
  } on DioError catch (e) {
    // Catch Dio errors
    if (e.response != null) {
      // Handle errors with response data
      print('Dio error: ${e.response!.data}');
    } else {
      // Handle other Dio errors
      print('Dio error: ${e.message}');
    }
  } catch (e) {
    // Catch other errors
    print('Error: $e');
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //login colum and butten
                Padding(
                  padding: const EdgeInsets.all(16),
                  child:Container(
                        margin: const EdgeInsets.only(bottom: 32.0),
                        child: const Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ),
                      Container(
                        padding:const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            if(!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]").hasMatch(value)){
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                            decoration: const InputDecoration(
                              label: Text("Email*"),
                            ),
                          ),
                      ),
                      Container(
                        padding:const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^ {6,}$');
                            if(value!.isEmpty){
                              return 'password is required';
                            }
                            if(regex.hasMatch(value)){
                              return 'password must be at least 6 characters';
                            }
                            return null;
                          },
                            
                            decoration:  InputDecoration(
                              label: const Text("Password"),
                              suffixIcon: InkWell(
                                          onTap: (){
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                       
                                       },
                                       
                                        child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                            ),
                            ),
                            obscureText: _obscureText,
                            ),
                            
                      ),
                        const SizedBox(
                        height: 20,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot Password?',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Material(
                        color: const Color.fromARGB(255, 0, 8, 79),
                        borderRadius:
                            BorderRadius.circular(14),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 2, 56, 85),
                          onTap: () {
                            login(emailController.text.toString(),passwordController.text.toString());
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: 300,
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                        child: Center(
                          child: Text(
                              '------------------OR---------------------'),
                        ),
                      ),
                      Material(
                        color: const Color.fromARGB(255, 0, 8, 79),
                        borderRadius:
                            BorderRadius.circular(14),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 2, 56, 85),
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context){
                                  return const SignupPage();
                                  },
                                  ),
                                  );
                          },
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
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          );
  }
  
}
