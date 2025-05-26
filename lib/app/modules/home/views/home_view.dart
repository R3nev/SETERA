import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Halaman Hak dan Kewajiban Siswa
class HakDanKewajibanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4A90E2),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Hak dan Kewajiban Siswa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Hak Siswa',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            _buildHakKewajibanItem('1. Mendapatkan pendidikan yang layak.'),
            _buildHakKewajibanItem('2. Mendapatkan perlindungan dari kekerasan.'),
            _buildHakKewajibanItem('3. Mendapatkan akses informasi yang benar.'),
            _buildHakKewajibanItem('4. Mengemukakan pendapat.'),
            SizedBox(height: 20),
            Text(
              'Kewajiban Siswa',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            _buildHakKewajibanItem('1. Menghormati guru dan teman.'),
            _buildHakKewajibanItem('2. Mengikuti pelajaran dengan baik.'),
            _buildHakKewajibanItem('3. Menjaga kebersihan lingkungan sekolah.'),
            _buildHakKewajibanItem('4. Mematuhi peraturan sekolah.'),
          ],
        ),
      ),
    );
  }

  Widget _buildHakKewajibanItem(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.blue.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.blue, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheSylus App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/hak-kewajiban': (context) => HakDanKewajibanPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotificationItem {
  final String title;
  final String date;
  final String description;
  final int? pointChange;

  NotificationItem({
    required this.title,
    required this.date,
    required this.description,
    this.pointChange,
  });
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  List<NotificationItem> notifications = [
    NotificationItem(
      title: "Terlambatan",
      date: "12 Januari 2023",
      description: "Dengan dari: Zayne, S.I.Ks",
      pointChange: -2,
    ),
  ];

  void _showNotificationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(
                Icons.notifications,
                color: Color(0xFF4A90E2),
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Notifikasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A90E2),
                ),
              ),
            ],
          ),
          content: Container(
            width: double.maxFinite,
            height: 200,
            child: notifications.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 48,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Tidak ada notifikasi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 8),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      notification.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  if (notification.pointChange != null)
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: notification.pointChange! > 0 
                                            ? Colors.green.withOpacity(0.1)
                                            : Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notification.pointChange! > 0 
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                      child: Text(
                                        '${notification.pointChange! > 0 ? '+' : ''}${notification.pointChange}',
                                        style: TextStyle(
                                          color: notification.pointChange! > 0 
                                              ? Colors.green
                                              : Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                notification.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                notification.date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Color(0xFF4A90E2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLaranganSiswaDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Larangan Siswa'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('1. Dilarang merokok di area sekolah.'),
                Text('2. Dilarang membawa barang berbahaya.'),
                Text('3. Dilarang berkelahi atau melakukan kekerasan.'),
                Text('4. Dilarang merusak fasilitas sekolah.'),
                Text('5. Dilarang membawa telepon genggam saat jam pelajaran.'),
                Text('6. Dilarang keluar sekolah tanpa izin.'),
                Text('7. Dilarang mencontek saat ujian.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAturanBerseragamDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Aturan Berseragam'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Senin - Selasa: Seragam Putih Abu-abu'),
                Text('Rabu - Kamis: Seragam Pramuka'),
                Text('Jumat: Seragam Batik'),
                Text('Sabtu: Seragam Olahraga'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showKlasifikasiPoinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Klasifikasi Poin Pelanggaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              child: Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                children: [
                  // Header row
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Pelanggaran',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Poin',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Data rows
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Datang terlambat tanpa alasan yang jelas',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            '5',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Tidak memakai seragam sesuai ketentuan',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            '5',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Blue header section
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF4A90E2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // Header with notification
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: _showNotificationPopup,
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 16,
                                    minHeight: 16,
                                  ),
                                  child: Text(
                                    '${notifications.length}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Profile section
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/husband.jpg'),
                            backgroundColor: Colors.white.withOpacity(0.3),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi,',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Qin Sylus Chen',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            
            // Points card overlapping the blue section
            Transform.translate(
              offset: Offset(0, -20),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Pointmu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '109',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Poin Positif',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '5',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Pelanggaran',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        color: Color(0xFF4A90E2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Total Point: 104',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Menu section
            Container(
              margin: EdgeInsets.fromLTRB(25, 30, 25, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu Utama',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.1,
                    children: [
                      _buildMenuCard(
                        'Larangan Siswa',
                        Icons.block,
                        [Color(0XFF022F56), Color(0XFF022F56)],
                        _showLaranganSiswaDialog,
                      ),
                      _buildMenuCard(
                        'Aturan Berseragam',
                        Icons.school,
                        [Color(0XFF488DB4), Color(0XFF488DB4)],
                        _showAturanBerseragamDialog,
                      ),
                      _buildMenuCard(
                        'Klasifikasi Poin Pelanggaran',
                        Icons.assignment,
                        [Color(0XFF488DB4), Color(0XFF488DB4)],
                        _showKlasifikasiPoinDialog,
                      ),
                      // You can add more menu items here if needed
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Bottom Navigation Bar
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
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.description_outlined, 1),
            _buildNavItem(Icons.person_outline, 2),
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
          // Tetap di halaman Home
          setState(() {
            _selectedIndex = 0;
          });
        } else if (index == 1) {
          // Navigasi ke halaman poin_plus
          Navigator.pushNamed(context, '/poin_plus');
        } else if (index == 2) {
          // Navigasi ke halaman profile
          Navigator.pushNamed(context, '/profile');
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
          size: isSelected && index == 0 ? 30 : 24, // Home icon lebih besar saat aktif
          // Untuk efek bold, gunakan icon filled jika ingin lebih tebal (misal: Icons.home_rounded)
        ),
      ),
    );
  }
  
  Widget _buildMenuCard(String title, IconData icon, List<Color> gradientColors, Function onTap) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => onTap(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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