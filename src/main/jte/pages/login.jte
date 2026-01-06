@param org.springframework.security.web.csrf.CsrfToken csrf

@param String error
@param String logout

@template.layout.index(content = @`
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="card shadow-sm" style="width: 100%; max-width: 400px;">

            <div class="card-header bg-white text-center">
                <h5 class="mb-0">Login</h5>
            </div>

            <div class="card-body">
                <form method="post" action="/dashboard">
                    <!-- CSRF Token -->
                    <input type="hidden"
                           name="${csrf.getParameterName()}"
                           value="${csrf.getToken()}" />

                    <div class="form-group">
                        <div class="col-xs-15">
                            <div>
                                <!-- Check for login error -->
                                @if(error != null)
                                    <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                        Invalid username and password.
                                    </div>
                                @endif

                                <!-- Check for logout -->
                                @if(logout != null)
                                    <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                        You have been logged out.
                                    </div>
                                @endif

                            </div>
                        </div>
                    </div>

                    <!-- Username -->
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input
                                id="username"
                                type="text"
                                name="username"
                                class="form-control"
                                required
                                autofocus
                        />
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input
                                id="password"
                                type="password"
                                name="password"
                                class="form-control"
                                required
                        />
                    </div>

                    <!-- Submit -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            Login
                        </button>
                    </div>

                    <!-- OAuth2 Buttons -->
                    <div class="mt-4">
                        <div class="position-relative">
                            <hr class="my-4">
                            <div class="position-absolute top-50 start-50 translate-middle bg-white px-3">
                                <span class="text-muted small">Or continue with</span>
                            </div>
                        </div>
                        <div class="row g-3 mt-3">
                            <div class="col-6">
                                <a href="/oauth2/authorization/google"
                                   class="btn btn-outline-secondary w-100 d-flex align-items-center justify-content-center">
                                    <img class="me-2" style="height: 20px; width: 20px;"
                                         src="https://www.svgrepo.com/show/475656/google-color.svg"
                                         alt="Google logo">
                                    <span>Google</span>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/oauth2/authorization/github"
                                   class="btn btn-outline-secondary w-100 d-flex align-items-center justify-content-center">
                                    <svg class="me-2" style="height: 20px; width: 20px;" fill="currentColor" viewBox="0 0 24 24">
                                        <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.477 2 12c0 4.42 2.865 8.17 6.839 9.49.5.092.682-.217.682-.482 0-.237-.008-.866-.013-1.7-2.782.604-3.369-1.34-3.369-1.34-.454-1.156-1.11-1.464-1.11-1.464-.908-.62.069-.608.069-.608 1.003.07 1.531 1.03 1.531 1.03.892 1.529 2.341 1.087 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.029-2.683-.103-.253-.446-1.27.098-2.647 0 0 .84-.269 2.75 1.022A9.606 9.606 0 0112 6.82c.85.004 1.705.115 2.504.337 1.909-1.29 2.747-1.022 2.747-1.022.546 1.377.202 2.394.1 2.647.64.699 1.028 1.592 1.028 2.683 0 3.842-2.339 4.687-4.566 4.935.359.309.678.919.678 1.852 0 1.336-.012 2.415-.012 2.743 0 .267.18.578.688.48C19.137 20.167 22 16.42 22 12c0-5.523-4.477-10-10-10z" clip-rule="evenodd"></path>
                                    </svg>
                                    <span>GitHub</span>
                                </a>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
`)
