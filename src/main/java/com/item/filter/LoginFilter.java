package com.item.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) arg0;//获取request对象
		HttpServletResponse response=(HttpServletResponse) arg1;//获取response对象
		HttpSession session=request.getSession();//获取session对象
		if(session.getAttribute("user")==null
				&& request.getRequestURI().indexOf("/system/login") == -1){
			// 没有登录
			response.sendRedirect(request.getContextPath()+"/system/login");
		}else{
			// 已经登录，继续请求下一级资源（继续访问）
			arg2.doFilter(arg0, arg1);
		}
		System.out.println("前台用户信息登录保存到session中");
		arg2.doFilter(request, response);//放行，通过了当前过滤器，递交给下一个filter进行过滤
	}

}
