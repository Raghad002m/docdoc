import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Password visibility toggle
  bool _obscurePassword = true;

  Future<void> _loginWithSupabase() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // ✅ Login successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Onboard()),
        );
      }
    } on AuthException catch (error) {
      _showSnackbar(error.message);
    } catch (_) {
      _showSnackbar("Unexpected error. Please try again.");
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 10),


              const Text(
                "We're excited to have you back, can't wait to/n"
                    " see what you've been up to since you last/n"
                    " logged in.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),

              const SizedBox(height: 16),
            class _YourStatefulWidgetState extends , State<YourStatefulWidget> {
              final TextEditingController _passwordController = TextEditingController();
        bool _obscurePassword = true;

        @override
        Widget build(BuildContext context) {
    return Column(
    children: [
    TextFormField(
    controller: _passwordController,
    obscureText: _obscurePassword,
    decoration: InputDecoration(
    hintText: "Enter your password", // أو: "Password"
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Color(0xFF1D9AC6), width: 2),
    ),
    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF1D9AC6)),
    suffixIcon: IconButton(
    icon: Icon(
    _obscurePassword ? Icons.visibility_off : Icons.visibility,
    color: const Color(0xFF1D9AC6),
    ),
    onPressed: () {
    setState(() {
    _obscurePassword = !_obscurePassword;
    });
    },
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    filled: true,
    fillColor: Colors.grey[100],
    ),
    ),

    const SizedBox(height: 10),
    ],
    );


    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    Checkbox(
    value: false,
    onChanged: (value) {},
    ),
    const Text("Remember me"),
    ],
    ),
    TextButton(
    onPressed: () {},
    child: const Text(
    "Forgot Password?",
    style: TextStyle(color: Colors.blue),
    ),
    ),
    ],
    ),

    const SizedBox(height: 10),

    SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    child: const Text(
    "Login",
    style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    ),
    ),

    const SizedBox(height: 20),

    Row(
    children: const [
    Expanded(child: Divider(thickness: 1)),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    child: Text("Or sign in with"),
    ),
    Expanded(child: Divider(thickness: 1)),
    ],
    ),

    const SizedBox(height: 16),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Image.asset("assets/google.jpg", height: 40),
    Image.asset("assets/facebook.jpg", height: 40),
    Image.asset("assets/apple.jpg", height: 40),
    ],
    ),

    const SizedBox(height: 20),

    Center(
    child: Text.rich(
    TextSpan(
    text: "By logging, you agree to our ",
    style: const TextStyle(fontSize: 12),
    children: [
    TextSpan(
    text: "Terms & Conditions ",
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    const TextSpan(text: "and "),
    TextSpan(
    text: "Privacy Policy",
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    ],
    ),
    textAlign: TextAlign.center,
    ),
    ),

    const SizedBox(height: 16),


    Center(
    child: Text.rich(
    TextSpan(
    text: "Don’t have account? ",
    children: [
    TextSpan(
    text: "Create now",
    style: const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    style: const TextStyle(fontSize: 13),
    ),
    ),
    ],}
        ),}]
        ),
      ),
    ));
  }
}
