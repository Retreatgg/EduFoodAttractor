<#import "../layout.ftlh" as main>
<@main.layout>
    <section class="login_section position-relative mt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="login_form-box">
                        <div class="login_form-container">
                            <h2>Login to Your Account</h2>
                            <form action="/auth/login" method="POST" class="login_form">
                                <div class="form-group mt-2">
                                    <input type="email" class="form-control" name="username" placeholder="Email Address" required>
                                </div>
                                <div class="form-group mt-2">
                                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                                </div>
                                <div class="form-group mt-2">
                                    <button type="submit" class="btn custom_dark-btn btn-block">Login</button>
                                </div>
                            </form>
                            <div class="text-center">
                                <p>Don't have an account? <a href="/auth/register">Register Here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@main.layout>