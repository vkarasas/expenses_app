@param String username
@param java.math.BigDecimal previousMonthTotalAmount
@param java.math.BigDecimal currentMonthTotalAmount
@param java.math.BigDecimal nextMonthTotalAmount
@param String currentDate
@param org.springframework.security.web.csrf.CsrfToken csrf

@template.layout.index(content = @`
    <div class="container">

        <div class="card shadow-sm mb-4">
            <div class="card-body">

                <h3 class="card-title mb-3">
                    Welcome, ${username}!
                </h3>

                <p class="mb-1">
                    <strong>Today:</strong> ${currentDate}
                </p>

                <p class="text-muted mb-3">
                    This is your dashboard. Here you can view your recent activity and manage your account.
                </p>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="border rounded p-3 h-100">
                            <h6 class="text-muted mb-1">Previous Month Expenses</h6>
                            <div class="fs-5 fw-semibold">
                                ${previousMonthTotalAmount} €
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="border rounded p-3 h-100">
                            <h6 class="text-muted mb-1">Current Month Expenses</h6>
                            <div class="fs-5 fw-semibold">
                                ${currentMonthTotalAmount} €
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 mt-3 mt-md-0">
                        <div class="border rounded p-3 h-100">
                            <h6 class="text-muted mb-1">Next Month Expenses</h6>
                            <div class="fs-5 fw-semibold">
                                ${nextMonthTotalAmount} €
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Logout -->
                <form method="post" action="/logout" class="text-end">
                    <input type="hidden"
                           name="${csrf.getParameterName()}"
                           value="${csrf.getToken()}" />

                    <button type="submit" class="btn btn-outline-danger">
                        Logout
                    </button>
                </form>

            </div>
        </div>

    </div>
`)