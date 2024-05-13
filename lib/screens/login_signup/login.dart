import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/auth_provider.dart';
import '../../models/user.dart';
import '../profile/profile_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _login(BuildContext context) async {
      final email = emailController.text.trim();
      final password = passwordController.text;
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      try {
        User? authenticatedUser =
            await authProvider.login(context, email, password);
        if (authenticatedUser != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProfilePage(
                  user:
                      authenticatedUser), // Pass the authenticated user to ProfilePage
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/img4.jpg'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 300),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromRGBO(34, 185, 127, 1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(76, 223, 166, 1),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 5))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                124, 184, 161, 1)))),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or Phone number",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700])),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(124, 184, 161, 1),
                                Color.fromRGBO(160, 218, 194, 0.6),
                              ])),
                          child: TextButton(
                            onPressed: () {
                              _login(context);
                            },
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color.fromRGBO(124, 184, 161, 1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: Colors.black,
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
