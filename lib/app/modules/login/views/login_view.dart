import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:setera/app/modules/register/views/register_view.dart';


// Controller for login screen
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SETERA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
         color: const Color(0xFF5B9BD5), // Light blue background color
        child: Stack(
          children: [
            // Top section - Welcome text and mascot
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight * 0.4, // Takes up approximately 40% of screen
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to SETERA',
                      style: TextStyle(
                        color: Color(0xFFF0E8D5),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    
                    // Placeholder for mascot
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: Image.asset(
                        'assets/mascot/Group2.png', // Replace with your mascot image
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom section - Login container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: screenHeight * 0.65, // Takes up approximately 65% of screen
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFDBE9EB), // Light blue-gray background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Login Text
                    const Padding(padding: EdgeInsets.only(left:30),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF02183E),
                      ),
                    ),
                    ),
                    const SizedBox(height: 28),
                    
                    // Email Field
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFBFBFB),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // Password Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 43),
                    
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          // Aksi login di sini, misal validasi atau pindah halaman
                          Navigator.pushReplacementNamed(context, '/home');
                          print('Login button tapped');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF003366),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Spacer to push remaining content to the bottom
                    const Spacer(),
                    
                    // Or login with text
                    const Center(
                      child: Text(
                        'Atau login dengan',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Google button placeholder
                    Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/logo/google.png', // Replace with your Google icon
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Register link
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Tidak Punya Akun? ',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterView()),
                              );
                            },
                            child: const Text(
                              'Registrasi',
                              style: TextStyle(
                                color: Color(0xFF003366),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}