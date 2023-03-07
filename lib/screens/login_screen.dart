import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_ui/resources/auth_methods.dart';
import 'package:instagram_ui/screens/signup_screen.dart';
import 'package:instagram_ui/utlis/Colors.dart';
import 'package:instagram_ui/utlis/utlis.dart';
import 'package:instagram_ui/widgets/text_input_field.dart';

import '../responsive/mobileScreen.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/webScreen.dart';
import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreen(),
                webScreenLayout: WebScreen(),
              )));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container()),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldd(
              textEditingController: _emailController,
              hintText: 'Phone number, email or username',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldd(
              textEditingController: _passwordController,
              hintText: 'Password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: loginUser,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueColor,
                ),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text("Log in"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot your login details?",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "Get help logging in.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  color: Colors.white.withOpacity(0.3),
                  height: 1,
                  child: const Text("hi"),
                ),
                Text(
                  " OR ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  color: Colors.white.withOpacity(0.3),
                  height: 1,
                  child: Text("hi"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blueColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.facebook),
                  Text(" Login with Facebook"),
                ],
              ),
            ),
            Flexible(child: Container()),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
            const Text(
              " Sign up.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
