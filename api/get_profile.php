<?php
// get_profile.php - API endpoint for getting user profile

require_once 'config.php';

// Handle preflight requests for CORS
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Authorization');
    http_response_code(200);
    exit;
}

// Accept both GET and POST requests
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $user_id = isset($_GET['user_id']) ? sanitize_input($_GET['user_id']) : '';
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);
    $user_id = isset($data['user_id']) ? sanitize_input($data['user_id']) : '';
} else {
    send_json_response(false, 'Only GET or POST method is allowed');
}

// Validate user_id
if (empty($user_id)) {
    send_json_response(false, 'User ID is required');
}

try {
    // Get user profile
    $sql = "SELECT user_id, nama, kelas, absen, created_at, updated_at FROM users WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $user_data = $result->fetch_assoc();
        send_json_response(true, 'Profile retrieved successfully', $user_data);
    } else {
        send_json_response(false, 'User not found');
    }
    
} catch (Exception $e) {
    send_json_response(false, 'Database error: ' . $e->getMessage());
}

$conn->close();
?>