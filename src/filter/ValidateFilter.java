package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "ValidateFilter", urlPatterns = {"/word/*","/user/edituser.jsp","/wordlist"})
public class ValidateFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
//        Cookie[] cookies = httpServletRequest.getCookies();
//        for (Cookie cookie : cookies) {
//            if (cookie.getName().equals("userID")) {//已经登录过
//                chain.doFilter(req, resp);
//                return;
//            }
//        }

        HttpSession httpSession = httpServletRequest.getSession();
        Object object = httpSession.getAttribute("userID");
        if (object != null) {
            chain.doFilter(req, resp);
            return;
        }

        HttpServletResponse response = (HttpServletResponse) resp;
        response.sendRedirect(httpServletRequest.getContextPath() + "/user/login.jsp");
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
