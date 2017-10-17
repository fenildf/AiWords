package servlet;

import domain.Page;
import domain.Word;
import org.apache.commons.beanutils.BeanUtils;
import service.WordService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet(name = "GetWords", urlPatterns = "/wordlist")
public class GetWords extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = -1;
        HttpSession httpSession = request.getSession();
        Object object = httpSession.getAttribute("userID");
        if (object != null) {
            id = Integer.parseInt((String) object);
        }
        Page page = new Page();
        try {
            BeanUtils.populate(page, request.getParameterMap());
        } catch (Exception e) {
            e.printStackTrace();
        }

        WordService wordService = new WordService();
        List<Word> words = wordService.getPageWords(id, page);
        request.setAttribute("words", words);
        request.setAttribute("page", page);
        request.setAttribute("maxpage", wordService.getMaxPage(id, page) + "");
        request.getRequestDispatcher("/word/index2.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
