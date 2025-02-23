import 'package:flutter/material.dart';
import 'package:http/http.dart'; // why not as http ???????

class PostApiExample1 extends StatefulWidget {
  const PostApiExample1({super.key});

  @override
  State<PostApiExample1> createState() => _PostApiExample1State();
}

class _PostApiExample1State extends State<PostApiExample1> {
  // Declare
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function
  // WHY Variables are mentioned Here????
  void login(String email, password) async {
    try {
      Response response = await post(
          // Chage URL W.R.T Login / Signup
          Uri.parse('https://reqres.in/api/register'),

          // ????????????????????
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        print('Sign Up Success');
      } else {
        print('Sign Up ERROR');
      }
    } catch (e) {
      print('Exception $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P O S T A P I'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'EMAIL',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'PASSWORD',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  //????
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
