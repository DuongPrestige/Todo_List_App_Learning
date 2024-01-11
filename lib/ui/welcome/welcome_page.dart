import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final bool isFirstTimeInstallApp;

  const WelcomePage({
    super.key,
    required this.isFirstTimeInstallApp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: isFirstTimeInstallApp
            ? IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                    size: 18, color: Colors.white),
              )
            : null,
      ),
      body: Column(
        children: [
          _buildTitleAndDesc(),
          const Spacer(),
          _buidButtonLogin(),
          _buidButtonRegister(),
        ],
      ),
    );
  }

  Widget _buildTitleAndDesc() {
    return Container(
      margin: EdgeInsets.only(top: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Welcome to UpTodo",
              style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontFamily: "Lato",
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Please login to your account or create new account to continue",
              style: TextStyle(
                color: Colors.white.withOpacity(0.67),
                fontFamily: "Lato",
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buidButtonLogin() {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
          onPressed: () {
            //
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )),
          child: const Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          )),
    );
  }

  Widget _buidButtonRegister() {
    return Container(
      width: double.infinity,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.symmetric(vertical: 28),
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
          child: const Text(
            "CREATE ACCOUNT",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          )),
    );
  }
}
