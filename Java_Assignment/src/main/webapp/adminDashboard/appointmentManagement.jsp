<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8" />
    <!--<title> Drop Down Sidebar Menu | CodingLab </title>-->
    <!-- <link rel="stylesheet" href="style.css" /> -->
    <!-- Boxiocns CDN Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <style>
        :root {
            --colour-sp: #F6323E;
            --colour-abe: #993300;
            --colour-sb: #FF661B;
            --colour-cls: #D31145;
            --colour-soc: #5B7F95;
            --colour-eee: #22BCB9;
            --colour-mad: #BEBE4D;
            --colour-mae: #0096D7;
            --colour-sma: #0075C2;

            --font-base: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            --font-heading: 'Poppins', var(--font-base);
            --font-body: 'Gantari', var(--font-base);
        }

        .settingsDivSection {
            width: 100%;
            flex-shrink: 0;
            border-radius: 1.25rem;
            background: #E9E9E9;
            box-shadow: 0 0 10.4px 4px rgba(0, 0, 0, 0.25);
            padding: 3%;
            margin-top: 4%;
        }

        /* Google Fonts Import Link */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 260px;
            background: #1a1a1a;
            z-index: 100;
            transition: all 0.5s ease;
        }

        .sidebar.close {
            width: 78px;
        }

        .sidebar .logo-details {
            height: 60px;
            width: 100%;
            display: flex;
            align-items: center;
        }

        .sidebar .logo-details i {
            font-size: 30px;
            color: #fff;
            height: 50px;
            min-width: 78px;
            text-align: center;
            line-height: 50px;
        }

        .sidebar .logo-details .logo_name {
            font-size: 22px;
            color: #fff;
            font-weight: 600;
            transition: 0.3s ease;
            transition-delay: 0.1s;
        }

        .sidebar.close .logo-details .logo_name {
            transition-delay: 0s;
            opacity: 0;
            pointer-events: none;
        }

        .sidebar .nav-links {
            height: 100%;
            padding: 30px 0 150px 0;
            overflow: auto;
        }

        .sidebar.close .nav-links {
            overflow: visible;
        }

        .sidebar .nav-links::-webkit-scrollbar {
            display: none;
        }

        .sidebar .nav-links li {
            position: relative;
            list-style: none;
            transition: all 0.4s ease;
        }

        .sidebar .nav-links li:hover {
            background: #4f4f4f;
        }

        .sidebar .nav-links li .iocn-link {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .sidebar.close .nav-links li .iocn-link {
            display: block;
        }

        .sidebar .nav-links li i {
            height: 50px;
            min-width: 78px;
            text-align: center;
            line-height: 50px;
            color: #fff;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .sidebar .nav-links li.showMenu i.arrow {
            transform: rotate(-180deg);
        }

        .sidebar.close .nav-links i.arrow {
            display: none;
        }

        .sidebar .nav-links li a {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .sidebar .nav-links li a .link_name {
            font-size: 18px;
            font-weight: 400;
            color: #fff;
            transition: all 0.4s ease;
        }

        .sidebar.close .nav-links li a .link_name {
            opacity: 0;
            pointer-events: none;
        }

        .sidebar .nav-links li .sub-menu {
            padding: 6px 6px 14px 80px;
            margin-top: -10px;
            background: #1d1b31;
            display: none;
        }

        .sidebar .nav-links li.showMenu .sub-menu {
            display: block;
        }

        .sidebar .nav-links li .sub-menu a {
            color: #fff;
            font-size: 15px;
            padding: 5px 0;
            white-space: nowrap;
            opacity: 0.6;
            transition: all 0.3s ease;
        }

        .sidebar .nav-links li .sub-menu a:hover {
            opacity: 1;
        }

        .sidebar.close .nav-links li .sub-menu {
            position: absolute;
            left: 100%;
            top: -10px;
            margin-top: 0;
            padding: 10px 20px;
            border-radius: 0 6px 6px 0;
            opacity: 0;
            display: block;
            pointer-events: none;
            transition: 0s;
        }

        .sidebar.close .nav-links li:hover .sub-menu {
            top: 0;
            opacity: 1;
            pointer-events: auto;
            transition: all 0.4s ease;
        }

        .sidebar .nav-links li .sub-menu .link_name {
            display: none;
        }

        .sidebar.close .nav-links li .sub-menu .link_name {
            font-size: 18px;
            opacity: 1;
            display: block;
        }

        .sidebar .nav-links li .sub-menu.blank {
            opacity: 1;
            pointer-events: auto;
            padding: 3px 20px 6px 16px;
            opacity: 0;
            pointer-events: none;
        }

        .sidebar .nav-links li:hover .sub-menu.blank {
            top: 50%;
            transform: translateY(-50%);
        }

        .sidebar .profile-details {
            position: fixed;
            bottom: 0;
            width: 260px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #3d3d3e;
            padding: 12px 0;
            transition: all 0.5s ease;
        }

        .sidebar.close .profile-details {
            background: none;
        }

        .sidebar.close .profile-details {
            width: 78px;
        }

        .sidebar .profile-details .profile-content {
            display: flex;
            align-items: center;
        }

        .sidebar .profile-details img {
            height: 52px;
            width: 52px;
            object-fit: cover;
            border-radius: 16px;
            margin: 0 14px 0 12px;
            background: #3d3d3e;
            transition: all 0.5s ease;
        }

        .sidebar.close .profile-details img {
            padding: 10px;
        }

        .sidebar .profile-details .profile_name,
        .sidebar .profile-details .job {
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            white-space: nowrap;
        }

        .sidebar.close .profile-details i,
        .sidebar.close .profile-details .profile_name,
        .sidebar.close .profile-details .job {
            display: none;
        }

        .sidebar .profile-details .job {
            font-size: 12px;
        }

        .home-section {
            position: relative;
            background: #FFFFFF;
            height: 100vh;
            left: 260px;
            width: calc(100% - 260px);
            transition: all 0.5s ease;
        }

        .sidebar.close~.home-section {
            left: 78px;
            width: calc(100% - 78px);
        }

        .home-section .home-content {
            height: 60px;
            display: flex;
            align-items: center;
        }

        .home-section .home-content .bx-menu,
        .home-section .home-content .text {
            color: #11101d;
            font-size: 35px;
        }

        .home-section .home-content .bx-menu {
            margin: 0 15px;
            cursor: pointer;
        }

        .bx-menu {
            position: fixed;
        }

        .custom-icon {
            vertical-align: middle !important;
            /* margin-bottom: -5px; */


        }

        .home-section .home-content .text {
            font-size: 26px;
            font-weight: 600;
        }

        @media (max-width: 420px) {
            .sidebar.close .nav-links li .sub-menu {
                display: none;
            }
        }

        .inputDivForSettings {
            display: flex;
            justify-content: space-between;
            padding: 1.5%;
        }

        .form-control {
            border-radius: 0.375rem;
            border: 1px solid rgba(0, 0, 0, 0.23);
            background: #FFF;
            padding: 0.5rem;
            width: 100%;
            /* max-width: 220px; */
            height: 45px;
            padding: 12px;
            border-radius: 12px;
            outline: none;
            transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
            box-shadow: 0px 0px 20px -18px;
        }

        .form-control:hover {
            border: 2px solid lightgrey;
            box-shadow: 0px 0px 20px -17px;
        }

        .form-control:active {
            transform: scale(0.95);
        }

        .form-control:focus {
            border: 2px solid grey;
        }

        .divForInputs {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .footerForSettingsDiv {
            display: flex;
            justify-content: flex-end;
            gap: 3%;
            margin-top: 3%;
            margin-right: 5.5%;
        }

        /* From Uiverse.io by e-coders */
        .formButton {
            appearance: none;
            background-color: transparent;
            border-radius: 0.9375em;
            box-sizing: border-box;
            /* color: #3B3B3B; */
            cursor: pointer;
            display: inline-block;
            font-family: Roobert, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            font-size: 16px;
            font-weight: 600;
            line-height: normal;
            margin: 0;
            min-height: 3.75em;
            min-width: 0;
            outline: none;
            padding: 1em 2.3em;
            text-align: center;
            text-decoration: none;
            transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            will-change: transform;
        }

        .formButton:disabled {
            pointer-events: none;
        }

        .formButton:hover {
            box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
            transform: translateY(-2px);
        }

        .formButton:active {
            box-shadow: none;
            transform: translateY(0);
        }

        #resetChanges {
            border-radius: 0.875rem;
            background: #A1A1A1;
        }

        #resetChanges:hover {
            background: #757575;
            color: #FFF;
        }

        #saveChanges {
            border-radius: 0.875rem;
            background: #ED6565;
        }

        #saveChanges:hover {
            background: #ba4f4f;
            color: #FFF;
        }

        .activePage {
            background: var(--colour-sp);
        }
    </style>
