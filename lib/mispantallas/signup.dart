import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Text("Registrarse", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Crea una cuenta gratis", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            _buildInput("Usuario", Icons.person_outline),
            const SizedBox(height: 15),
            _buildInput("Email", Icons.email_outlined),
            const SizedBox(height: 15),
            _buildInput("Contraseña", Icons.lock_outline, isPass: true),
            const SizedBox(height: 15),
            _buildInput("Confirmar Contraseña", Icons.lock_reset, isPass: true),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E5FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text("CREAR CUENTA", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
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