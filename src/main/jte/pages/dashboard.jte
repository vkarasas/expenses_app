@param String username
@param java.math.BigDecimal currentMonthTotalAmount
@param java.math.BigDecimal nextMonthTotalAmount
@param String currentDate
@param org.springframework.security.web.csrf.CsrfToken csrf

@template.layout.index(content = @`
    <div class="bg-white shadow rounded-lg p-6">
        <h1 class="text-2xl font-bold mb-4">Welcome, ${username}!</h1>
        <p>Today: ${currentDate}</p>
        <p class="text-gray-600">This is your dashboard. Here you can view your recent activity and manage your account.</p>
        <p class="text-gray-600">Current month expenses: ${currentMonthTotalAmount} €</p>
        <p class="text-gray-600">Next month expenses: ${nextMonthTotalAmount} €</p>


        <form method="post" action="/logout">
            <input type="hidden"
                   name="${csrf.getParameterName()}"
                   value="${csrf.getToken()}" />

            <button type="submit">Logout</button>
        </form>

    </div>

`)