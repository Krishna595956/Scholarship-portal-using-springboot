<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">User Profile</h1>
        <div class="card shadow-sm p-4">
            <div class="row mb-3">
                <div class="col-md-4"><strong>Name:</strong></div>
                <div class="col-md-8">${name}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4"><strong>Email:</strong></div>
                <div class="col-md-8">${email}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4"><strong>Password:</strong></div>
                <div class="col-md-8">${password}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4"><strong>Branch:</strong></div>
                <div class="col-md-8">${branch}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4"><strong>CGPA:</strong></div>
                <div class="col-md-8">${cgpa}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4"><strong>Academic Details:</strong></div>
                <div class="col-md-8">${academicDetails}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4"><strong>Career Goals:</strong></div>
                <div class="col-md-8">${careerGoals}</div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="/edit-profile" class="btn btn-primary">Edit Profile</a>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
