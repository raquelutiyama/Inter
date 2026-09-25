import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// cores
const Color azul = Color(0xFF2563EB);
const Color azulEscuro = Color(0xFF1D4ED8);
const Color azulClaro = Color(0xFFEFF6FF);
const Color cinzaFundo = Color(0xFFF3F4F6);
const Color cinzaTexto = Color(0xFF6B7280);
const Color cinzaBorda = Color(0xFFE5E7EB);
const Color vermelhoPanico = Color(0xFFDC2626);
const Color vermelhoClaro = Color(0xFFFEF2F2);
const Color amarelo = Color(0xFFF59E0B);
const Color verde = Color(0xFF16A34A);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Central de Segurança",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: azul,
          primary: azul,
        ),
        scaffoldBackgroundColor: cinzaFundo,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: cinzaBorda,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: azul,
              width: 2,
            ),
          ),
        ),
      ),
      routes: {
        "/login": (context) => const LoginPage(),
        "/registro": (context) => const RegistroPage(),
        "/home": (context) => const HomePage(),
      },
      initialRoute: "/login",
    );
  }
}

// login

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();
  bool esconderSenha = true; 
  void entrar() {
    if (txtEmail.text.trim().isEmpty ||
        txtSenha.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Digite seu e-mail e sua senha.",
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      "/home",
    );
  }
  @override
  void dispose() {
    txtEmail.dispose();
    txtSenha.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 430,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: azul,
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.shield_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    "Bem-vindo!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Acesse sua central de segurança.",
                    style: TextStyle(
                      color: cinzaTexto,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: txtEmail,
                    keyboardType:
                        TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      prefixIcon:
                          Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: txtSenha,
                    obscureText: esconderSenha,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            esconderSenha =
                                !esconderSenha;
                          });
                        },
                        icon: Icon(
                          esconderSenha
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: entrar,
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor: azul,
                        foregroundColor: Colors.white,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),

                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/registro",
                      );
                    },
                    child: const Text(
                      "Criar uma conta",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// registro

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});
  @override
  State<RegistroPage> createState() =>
      _RegistroPageState();
}
class _RegistroPageState extends State<RegistroPage> {
  final txtNome = TextEditingController();
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();
  bool esconderSenha = true;
  void registrar() {
    if (txtNome.text.trim().isEmpty ||
        txtEmail.text.trim().isEmpty ||
        txtSenha.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Preencha todos os campos.",
          ),
        ),
      );
      return;
    }
    Navigator.pushReplacementNamed(
      context,
      "/home",
    );
  }
  @override
  void dispose() {
    txtNome.dispose();
    txtEmail.dispose();
    txtSenha.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Criar conta",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Crie sua conta",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Preencha seus dados para continuar.",
              style: TextStyle(
                color: cinzaTexto,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: txtNome,

              decoration: const InputDecoration(
                labelText: "Nome",
                prefixIcon:
                    Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                labelText: "E-mail",
                prefixIcon:
                    Icon(Icons.email_outlined),
              ),
            ),

            const SizeBox(height: 16),
            TextField(
              controller: txtSenha,

              obscureText: esconderSenha,

              decoration: InputDecoration(
                labelText: "Senha",

                prefixIcon: const Icon(
                  Icons.lock_outline,
                ),

                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      esconderSenha =
                          !esconderSenha;
                    });
                  },

                  icon: Icon(
                    esconderSenha
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: registrar,

                child: const Text(
                  "Criar conta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Voltar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
