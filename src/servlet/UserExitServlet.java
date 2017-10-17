package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "UserExitServlet", urlPatterns = "/userexit")
public class UserExitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Cookie[] cookies = request.getCookies();
//        for (Cookie cookie : cookies) {
//            if (cookie.getName().equals("userID")) {//已经登录过
//                cookie.setMaxAge(0);
//                response.addCookie(cookie);
//            }
//        }
        HttpSession httpSession = request.getSession();
        Object object = httpSession.getAttribute("userID");
        if (object != null) {
            Cookie cookie = new Cookie("JSESSIONID", httpSession.getId());
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            httpSession.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
