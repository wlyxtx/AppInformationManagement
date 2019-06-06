package cn.edu.sict.servlet;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

//loadOnStartup跟随容器启动而启动
@WebServlet(urlPatterns = {}, loadOnStartup = 2)
public class WebElementServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        config.getServletContext().setAttribute("ctx", config.getServletContext().getContextPath());
        super.init(config);
    }
}
