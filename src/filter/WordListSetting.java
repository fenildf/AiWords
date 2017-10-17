package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "WordListSetting", urlPatterns = "/word/index.jsp")
public class WordListSetting implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        HttpSession httpSession = httpServletRequest.getSession();
        Boolean aBoolean = (Boolean) httpSession.getAttribute("iswordnum");
        if (aBoolean == null) {
            httpSession.setAttribute("iswordnum", Boolean.FALSE);
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
