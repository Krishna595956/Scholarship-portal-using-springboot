<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit Profile</h1>
        <form action="/update-profile" method="post" class="border p-4 shadow-sm rounded">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${name}" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${email}" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" value="${password}" required>
            </div>
            <div class="mb-3">
                <label for="branch" class="form-label">Branch:</label>
                <input type="text" id="branch" name="branch" class="form-control" value="${branch}" required>
            </div>
            <div class="mb-3">
                <label for="cgpa" class="form-label">CGPA:</label>
                <input type="text" id="cgpa" name="cgpa" class="form-control" value="${cgpa}" required>
            </div>
            <div class="mb-3">
                <label for="academicDetails" class="form-label">Academic Details:</label>
                <textarea id="academicDetails" name="academicDetails" class="form-control" required>${academicDetails}</textarea>
            </div>
            <div class="mb-3">
                <label for="careerGoals" class="form-label">Career Goals:</label>
                <textarea id="careerGoals" name="careerGoals" class="form-control" required>${careerGoals}</textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Update Profile</button>
        </form>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
