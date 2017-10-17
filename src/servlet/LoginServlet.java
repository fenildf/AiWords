package servlet;

import com.google.gson.Gson;
import dao.BaseUserDao;
import dao.BaseUserDaoImpl;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (Exception e) {
            e.printStackTrace();
        }
        UserService userService = new UserService(new BaseUserDaoImpl());
        boolean isMatching = userService.isPasswordMatching(user);
        if (isMatching) {

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("userID", new BaseUserDaoImpl().
                    getUserByUsername(user.getUsername()).getId() + "");

            Cookie cookie = new Cookie("JSESSIONID", httpSession.getId());
            cookie.setMaxAge(3600 * 24 * 7);
            response.addCookie(cookie);
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", isMatching);
        response.getWriter().write(new Gson().toJson(map));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
