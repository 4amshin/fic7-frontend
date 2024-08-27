import 'package:fic7_fe/common/constants/colors.dart';
import 'package:fic7_fe/common/constants/custom_theme.dart';
import 'package:fic7_fe/common/constants/dimension.dart';
import 'package:fic7_fe/common/widgets/custom_button.dart';
import 'package:fic7_fe/common/widgets/custom_password_text_field.dart';
import 'package:fic7_fe/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ApSignIn extends StatefulWidget {
  const ApSignIn({Key? key}) : super(key: key);

  @override
  _ApSignInState createState() => _ApSignInState();
}

class _ApSignInState extends State<ApSignIn> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  void loginUser() async {
    if (_formKeyLogin!.currentState!.validate()) {
      _formKeyLogin!.currentState!.save();

      String email = _emailController!.text.trim();
      String password = _passwordController!.text.trim();

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email'),
            backgroundColor: Colors.red,
          ),
        );
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.marginSizeLarge),
      child: Form(
        key: _formKeyLogin,
        child: ListView(
          padding:
              const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
          children: [
            //Email Field
            Container(
              margin: const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
              child: CustomTextField(
                hintText: 'Email',
                focusNode: _emailNode,
                nextNode: _passNode,
                textInputType: TextInputType.emailAddress,
                controller: _emailController,
              ),
            ),
            //Password Field
            Container(
              margin:
                  const EdgeInsets.only(bottom: Dimensions.marginSizeDefault),
              child: CustomPasswordTextField(
                hintTxt: 'Password',
                textInputAction: TextInputAction.done,
                focusNode: _passNode,
                controller: _passwordController,
              ),
            ),
            //Remember Me & Forgot Password
            Container(
              margin: const EdgeInsets.only(right: Dimensions.marginSizeSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remember Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        checkColor: ColorResources.white,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (val) {},
                      ),
                      Text(
                        'Remember Me',
                        style: titilliumRegular,
                      ),
                    ],
                  ),
                  //Forgot Password
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password',
                      style: titilliumRegular.copyWith(
                        color: ColorResources.getLightSkyBlue(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Sign In Button
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 30),
              child: CustomButton(
                onTap: loginUser,
                buttonText: 'Sign In',
              ),
            ),
            Center(
              child: Text(
                'OR',
                style: titilliumRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(
                  left: Dimensions.marginSizeAuth,
                  right: Dimensions.marginSizeAuth,
                  top: Dimensions.marginSizeAuthSmall,
                ),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Continue as Guest',
                  style: titleHeader.copyWith(
                    color: ColorResources.getPrimary(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
