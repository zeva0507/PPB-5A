import 'package:flutter/material.dart';

class FormMatkulPage extends StatefulWidget {
  const FormMatkulPage({super.key});

  @override
  State<FormMatkulPage> createState() => _FormMatkulPageState();
}

class _FormMatkulPageState extends State<FormMatkulPage> {
  final _formKey = GlobalKey<FormState>();
  final cKode = TextEditingController();
  final cNama = TextEditingController();
  final cSks = TextEditingController();

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "Kode Matkul": cKode.text,
        "Nama Matkul": cNama.text,
        "SKS": cSks.text,
      };

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Data Mata Kuliah"),
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
    cKode.dispose();
    cNama.dispose();
    cSks.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Mata Kuliah")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: cKode,
                decoration: const InputDecoration(
                  labelText: "Kode Mata Kuliah",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Kode wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cNama,
                decoration: const InputDecoration(
                  labelText: "Nama Mata Kuliah",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Nama wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: cSks,
                decoration: const InputDecoration(
                  labelText: "SKS",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "SKS wajib diisi" : null,
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
