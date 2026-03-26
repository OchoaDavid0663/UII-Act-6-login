import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class Bienvenidos extends StatelessWidget {
  const Bienvenidos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "¡Bienvenido!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Farmacias Similares\nLo mismo pero más barato",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 40),
              // Imagen del Dr. Simi o Salud
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-UII-Act-5-GridView-2-X-7/refs/heads/main/Peluche2.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())),
                  child: const Text("INICIAR SESIÓN", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E5FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp())),
                  child: const Text("REGISTRARSE", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}