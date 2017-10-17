package servlet;

import dao.BaseWordDao;
import dao.BaseWordDaoImpl;
import domain.Word;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@WebServlet(name = "UpdateServlet",urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Word word = new Word();
        try {
            BeanUtils.populate(word, request.getParameterMap());
        } catch (Exception e) {
            e.printStackTrace();
        }
        word.setDatetime(new Date());
        BaseWordDao dao = new BaseWordDaoImpl();
        dao.updateWord(word);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
