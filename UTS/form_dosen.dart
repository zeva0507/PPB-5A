import 'package:flutter/material.dart';

class FormDosenPage extends StatefulWidget {
  const FormDosenPage({super.key});

  @override
  State<FormDosenPage> createState() => _FormDosenPageState();
}

class _FormDosenPageState extends State<FormDosenPage> {
  final _formKey = GlobalKey<FormState>();
  final cNidn = TextEditingController();
  final cNama = TextEditingController();
  final cHomeBase = TextEditingController();
  final cEmail = TextEditingController();
  final cNoTlp = TextEditingController();

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "NIDN": cNidn.text,
        "Nama": cNama.text,
        "Home Base": cHomeBase.text,
        "Email": cEmail.text,
        "No Tlp": cNoTlp.text,
      };

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Data Dosen"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.entries
                .map((e) => Text("${e.key}: ${e.value}"))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    cNidn.dispose();
    cNama.dispose();
    cHomeBase.dispose();
    cEmail.dispose();
    cNoTlp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Dosen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: cNidn,
                decoration: const InputDecoration(
                  labelText: "NIDN",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "NIDN wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cNama,
                decoration: const InputDecoration(
                  labelText: "Nama Dosen",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Nama wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cHomeBase,
                decoration: const InputDecoration(
                  labelText: "Home Base",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cEmail,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cNoTlp,
                decoration: const InputDecoration(
                  labelText: "No Telepon",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Simpan"),
                onPressed: _simpan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
