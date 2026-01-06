package com.expenses.util;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.web.csrf.CsrfToken;

public class RequestAttributeUtil {

    /**
     *  Return Csrf token from request
     * @param request HttpServletRequest
     * @return CsrfToken
     */
    public static CsrfToken getCsrfToken(HttpServletRequest request) {
        return (CsrfToken) request.getAttribute(CsrfToken.class.getName());
    }
}
