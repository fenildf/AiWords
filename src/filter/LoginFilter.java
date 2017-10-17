package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter",urlPatterns = "/user/login.jsp")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
//        Cookie[] cookies = httpServletRequest.getCookies();
//        for (Cookie cookie : cookies) {
//            if (cookie.getName().equals("userID")) {//已经登录过
//                HttpServletResponse response = (HttpServletResponse) resp;
//                response.sendRedirect(httpServletRequest.getContextPath() + "/word/");
//            }
//        }
        HttpSession httpSession = httpServletRequest.getSession();
        Object object = httpSession.getAttribute("userID");
        if (object != null) {
            HttpServletResponse response = (HttpServletResponse) resp;
            response.sendRedirect(httpServletRequest.getContextPath() + "/word/");
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
