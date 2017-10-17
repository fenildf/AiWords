package servlet;

import dao.BaseWordDao;
import dao.BaseWordDaoImpl;
import domain.Word;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@javax.servlet.annotation.WebServlet(name = "AddServlet",urlPatterns = "/add")
public class AddServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        Word word = new Word();
        try {
            BeanUtils.populate(word, request.getParameterMap());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (word.getWord() != null) {
            word.setWord(word.getWord().trim());
        }
        if (word.getMeaning() != null) {
            word.setMeaning(word.getMeaning().trim());
        }
        if (word.getSymbol() != null) {
            word.setSymbol(word.getSymbol().trim());
        }
        word.setDatetime(new Date());
        int id = -1;
//        for (Cookie cookie : request.getCookies()) {
//            if (cookie.getName().equals("userID")) {
//                id = Integer.parseInt(cookie.getValue());
//            }
//        }

        HttpSession httpSession = request.getSession();
        Object object =  httpSession.getAttribute("userID");
        if (object != null) {
            id = Integer.parseInt((String) object);
        }

        word.setUid(id);
        baseWordDao.addWord(word);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }
}
