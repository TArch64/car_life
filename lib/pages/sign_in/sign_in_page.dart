import 'package:car_life/pages/base/page_layout.dart';
import 'package:flutter/cupertino.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _singingIn = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Text("test")
    );
  }
}
