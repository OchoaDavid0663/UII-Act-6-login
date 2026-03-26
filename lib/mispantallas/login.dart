import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Ingresa a tu cuenta", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            _buildInput("Correo Electrónico", Icons.email_outlined),
            const SizedBox(height: 20),
            _buildInput("Contraseña", Icons.lock_outline, isPass: true),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E5FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text("ENTRAR", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¿No tienes cuenta? "),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp())),
                  child: const Text("Regístrate", style: TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, IconData icon, {bool isPass = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPass,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xFF00E5FF)),
            filled: true,
            fillColor: const Color(0xFF252733),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}