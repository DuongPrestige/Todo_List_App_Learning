import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  var _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageTitle(),
              SizedBox(height: 32),
              _buildFormRegister(),
              _buildOrSplitDivider(),
              _buildSocialRegister(),
              _buildHaveNotAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white.withOpacity(0.87),
          fontFamily: "Lato",
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildFormRegister() {
    return Form(
        key: _formkey,
        autovalidateMode: _autoValidateMode,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUsernameField(),
              SizedBox(height: 25),
              _buildPasswordField(),
              SizedBox(height: 25),
              _buildConfirmPasswordField(),
              _buildLoginButton(),
            ],
          ),
        ));
  }

  Widget _buildUsernameField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Username",
          style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontFamily: "Lato",
            fontSize: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your Username",
              hintStyle: TextStyle(
                color: Color(0xFF535353),
                fontFamily: "Lato",
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: Color(0xFF1D1D1D),
              filled: true,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }

              final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (emailValid) {
                return null;
              } else {
                return "Email khong hop le!";
              }
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontFamily: "Lato",
            fontSize: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "* * * * * * * *",
              hintStyle: TextStyle(
                color: Color(0xFF535353),
                fontFamily: "Lato",
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: Color(0xFF1D1D1D),
              filled: true,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Password khong the de trong";
              }
              if (value.length < 6) {
                return "Password phai tu 6 ky tu tro len";
              }
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 16,
            ),
            obscureText: true,
          ),
        )
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm Password",
          style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontFamily: "Lato",
            fontSize: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "* * * * * * * *",
              hintStyle: TextStyle(
                color: Color(0xFF535353),
                fontFamily: "Lato",
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: Color(0xFF1D1D1D),
              filled: true,
            ),
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 16,
            ),
            obscureText: true,
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 48,
      margin: EdgeInsets.only(top: 70),
      child: ElevatedButton(
        onPressed: _onHandleLoginSubmit, // muon disable thi tra ve null
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8875FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            disabledBackgroundColor: Color(0xFF8687E7).withOpacity(0.5)),
        child: const Text(
          "Register",
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Lato",
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildOrSplitDivider() {
    return Container(
      margin: EdgeInsets.only(top: 45, bottom: 40),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color(0xFF979797),
            ),
          ),
          Text(
            "or",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
              color: Color(0xFF979797),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color(0xFF979797),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialRegister() {
    return Column(
      children: [
        _buildSocialGoogleLogin(),
        _buildSocialAppleLogin(),
      ],
    );
  }

  Widget _buildSocialAppleLogin() {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
          onPressed: () {
            //
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(
              width: 1,
              color: Color(0xFF8875FF),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/apple.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  "Register with Google",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildSocialGoogleLogin() {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
          onPressed: () {
            //
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(
              width: 1,
              color: Color(0xFF8875FF),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/google.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  "Register with Google",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildHaveNotAccount(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 46, bottom: 40),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(
            fontSize: 12,
            fontFamily: "Lato",
            fontWeight: FontWeight.w400,
            color: Color(0xFF979797),
          ),
          children: [
            TextSpan(
                text: "Login",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.87),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  }),
          ],
        ),
      ),
    );
  }

  void _onHandleLoginSubmit() {
    if (_autoValidateMode == AutovalidateMode.disabled)
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });

    final isValid = _formkey.currentState?.validate() ?? false;
    if (isValid) {
    } else {
      //do nothing
    }
  }
}
