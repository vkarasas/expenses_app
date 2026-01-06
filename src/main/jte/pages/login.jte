@param org.springframework.security.web.csrf.CsrfToken csrf

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

                </form>
            </div>
        </div>
    </div>
`)
