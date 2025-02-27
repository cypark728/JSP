package com.myweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({
	"/users/mypage.users",
	"/users/modifyFomr.users",
	"/users/delete.users",
	"/notice/regist.board",
	"/notice/registFomr.board"
})
public class AuthenticationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		//필터 - 세션을 가지고 있는 사람만 접근이 가능
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		request.setCharacterEncoding("utf-8");
		
		//현재의 세션
		HttpSession session = request.getSession();
		if(session.getAttribute("userDTO") == null) {
			//response.sendRedirect(request.getContextPath() + "/users/login.users"); //절대경로
			
			String path = request.getContextPath() + "/users/login.users";
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='" + path + "';");
			out.println("</script>");
			
			return; //종료
		}
		
		//로그인이 되어 있으면, 컨트롤러로 연결
		chain.doFilter(request, response);
	}
}
