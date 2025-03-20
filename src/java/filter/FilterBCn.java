/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 *
 * @author OS
 */
@WebFilter(filterName = "Filter", urlPatterns = {"/*"})
public class FilterBCn implements Filter {

    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public FilterBCn() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("Filter:DoBeforeProcessing");
        }
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("Filter:DoAfterProcessing");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("Filter:doFilter()");
        }

        doBeforeProcessing(request, response);
////////////////////////////////////////////////////////////////////////////////
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(); // Không tạo session mới ngay

        // Lấy đường dẫn mà người dùng đang truy cập
        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String path = requestURI.substring(contextPath.length());

        // không cần đăng nhập
        boolean isPublicPage = path.contains("/home") || path.contains("/product")
                || path.contains("/login") || path.contains("/signup");

        // tài nguyên tĩnh
        boolean isStaticResource = path.endsWith(".png") || path.endsWith(".jpg")
                || path.endsWith(".css") || path.endsWith(".js");

        // kiểm tra đnhap
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        try {
            if (isPublicPage || isStaticResource) {
                // cho phép truy cập
                chain.doFilter(request, response); 
            } else if (isLoggedIn) {
                // nếu đã đăng nhập
                if (path.contains("/login")) {
                    // nếu đang ở login -> chuyển về home
                    res.sendRedirect(requestURI);
                    System.out.println(requestURI);
                } else {
                    // Tiếp tục xử lý yêu cầu bình thường
                    chain.doFilter(request, response);
//                    System.out.println(requestURI);
                }
            } else {
                // Nếu chưa đăng nhập và không phải trang công khai, chuyển đến /login
                HttpSession newSession = req.getSession(true);
//                newSession.setAttribute("redirectAfterLogin", requestURI);
                res.sendRedirect(contextPath + "/login");
                System.out.println(requestURI);
            }
        } catch (Throwable t) {
            sendProcessingError(t, response);
        }
////////////////////////////////////////////////////////////////////////////////
        doAfterProcessing(request, response);
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("Filter:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("Filter()");
        }
        StringBuffer sb = new StringBuffer("Filter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
