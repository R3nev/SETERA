<?php
// update_profile.php - API endpoint for updating user profile

require_once 'config.php';

// Handle preflight requests for CORS
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');
    http_response_code(200);
    exit;
}

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    send_json_response(false, 'Only POST method is allowed');
}

// Get JSON input
$input = file_get_contents('php://input');
$data = json_decode($input, true);

// Validate input data
if (!$data) {
    send_json_response(false, 'Invalid JSON data');
}

// Required fields
$required_fields = ['user_id', 'nama', 'kelas', 'absen', 'password'];
foreach ($required_fields as $field) {
    if (!isset($data[$field]) || empty(trim($data[$field]))) {
        send_json_response(false, "Field '$field' is required");
    }
}

// Sanitize input data
$user_id = sanitize_input($data['user_id']);
$nama = sanitize_input($data['nama']);
$kelas = sanitize_input($data['kelas']);
$absen = sanitize_input($data['absen']);
$password = sanitize_input($data['password']);

// Validate absen number
if (!is_numeric($absen) || $absen < 1 || $absen > 50) {
    send_json_response(false, 'Absen must be a number between 1 and 50');
}

// Hash password for security
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

try {
    // Check if user exists
    $check_sql = "SELECT id FROM users WHERE user_id = ?";
    $check_stmt = $conn->prepare($check_sql);
    $check_stmt->bind_param("s", $user_id);
    $check_stmt->execute();
    $result = $check_stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Update existing user
        $update_sql = "UPDATE users SET nama = ?, kelas = ?, absen = ?, password = ?, updated_at = CURRENT_TIMESTAMP WHERE user_id = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("sssss", $nama, $kelas, $absen, $hashed_password, $user_id);
        
        if ($update_stmt->execute()) {
            // Get updated user data
            $select_sql = "SELECT user_id, nama, kelas, absen, updated_at FROM users WHERE user_id = ?";
            $select_stmt = $conn->prepare($select_sql);
            $select_stmt->bind_param("s", $user_id);
            $select_stmt->execute();
            $user_result = $select_stmt->get_result();
            $user_data = $user_result->fetch_assoc();
            
            send_json_response(true, 'Profile updated successfully', $user_data);
        } else {
            send_json_response(false, 'Failed to update profile: ' . $conn->error);
        }
    } else {
        // Insert new user
        $insert_sql = "INSERT INTO users (user_id, nama, kelas, absen, password) VALUES (?, ?, ?, ?, ?)";
        $insert_stmt = $conn->prepare($insert_sql);
        $insert_stmt->bind_param("sssss", $user_id, $nama, $kelas, $absen, $hashed_password);
        
        if ($insert_stmt->execute()) {
            // Get inserted user data
            $select_sql = "SELECT user_id, nama, kelas, absen, created_at FROM users WHERE user_id = ?";
            $select_stmt = $conn->prepare($select_sql);
            $select_stmt->bind_param("s", $user_id);
            $select_stmt->execute();
            $user_result = $select_stmt->get_result();
            $user_data = $user_result->fetch_assoc();
            
            send_json_response(true, 'Profile created successfully', $user_data);
        } else {
            send_json_response(false, 'Failed to create profile: ' . $conn->error);
        }
    }
    
} catch (Exception $e) {
    send_json_response(false, 'Database error: ' . $e->getMessage());
}


$conn->close();
?>