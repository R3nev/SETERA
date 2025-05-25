<?php
// error.php - Centralized error handling for API

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

$error_code = http_response_code();
$error_message = '';

switch ($error_code) {
    case 404:
        $error_message = 'API endpoint not found';
        break;
    case 500:
        $error_message = 'Internal server error';
        break;
    case 403:
        $error_message = 'Access forbidden';
        break;
    case 401:
        $error_message = 'Unauthorized access';
        break;
    default:
        $error_message = 'An error occurred';
        break;
}

$response = array(
    'success' => false,
    'message' => $error_message,
    'error_code' => $error_code
);

echo json_encode($response);
?>