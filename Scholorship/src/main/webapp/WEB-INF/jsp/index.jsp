<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Scholarship Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .content {
            background: rgba(255, 255, 255, 0.9);
            color: #333;
            border-radius: 20px;
            padding: 50px;
            max-width: 90%;
            width: 1200px;
            text-align: center;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
        }
        h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .lead {
            font-size: 1.5rem;
            margin-bottom: 40px;
        }
        .feature {
            background-color: #f8f9fa;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .feature:hover {
            transform: translateY(-5px);
        }
        .feature h4 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: #6a11cb;
        }
        .btn-custom {
            background-color: #2575fc;
            color: #fff;
            padding: 15px 40px;
            font-size: 20px;
            border-radius: 50px;
            margin: 10px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #6a11cb;
        }
        .row {
            margin-top: 30px;
        }
        @media (max-width: 768px) {
            .feature {
                margin-bottom: 20px;
            }
            h1 {
                font-size: 2.5rem;
            }
            .lead {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h1>Welcome to the Scholarship Portal</h1>
        <p class="lead">Explore a wide range of scholarships to support your educational dreams. Start your journey today!</p>

        <div class="row">
            <div class="col-md-4">
                <div class="feature">
                    <h4>Personalized Matches</h4>
                    <p>Get scholarships tailored to your academic performance, goals, and financial needs.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature">
                    <h4>Search with Ease</h4>
                    <p>Find scholarships quickly with category, eligibility, and deadline filters.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature">
                    <h4>Application Tracking</h4>
                    <p>Monitor your scholarship applications in real-time from submission to result.</p>
                </div>
            </div>
        </div>

        <div class="mt-4">
            <a href="/login" class="btn btn-custom">Login</a>
            <a href="/signup" class="btn btn-custom">Sign Up</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
