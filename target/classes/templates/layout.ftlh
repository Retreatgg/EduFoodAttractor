<#macro layout>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>EduFood</title>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"/>
    <link href="../css/style.css" rel="stylesheet"/>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #000000;
            background-color: #ffffff;
        }

        .hero_area {
            height: 9vh;
            background-color: #f7f7f7;
        }

        .hero_area {
            height: auto;
        }

        .header_section {}

        .header_section {
            padding-right: 25px;
            padding-left: 25px;
        }

        .header_section {
            margin: 0 auto;
        }

        .custom_nav-container.navbar-expand-lg .navbar-nav .nav-link {
            padding: 10px 30px;
            color: #343434;
            text-align: center
        }

        a,
        a:hover,
        a:focus {
            text-decoration: none;
        }

        a:hover,
        a:focus {
            color: initial;
        }

        .btn,
        .btn:focus {
            outline: none !important;
            box-shadow: none;
        }



        .navbar-brand,
        .navbar-brand:hover {
            text-transform: uppercase;
            font-weight: bold;
            font-size: 24px;
            color: #fafcfd;
        }

        .custom_nav-container .nav_search-btn {
            background-size: 22px;
            background-repeat: no-repeat;
            background-position-y: 7px;
            width: 35px;
            height: 35px;
            padding: 0;
            border: none;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
        }

        .navbar-brand img {
            width: 45px;
            margin-right: 5px;
        }

        .navbar-brand span {
            font-size: 20px;
            font-weight: 700;
            color: #2e2e2d;
            margin-top: 5px;
        }

        .custom_nav-container {
            z-index: 99999;
            padding: 15px 0;
        }

        .custom_nav-container .navbar-toggler {
            outline: none;
        }

        .custom_nav-container .navbar-toggler .navbar-toggler-icon {
            background-size: 55px;
        }

        .quote_btn-container a {
            display: inline-block;
            padding: 5px 15px;
            background-color: #fc5d35;
            color: #f7f7f7;
            font-size: 14px;
            text-transform: uppercase;
        }
    </style>
</head>

<body>
<div class="hero_area">
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
                <a class="navbar-brand" href="/">
                    <img src="/images/default/logo.png" alt="logo"/><span>
              EduFood
            </span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div class="quote_btn-container ml-0 ml-lg-4 d-flex justify-content-center ms-auto">
                        <a href="/profile">
                            profile
                        </a>
                    </div>
                </div>

                <#if basket??>
                    <button type="button" class="quote_btn-container" data-toggle="modal" data-target="#cartModal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" fill="currentColor" class="bi bi-bag-check-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0m-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z"/>
                        </svg>
                    </button>
                </#if>


            </nav>
        </div>
    </header>
</div>

<#nested>
</body>
</html>
</#macro>