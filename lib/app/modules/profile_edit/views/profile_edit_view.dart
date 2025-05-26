import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  final Map<String, dynamic> initialProfile;

  const ProfileEditScreen({
    Key? key,
    required this.initialProfile,
  }) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditScreen> {
  late TextEditingController namaController;
  late TextEditingController kelasController;
  late TextEditingController passwordController;
  String selectedAbsen = '27';
  bool hasChanges = false;
  bool isSaved = false;

  // Store initial values for comparison
  late String initialNama;
  late String initialKelas;
  late String initialPassword;
  late String initialAbsen;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with current values
    initialNama = widget.initialProfile['nama'] ?? 'Sylus';
    initialKelas = widget.initialProfile['kelas'] ?? 'XII IPS A';
    initialPassword = widget.initialProfile['password'] ?? 'Admin123';
    initialAbsen = widget.initialProfile['absen'] ?? '27';

    namaController = TextEditingController(text: initialNama);
    kelasController = TextEditingController(text: initialKelas);
    passwordController = TextEditingController(text: initialPassword);
    selectedAbsen = initialAbsen;

    // Add listeners to detect changes
    namaController.addListener(_checkForChanges);
    kelasController.addListener(_checkForChanges);
    passwordController.addListener(_checkForChanges);
  }

  void _checkForChanges() {
    setState(() {
      hasChanges = namaController.text != initialNama ||
          kelasController.text != initialKelas ||
          passwordController.text != initialPassword ||
          selectedAbsen != initialAbsen;
    });
  }

  Future<bool> _onWillPop() async {
    if (hasChanges && !isSaved) {
      return await _showDiscardDialog();
    }
    return true;
  }

  Future<bool> _showDiscardDialog() async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Buang Perubahan?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Anda memiliki perubahan yang belum disimpan. Apakah Anda yakin ingin membuangnya?',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Don't discard
              },
              child: Text(
                'Tidak',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Discard changes
                Navigator.pushReplacementNamed(context, '/profile'); // Navigate to profile page
              },
              child: Text(
                'Iya',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    ) ?? false;
  }

  void _saveProfile() {
    // Create updated profile data
    Map<String, dynamic> updatedProfile = {
      'nama': namaController.text,
      'kelas': kelasController.text,
      'password': passwordController.text,
      'absen': selectedAbsen,
    };

    setState(() {
      isSaved = true;
      hasChanges = false;
    });

    // Return to profile page with updated data
    Navigator.of(context).pop(updatedProfile);
  }

  @override
  void dispose() {
    namaController.dispose();
    kelasController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () async {
              if (await _onWillPop()) {
                Navigator.of(context).pop();
              }
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: TextButton(
                onPressed: hasChanges ? _saveProfile : null,
                style: TextButton.styleFrom(
                  backgroundColor: hasChanges 
                      ? Colors.white.withOpacity(0.9) 
                      : Colors.white.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0XFF022F56),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Column(
              children: [
                // Top solid color section
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: Color(0xFF022F56), // Solid color
                  ),
                ),
                // Bottom white section
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 80, left: 24, right: 24, bottom: 24),
                        child: Column(
                          children: [
                            _buildTextField('Nama', namaController),
                            SizedBox(height: 16),
                            _buildTextField('Kelas', kelasController),
                            SizedBox(height: 16),
                            _buildAbsenDropdown(),
                            SizedBox(height: 16),
                            _buildTextField('Password', passwordController, isPassword: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Profile picture positioned to overlap both sections
            Positioned(
              top: 180,
              left: MediaQuery.of(context).size.width / 2 - 60,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/husband.jpg'),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: (value) => _checkForChanges(),
      ),
    );
  }

  Widget _buildAbsenDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: DropdownButtonFormField<String>(
        value: selectedAbsen,
        decoration: InputDecoration(
          labelText: 'Absen',
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items: List.generate(35, (index) => (index + 1).toString())
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedAbsen = newValue!;
            _checkForChanges();
          });
        },
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
      ),
    );
  }
}