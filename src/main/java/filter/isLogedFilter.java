package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter({"/user/*","/admin/*"})
public class isLogedFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		String loginURI = req.getServletContext().getContextPath()+"/user/sign-in";
		String signUpURI = req.getServletContext().getContextPath()+"/user/sign-up";
		boolean loggedIn = session != null && session.getAttribute("user") != null;
		boolean loginRequest = req.getRequestURI().equals(loginURI);
		boolean signUpRequest = req.getRequestURI().equals(signUpURI);
		
		if (loggedIn || loginRequest || signUpRequest) {
            chain.doFilter(request, response);
        } else {
        	req.setAttribute("message", "Đăng nhập để tiếp tục");
            resp.sendRedirect(loginURI);
//            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        };
	}


}
