<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body id="default_theme" class="it_service">

<section class="mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card shadow-lg">
                    <!-- Header -->
                    <div class="card-header text-center text-white bg-primary fs-4">
                        <i class="fas fa-user-plus me-2"></i>Login
                    </div>

                    <!-- Alert Messages -->
                    <div class="card-body">
                        <div th:if="${param.error}" class="alert alert-danger text-center" role="alert">
                            [[${session.SPRING_SECURITY_LAST_EXCEPTION.message}]]
                        </div>
                        <div th:if="${param.logout}" class="alert alert-success text-center" role="alert">
                            Logout successfully
                        </div>

                        <a href="/oauth2/authorization/facebook" class="btn btn-primary w-100">
                            <i class="fab fa-facebook"></i> Login with Facebook
                        </a>
                        <!-- Login Form -->
                        <form action="/signin" method="post">
                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Enter Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" id="username" name="username" class="form-control"
                                           placeholder="Enter your email" required>
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Enter Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" id="password" name="password" class="form-control"
                                           placeholder="Enter your password" required>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-paper-plane"></i> Login
                                </button>
                            </div>
                        </form>

                        <!-- Forgot Password Link -->
                        <div class="text-center mt-3">
                            <a href="/forgotPassword" class="text-decoration-none fs-5">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
