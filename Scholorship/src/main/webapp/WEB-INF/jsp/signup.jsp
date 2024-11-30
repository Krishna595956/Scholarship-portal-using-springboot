<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Signup</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container button {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="form-container" style="margin-top: 400px;" >
        <h1>Student Signup</h1>
        <form action="/signup" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="academicDetails" class="form-label">Academic Details:</label>
                <textarea id="academicDetails" name="academicDetails" class="form-control" rows="4"></textarea>
            </div>

            <div class="mb-3">
                <label for="careerGoals" class="form-label">Career Goals:</label>
                <textarea id="careerGoals" name="careerGoals" class="form-control" rows="4"></textarea>
            </div>
			
			<div class="mb-3">
			    <label for="eligibility" class="form-label">CGPA:</label>
			    <textarea id="eligibility" name="cgpa" class="form-control" required></textarea>
			</div>
			<div class="mb-3">
			    <label for="eligibility" class="form-label">Branch:</label>
				<input type="text" id="branch" name="branch" class="form-control" required>
			</div>

            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <p class="text-center mt-3">Already have an account? <a href="/login">Login</a></p>
    </div>

    <!-- Bootstrap JS (optional for interactivity) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
