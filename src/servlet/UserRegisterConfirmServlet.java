package servlet;

import com.google.gson.Gson;
import dao.BaseUserDaoImpl;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "UserRegisterConfirmServlet",urlPatterns = "/userRegisterConfirm")
public class UserRegisterConfirmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        if (username != null) {
            UserService userService = new UserService(new BaseUserDaoImpl());
            boolean isExist = userService.isUserExist(username);
            Map<String, Boolean> map = new HashMap<>();
            map.put("valid", !isExist);
            response.getWriter().write(new Gson().toJson(map));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
