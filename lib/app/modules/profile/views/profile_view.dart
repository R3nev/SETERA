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
                          'IX A',
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
      
      // Bottom Navigation Bar - Updated to match home screen style
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF2E5C8A),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home_outlined, 0),
            _buildNavItem(Icons.description_outlined, 1),
            _buildNavItem(Icons.person, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/poin_plus'); 
        } else if (index == 2) {
          setState(() {
            _selectedIndex = 2;
          });
        }
      },
      child: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: isSelected && index == 2 ? 30 : 24, // Profile icon lebih besar saat aktif
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
          Navigator.pushNamed(context, '/profile_edit');
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