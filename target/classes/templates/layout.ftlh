<#macro layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduFood</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                color: #000000;
                background-color: #ffffff;
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
            .navbar-toggler {
                outline: none;
            }
            .quote_btn-container a {
                display: inline-block;
                padding: 5px 15px;
                background-color: #fc5d35;
                color: #ffffff;
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
                        <img src="/images/default/logo.png" alt="logo"/>
                        <span>EduFood</span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <#if auth??>
                                <li class="nav-item">
                                    <a class="nav-link" href="/profile">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/logout">Logout</a>
                                </li>
                            <#else>
                                <li class="nav-item">
                                    <a class="nav-link" href="/auth/login">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/auth/register">Register</a>
                                </li>
                            </#if>
                        </ul>
                    </div>
                    <#if basket??>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cartModal">
                            Your Cart
                        </button>
                    </#if>
                </nav>
            </div>
        </header>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/js/bootstrap.min.js"></script>
    <#nested>
    </body>
    </html>
</#macro>
