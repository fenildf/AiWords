package servlet;

import dao.BaseUserDao;
import dao.BaseUserDaoImpl;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

@WebServlet(name = "UserRegisterServlet", urlPatterns = "/register")
public class UserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (Exception e) {
            e.printStackTrace();
        }
        UserService userService = new UserService(new BaseUserDaoImpl());
        if (userService.addUser(user)) {
            response.getWriter().write("注册成功,<a href=\"" + request.getContextPath() + "/\">点击</a>登录...");
        } else {
            response.getWriter().write("注册失败!");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
