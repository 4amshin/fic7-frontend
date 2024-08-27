import 'package:fic7_fe/common/constants/colors.dart';
import 'package:fic7_fe/common/constants/custom_theme.dart';
import 'package:fic7_fe/common/constants/dimension.dart';
import 'package:fic7_fe/common/widgets/custom_button.dart';
import 'package:fic7_fe/common/widgets/custom_password_text_field.dart';
import 'package:fic7_fe/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ApSignUp extends StatefulWidget {
  const ApSignUp({Key? key}) : super(key: key);

  @override
  _ApSignUpState createState() => _ApSignUpState();
}

class _ApSignUpState extends State<ApSignUp> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState>? _formKey;

  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool isEmailVerified = false;

  addUser() async {
    if (_formKey!.currentState!.validate()) {
      _formKey!.currentState!.save();
      isEmailVerified = true;
    } else {
      isEmailVerified = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      children: [
        //Register Field
        Form(
          child: Column(
            children: [
              //Name
              Container(
                margin: const EdgeInsets.only(
                    left: Dimensions.marginSizeDefault,
                    right: Dimensions.marginSizeDefault),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      hintText: 'Name',
                      textInputType: TextInputType.name,
                      focusNode: _fNameFocus,
                      nextNode: _lNameFocus,
                      isPhoneNumber: false,
                      capitalization: TextCapitalization.words,
                      controller: _firstNameController,
                    )),
                    //Email
                  ],
                ),
              ),
              //Email
              Container(
                margin: const EdgeInsets.only(
                    left: Dimensions.marginSizeDefault,
                    right: Dimensions.marginSizeDefault,
                    top: Dimensions.marginSizeSmall),
                child: CustomTextField(
                  hintText: 'Email',
                  focusNode: _emailFocus,
                  nextNode: _phoneFocus,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
              ),
              //Password
              Container(
                margin: const EdgeInsets.only(
                    left: Dimensions.marginSizeDefault,
                    right: Dimensions.marginSizeDefault,
                    top: Dimensions.marginSizeSmall),
                child: CustomPasswordTextField(
                  hintTxt: 'Password',
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  nextNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.next,
                ),
              ),
              //Password Confirmation
              Container(
                margin: const EdgeInsets.only(
                    left: Dimensions.marginSizeDefault,
                    right: Dimensions.marginSizeDefault,
                    top: Dimensions.marginSizeSmall),
                child: CustomPasswordTextField(
                  hintTxt: 'Password Confirmation',
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
        ),
        //Sign Up Button
        Container(
          margin: const EdgeInsets.only(
              left: Dimensions.marginSizeLarge,
              right: Dimensions.marginSizeLarge,
              bottom: Dimensions.marginSizeLarge,
              top: Dimensions.marginSizeLarge),
          child: CustomButton(
            onTap: addUser,
            buttonText: 'Sign Up',
          ),
        ),
        //Skip Link
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Skip for Now',
                style: titilliumRegular.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                  color: ColorResources.getPrimary(context),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 15,
              color: Theme.of(context).primaryColor,
            )
          ],
        )),
      ],
    );
  }
}
