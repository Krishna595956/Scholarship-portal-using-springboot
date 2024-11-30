<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: #fff;
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .dashboard-container {
            background: rgba(255, 255, 255, 0.9);
            color: #343a40;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 90%;
            max-width: 600px;
        }
        .dashboard-container h1 {
            font-size: 2.5rem;
            margin-bottom: 30px;
            color: #1e3c72;
        }
        .btn-custom {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            font-size: 1.2rem;
            border-radius: 10px;
            transition: transform 0.3s, background-color 0.3s;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
        .btn-secondary:hover {
            background-color: #495057;
            transform: translateY(-3px);
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-3px);
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Admin Dashboard</h1>
        <a href="/scholarships/add" class="btn btn-primary btn-custom">Add New Scholarship</a>
        <a href="/scholarships/all" class="btn btn-secondary btn-custom">View All Scholarships</a>
        <a href="/admin/applications" class="btn btn-success btn-custom">View All Applications</a>
        <a href="/logout" class="btn btn-danger btn-custom">Logout</a>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
