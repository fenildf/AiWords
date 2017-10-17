package servlet;

import com.google.gson.Gson;
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
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "UserEditServlet",urlPatterns = "/useredit")
public class UserEditServlet extends HttpServlet {
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
            String newPassword = request.getParameter("newPassword");
            BaseUserDao baseUserDao = new BaseUserDaoImpl();
            baseUserDao.updateUserPassword(user, newPassword);//修改密码
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", isMatching);
        response.getWriter().write(new Gson().toJson(map));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
