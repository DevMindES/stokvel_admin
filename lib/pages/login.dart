import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';
import '../controllers/auth_controller.dart';
import '../utils/error_handling.dart';
import '../utils/theme_data.dart';
import '../utils/utils.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final _authController = AuthController.instance;
  final _appController = AppController.instance;

  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;


  bool _allFieldsFilled() {
    if (_emailOrPhoneController.text.trim().isEmpty) return false;
    if (_passwordController.text.trim().isEmpty) return false;
    return true;
  }

  Future<void> _loginButtonOnPresed() async
  {
    if (!_allFieldsFilled()) {
      await showGetMessageDialog(
        'Info',
        'Please fill out all text fields.'
      );
      
      return;
    }

    final isEmailORphone = isEmailOrPhone(emailOrPhone: _emailOrPhoneController.text.trim());

    if (isEmailORphone == -1) {
      await showGetMessageDialog(
        'Info',
        'Please ensure you have entered a valid email address or phone number'
      );

      return;
    }

    String? phoneNumber;

    if (isEmailORphone == 0 && !_emailOrPhoneController.text.trim().startsWith('+268')) {
      phoneNumber = '+268${_emailOrPhoneController.text.trim()}';
    }

    await _authController.login(
      email: phoneNumber ?? _emailOrPhoneController.text.trim(),
      password: _passwordController.text.trim()
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // building image
              spacer1(),
              Container(
                width: widgetWidth(context) * 0.50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: const Image(
                  image: AssetImage('assets/images/intro_building_rect.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              // // greeting text
              spacer1(),
              Align(
                child: Text(
                  'Hello, please sign in below',
                  style: contentTextStyle(
                    fontSize: h1,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              // user details form
              spacer1(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  child: Column(
                    children: [
                      // EMAIL OR PHONE NUMBER
                      _appController.formDataField(
                        fieldController: _emailOrPhoneController,
                        lableText: 'Email or Phone number',
                        textInputType: TextInputType.emailAddress,
                        width: widgetWidth(context)
                      ),
                      spacer3(),
                      // PASSWORD
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          width: widgetWidth(context),
                          decoration: BoxDecoration(
                            color: white, //.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {return 'Please enter some text';}
                              return null;
                            },
                            controller: _passwordController,
                            style: const TextStyle(
                              fontSize: h3,
                              color: dark_fonts_grey
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: _isPasswordVisible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                onPressed:() => setState(() => _isPasswordVisible = !_isPasswordVisible),
                                color: Colors.redAccent,
                              ),
                              labelText: 'Password',
                              labelStyle: contentTextStyle(
                                fontColor: primary_blue,
                                fontSize: h4
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                          ),
                        ),
                      ),
              
                    ],
                  )
                ),
              ),
              spacer3(),
              // fORGOT PASSWORD
                SizedBox(
                  width: widgetWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async
                        {
                          if (_emailOrPhoneController.text.trim().isEmpty) {
                            await showMyDialog(
                              context,
                              'Password reset info',
                              'Please fill in your email first'
                            );
                      
                            return;
                          }
                      
                          if (!EmailValidator.validate(_emailOrPhoneController.text.trim())) {
                            showMyDialog(
                              context,
                              'Info',
                              'Please enter a valid email address'
                            );
                      
                            return;
                          }
                      
                          await _authController.forgotPassword(email: _emailOrPhoneController.text.trim());
                        },
                        child: Text(
                          'Forgot password?',
                          style: contentTextStyle(
                            fontColor: primary_blue,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                spacer3(),
              // LOGIN
              _appController.neuBox(
                onTap: _loginButtonOnPresed,
                width: widgetWidth(context),
                child: Center(
                  child: Text(
                    'Login',
                    style: contentTextStyle(
                      fontSize: h3,
                      fontColor: Colors.white)
                  ),
                )
              ),
              // to REGISTER page
              spacer1(),
            ]
          ),
        ),
      ),
    );
  }

  @override void dispose()
  {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}