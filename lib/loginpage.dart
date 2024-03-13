import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugastpm1/bottomnavigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  String username = "";
  String password = "";
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Image.asset('assets/images/logoif.png'),
                width: 150,
                height: 150,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  onChanged: (value){
                    username = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  onChanged: (value){
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text('Login'),
                  onPressed: () {
                    String text = "";
                    if(username == "123" && password == "123"){
                     setState(() {
                       text = "Login Success";
                       isLogin = true;
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context){
                             return BottomNavigation();
                           }),
                     );
                    }else{
                        setState(() {
                          text = "Login Fail";
                          isLogin = false;
                        });
                      }
                    SnackBar snackBar = SnackBar(content: Text(text), backgroundColor: (isLogin) ? Colors.green : Colors.red,);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
