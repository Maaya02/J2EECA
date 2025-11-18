<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silver Care</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <style>
        .mega-dropdown {
            position: static !important;
        }

        .mega-dropdown-menu {
            width: 600px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            border: none;
            display: none;
        }

        .mega-dropdown:hover .mega-dropdown-menu {
            display: block;
        }

        @media (min-width: 992px) {
            .mega-dropdown .dropdown-toggle::after {
                display: inline-block;
            }
        }

        .mega-dropdown-content {
            display: flex;
            gap: 30px;
        }

        .category-list {
            flex: 1;
            border-right: 1px solid #dee2e6;
            padding-right: 20px;
        }

        .category-item {
            padding: 12px 15px;
            margin-bottom: 5px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
            color: #555;
            text-decoration: none;
            display: block;
        }

        .category-item:hover,
        .category-item.active {
            background: #8fa9ba;
            color: white !important;
        }

        .services-list {
            flex: 1;
            padding-left: 10px;
        }

        .service-group {
            display: none;
        }

        .service-group.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateX(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .service-link {
            padding: 10px 0;
            color: #666;
            font-size: 15px;
            transition: all 0.3s;
            display: block;
            text-decoration: none;
        }

        .service-link:hover {
            color: #8fa9ba;
            padding-left: 5px;
        }

        .service-category-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .navbar-brand {
            font-weight: 700;
            color: #333 !important;
        }

        .btn-info {
            background: #5a9fd4;
            border: none;
            border-radius: 25px;
            padding: 8px 25px;
            font-weight: 500;
        }

        .btn-info:hover {
            background: #4a8fc4;
        }

       .nav-link {
            font-weight: 500;
            color: #757575 !important;
        }

        .nav-link:hover {
            color: #8fa9ba !important;
        }

        #homeScreenAnchorTag {
            color: #000000 !important;
        }

        #homeScreenAnchorTag:hover {
            color: #8fa9ba !important;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">🏠 SilverCare</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#" id="homeScreenAnchorTag">Home</a>
                    </li>

                    <li class="nav-item dropdown mega-dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button"
                            aria-expanded="false">
                            Services
                        </a>
                        <div class="dropdown-menu mega-dropdown-menu">
                            <div class="mega-dropdown-content">
                                <div class="category-list">
                                    <div class="category-item active" data-category="cleaning">
                                        Cleaning
                                    </div>
                                    <div class="category-item" data-category="caregiving">
                                        Caregiving
                                    </div>
                                    <div class="category-item" data-category="smart-help">
                                        Smart Help
                                    </div>
                                </div>
                                <div class="services-list">
                                    <div class="service-group active" id="cleaning">
                                        <a href="#" class="service-link">Home Cleaning</a>
                                        <a href="#" class="service-link">Spring Cleaning</a>
                                        <a href="#" class="service-link">Move In/Out Cleaning</a>
                                    </div>
                                    <div class="service-group" id="caregiving">
                                        <h6 class="service-category-title">Domestic</h6>
                                        <a href="#" class="service-link">Senior Day Care</a>
                                        <a href="#" class="service-link">Live-in Caregivers</a>
                                        <a href="#" class="service-link">Short-time Caregivers</a>
                                        <a href="#" class="service-link">Meals On Wheels</a>
                                        
                                        <h6 class="service-category-title mt-3">Medical</h6>
                                        <a href="#" class="service-link">speech therapy</a>
                                                                                <a href="#" class="service-link"> phsyio</a>
                                        
                                                                                <a href="#" class="service-link">counselling</a>
                                    
                                                                                <a href="#" class="service-link"> priv nurs’
</a>
                                        
                                    </div>
                                    <div class="service-group" id="smart-help">
                                        <a href="#" class="service-link">Bill and Form Assistance</a>
                                        <a href="#" class="service-link">Scam Awareness</a>
                                        <a href="#" class="service-link">App & Device Help</a>
                                        <a href="#" class="service-link">Repair Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#aboutus">About Us</a>
                    </li>
                </ul>
                <form class="d-flex ms-auto" action="bookingOfServices.jsp">
                    <button class="btn btn-info" type="submit">Book Services</button>
                </form>
            </div>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const categoryItems = document.querySelectorAll('.category-item');
            const serviceGroups = document.querySelectorAll('.service-group');

            categoryItems.forEach(item => {
                item.addEventListener('mouseenter', function() {
                    // Remove active class from all categories
                    categoryItems.forEach(cat => cat.classList.remove('active'));
                    
                    // Add active class to hovered category
                    this.classList.add('active');
                    
                    // Hide all service groups
                    serviceGroups.forEach(group => group.classList.remove('active'));
                    
                    // Show corresponding service group
                    const categoryName = this.getAttribute('data-category');
                    document.getElementById(categoryName).classList.add('active');
                });
            });
        });
    </script>

</body>

</html>