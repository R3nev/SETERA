import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Jika pakai GetX

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beranda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // Data pelanggaran lebih bervariasi
  final List<Map<String, String>> customers = [
    {
      'type': 'late',
      'status': 'Terlambat',
      'date': '12 Januari 2025',
      'description': 'Ditinjau oleh: Zayne, S.Pd'
    },
    {
      'type': 'uniform',
      'status': 'Tidak Pakai Seragam',
      'date': '13 Januari 2025',
      'description': 'Ditinjau oleh: Caleb, S.Pd'
    },
    {
      'type': 'homework',
      'status': 'Tidak Mengerjakan PR',
      'date': '14 Januari 2025',
      'description': 'Ditinjau oleh: Xavier, S.Pd'
    },
    {
      'type': 'skip',
      'status': 'Membolos',
      'date': '15 Januari 2025',
      'description': 'Ditinjau oleh: Rafayel, S.Pd'
    },
    {
      'type': 'noisy',
      'status': 'Bersikap Berisik',
      'date': '16 Januari 2025',
      'description': 'Ditinjau oleh: Ren, S.Pd'
    },
  ];

  // Fungsi untuk menentukan icon berdasarkan type
  IconData getViolationIcon(String type) {
    switch (type) {
      case 'late':
        return Icons.access_time;
      case 'uniform':
        return Icons.checkroom;
      case 'homework':
        return Icons.menu_book;
      case 'skip':
        return Icons.directions_run;
      case 'noisy':
        return Icons.volume_up;
      default:
        return Icons.warning;
    }
  }

  // Fungsi untuk menentukan warna background icon
  Color getViolationColor(String type) {
    switch (type) {
      case 'late':
        return Colors.orange.shade100;
      case 'uniform':
        return Colors.blue.shade100;
      case 'homework':
        return Colors.red.shade100;
      case 'skip':
        return Colors.purple.shade100;
      case 'noisy':
        return Colors.green.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = 0;
      });
    } else if (index == 1) {
      // Navigasi ke halaman lain, contoh:
      Navigator.pushNamed(context, '/receipt'); // Pastikan route '/receipt' sudah ada
    } else if (index == 2) {
      Navigator.pushNamed(context, '/profile'); // Pastikan route '/profile' sudah ada
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top blue section with profile and wave effect
          Stack(
            children: [
              // Blue background
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  color: Color(0xFF5B9BD5),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        // Profile picture placeholder
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Greeting text
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Qin Sylus Che',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Wave overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 50,
                    color: const Color(0xFFF0F5FA), // biru muda mendekati putih
                  ),
                ),
              ),
            ],
          ),
          // Main content area
          Expanded(
            child: Container(
              // Hapus borderRadius agar menempel ke header
              color: const Color(0xFFF0F5FA), // biru muda mendekati putih
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pelanggaran title
                    const Text(
                      'Pelanggaran',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Customer list
                    Expanded(
                      child: ListView.builder(
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          final customer = customers[index];
                          final type = customer['type'] ?? '';
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Icon di sebelah kiri
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: getViolationColor(type),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    getViolationIcon(type),
                                    color: Colors.black54,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Teks di sebelah kanan icon
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        customer['status'] ?? '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        customer['date'] ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        customer['description'] ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: const Color(0xFF003366),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 ? Colors.white.withOpacity(0.2) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper untuk membuat efek gelombang
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    
    // Mulai dari kiri atas
    path.lineTo(0, 0);
    
    // Buat gelombang yang melengkung ke bawah seperti di gambar
    var firstControlPoint = Offset(size.width * 0.1, size.height * 1.5);
    var firstEndPoint = Offset(size.width * 0.7, size.height * 1);
    path.quadraticBezierTo(
      firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy
    );
    

    
    // Tutup path
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}