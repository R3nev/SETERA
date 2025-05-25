import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 2; // Profile tab is selected

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/receipt');
    } else if (index == 2) {
      setState(() {
        _selectedIndex = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top blue section with profile info
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF5B9BD5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 40, 24, 40),
                child: Row(
                  children: [
                    // Profile picture
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, // pastikan bentuknya lingkaran
                      ),
                      clipBehavior: Clip.antiAlias, // agar gambar terpotong lingkaran
                      child: Image.asset(
                        'assets/images/husband.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    
                    // Profile info
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qin Sylus Che',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'XII IPS A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Menu items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  
                  // Profile menu item
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    iconColor: Colors.black87,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Poin Pelanggan menu item
                  _buildMenuItem(
                    icon: Icons.star,
                    title: 'Poin Pelanggan',
                    iconColor: Colors.orange,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Pengaturan menu item
                  _buildMenuItem(
                    icon: Icons.settings,
                    title: 'Pengaturan',
                    iconColor: Colors.black87,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Keluar menu item
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Keluar',
                    iconColor: Colors.red,
                  ),
                  
                  const Spacer(),
                ],
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
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle menu item tap
        if (title == 'Keluar') {
          Navigator.pushReplacementNamed(context, '/login');
        } else if (title == 'Profile') {
          Navigator.pushNamed(context, '/profile_edit'); // Pastikan route '/profile-edit' sudah ada
        } else {
          print('Tapped on $title');
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 37,
              color: iconColor,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              size: 28,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}