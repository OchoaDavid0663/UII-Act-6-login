import 'package:flutter/material.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMILARES',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1D),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1D1E33),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
      home: const Bienvenidos(),
    );
  }
}

// --- ESTILOS REUTILIZABLES ---
const kCyanColor = Color(0xFF00E5FF);
const kInputFillColor = Color(0xFF252733);

// --- 1. PANTALLA DE BIENVENIDA (CORREGIDA SIN OVERFLOW) ---
class Bienvenidos extends StatelessWidget {
  const Bienvenidos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // <--- Esto evita las franjas amarillas
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
                const SizedBox(height: 30),
                // Imagen del Dr. Simi (Ajustada para que quepa bien)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://raw.githubusercontent.com/OchoaDavid0663/UII-Act-6-login/refs/heads/main/logon-Photoroom.png',
                    height: 220, 
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),
                // Botón Login
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
                // Botón Registro
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kCyanColor,
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
      ),
    );
  }
}

// --- 2. PANTALLA DE LOGIN ---
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
            const Text("Iniciar Sesión", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Ingresa a tu cuenta de Similares", style: TextStyle(color: Colors.grey)),
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
                  backgroundColor: kCyanColor,
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
                  child: const Text("Regístrate", style: TextStyle(color: kCyanColor, fontWeight: FontWeight.bold)),
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
            prefixIcon: Icon(icon, color: kCyanColor),
            filled: true,
            fillColor: kInputFillColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}

// --- 3. PANTALLA DE REGISTRO ---
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
            const Text("Crear Cuenta", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Es gratis y rápido", style: TextStyle(color: Colors.grey)),
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
                  backgroundColor: kCyanColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text("REGISTRARME", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            prefixIcon: Icon(icon, color: kCyanColor),
            filled: true,
            fillColor: kInputFillColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}