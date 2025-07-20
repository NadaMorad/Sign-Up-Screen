import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _handleSignUp() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمتا المرور غير متطابقتين.')),
      );
      return;
    }
    print('بيانات التسجيل:');
    print('اسم المستخدم: ${_usernameController.text}');
    print('البريد الإلكتروني: ${_emailController.text}');
    print('كلمة المرور: ${_passwordController.text}');

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم التسجيل بنجاح!')));
  }

  void _handleGoogleSignUp() {
    print('جاري التسجيل باستخدام جوجل...');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('جاري التسجيل باستخدام جوجل...')),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 30),
              _buildColoredInputField(
                controller: _usernameController,
                hintText: 'Username',
                icon: Icons.person,
              ),
              const SizedBox(height: 15),
              _buildColoredInputField(
                controller: _emailController,
                hintText: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              _buildColoredInputField(
                controller: _passwordController,
                hintText: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 15),
              _buildColoredInputField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 300.0,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF8A2BE2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Or',
                style: TextStyle(color: Color(0xFF888888), fontSize: 16),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300.0,
                height: 50,
                child: OutlinedButton(
                  onPressed: _handleGoogleSignUp,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF8A2BE2),
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Color(0xFF8A2BE2),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Go to Login Screen');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF8A2BE2),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColoredInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 50,
      width:
          MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
        color: const Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF888888),
          ),
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF888888),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
