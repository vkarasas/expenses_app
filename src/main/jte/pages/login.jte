@import org.springframework.security.web.csrf.CsrfToken
@param CsrfToken csrf

@template.layout.index(content = @`
    <form method="post" action="/dashboard">
        <input type="hidden"
               name="${csrf.getParameterName()}"
               value="${csrf.getToken()}" />


        <div>
            <label>Username:</label>
            <input type="text" name="username"/>
        </div>

        <div>
            <label>Password:</label>
            <input type="password" name="password"/>
        </div>

        <button type="submit">Login</button>
    </form>
    `)