</head>

<body>
    <div class="sidebar close">
        <ul class="nav-links">
            <li>
                <a href="#">
                    <i class='bx  bx-arrow-left-stroke'><svg xmlns="http://www.w3.org/2000/svg" fill="white" width="24"
                            height="24"><!--Boxicons v3.0 https://boxicons.com | License  https://docs.boxicons.com/free-->
                            <path d="M11.79 6.29 6.09 12l5.7 5.71 1.42-1.42L9.91 13H18v-2H9.91l3.3-3.29z" />
                        </svg></i>
                    <span class="link_name">Back</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="../landingPage/homepage.html">Back</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx  bx-user'></i>
                    <span class="link_name">Manage Users</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Manage Users</a></li>
                </ul>
            </li>
            <li>
                <a href="#" style="background-color: #557788;">
                    <i class='bx'><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            fill="white"><!--Boxicons v3.0 https://boxicons.com | License  https://docs.boxicons.com/free-->
                            <path
                                d="M19 4h-2V2h-2v2H9V2H7v2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2M5 20V8h14V6v14z" />
                            <path
                                d="M7 11h2v2H7zM11 11h2v2h-2zM15 11h2v2h-2zM7 15h2v2H7zM11 15h2v2h-2zM15 15h2v2h-2z" />
                        </svg></i>
                    <span class="link_name">Manage Appointments</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Manage Appointments</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx  bx-clipboard-detail'><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            fill="white"><!--Boxicons v3.0 https://boxicons.com | License  https://docs.boxicons.com/free-->
                            <path d="M7 10h10v2H7zm0 4h7v2H7z" />
                            <path
                                d="M19 3h-2c0-.55-.45-1-1-1H8c-.55 0-1 .45-1 1H5c-1.1 0-2 .9-2 2v15c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2m0 17H5V5h2v2h10V5h2z" />
                        </svg></i>
                    <span class="link_name">Manage Services</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="#">Manage Services</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <section class="home-section">
        <div class="home-content" style="flex-direction: column; align-items: baseline; margin-top: 12px;">
            <i class="bx bx-menu"></i>

            <div style=" width: 95%;" class="p-3 m-5" id="divForTheMainScreen">
                <h1>Appointments</h1>
                <hr>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Date</th>
                            <th scope="col">Customer's name</th>
                            <th scope="col">Service</th>
                            <th scope="col">Message</th>
                            <th scope="col">Number</th>
                            <th scope="col">Staff IC</th>
                            <th scope="col"><i></i></th>
                            <th scope="col"><i></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>29/10/25</td>
                            <td>Otto</td>
                            <td>Spring Cleaning</td>
                            <td>Nil</td>
                            <td>91234567</td>
                            <td>Bonsata</td>
                            <td><i class="bx bx-edit"></i></td>
                            <td><i class="bx bx-trash"></i></td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>John</td>
                            <td>Doe</td>
                            <td>@social</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </section>
    <script src="https://unpkg.com/boxicons@2.1.3/dist/boxicons.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>

    <script>
        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
            arrow[i].addEventListener("click", (e) => {
                let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
                arrowParent.classList.toggle("showMenu");
            });
        }
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".bx-menu");
        console.log(sidebarBtn);
        sidebarBtn.addEventListener("click", () => {
            sidebar.classList.toggle("close");
        });
    </script>
</body>

</html>