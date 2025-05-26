import 'package:flutter/material.dart';

class KlasifikasiPoinPage extends StatelessWidget {
  const KlasifikasiPoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF488DB4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF488DB4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Klasifikasi Poin\nPelanggaran',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                ),
                
                // Table
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      // Table Header
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                                child: const Text(
                                  'Pelanggaran',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                child: const Text(
                                  'Poin',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Table Rows
                      _buildTableRow('Datang terlambat tanpa alasan yang jelas', '5'),
                      _buildTableRow('Tidak memakai seragam sesuai ketentuan', '5'),
                      _buildTableRow('Tidak memakai seragam sesuai ketentuan', '5'),
                      _buildTableRow('Tidak memakai seragam sesuai ketentuan', '5'),
                      _buildTableRow('Tidak memakai seragam sesuai ketentuan', '5'),
                      _buildTableRow('Tidak memakai seragam sesuai ketentuan', '5'),
                      _buildTableRow('Tidak memakai seragam sesuai ketentuan', '5', isLast: true),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableRow(String pelanggaran, String poin, {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE6E6E6), 
        border: isLast ? null : const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Text(
                pelanggaran,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                poin,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Contoh penggunaan dalam main.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klasifikasi Poin Pelanggaran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KlasifikasiPoinPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}