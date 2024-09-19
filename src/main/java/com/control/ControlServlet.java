package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"*.do"}, initParams = {@WebInitParam(name = "propertyConfig", value = "command.properties")})
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig");
		System.out.println("propertyConfig = " + propertyConfig);
		
		//@WebServlet으로 서블릿을 등록하였을 때
		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		String realPath = realFolder + "/" + propertyConfig;
		System.out.println(realPath);
		
		//command.properties의 파일의 내용을 읽어서 Map에 보관
		FileInputStream fin = null;
		Properties properties = new Properties();
		
		try {
			//@WebServlet으로 서블릿을 등록하였을 때
			fin = new FileInputStream(realPath);

            properties.load(fin);
            System.out.println("properties = " + properties);
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
	         try {
	            fin.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
        }
		
		Iterator<Object> it = properties.keySet().iterator();
		
		while(it.hasNext()) {
            String key = (String)it.next();
            System.out.println("key = "+key);

            String className = properties.getProperty(key);
            System.out.println("className = "+className);

            try {
               Class<?> classType = Class.forName(className);
               Object ob = classType.getConstructor().newInstance();

               System.out.println("ob = "+ob);

               map.put(key, ob);

            } catch (ClassNotFoundException e) {
               e.printStackTrace();
            } catch (InstantiationException e) {
               e.printStackTrace();
            } catch (IllegalAccessException e) {
               e.printStackTrace();
            } catch (IllegalArgumentException e) {
               e.printStackTrace();
            } catch (InvocationTargetException e) {
               e.printStackTrace();
            } catch (NoSuchMethodException e) {
               e.printStackTrace();
            } catch (SecurityException e) {
               e.printStackTrace();
            }

            System.out.println();
         }
		
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		
		if(request.getMethod().equals("POST")) request.setCharacterEncoding("UTF-8");	//POST요청이면 UTF-8 세팅해주기
		
		//http://localhost/memberMVC/member/wirteForm.do -> 요청한 URL
		//요청한 URL에서 "/member/wirteForm.do" 뜯어오기
		String category = request.getServletPath();		//Project명 뒤에 있는 URL 뜯어옴(/member/wirteForm.do)
		System.out.println("category = " + category);
		
		//Map을 이용하여 key값을 주면 해당하는 value를 꺼내온다 - command.properties에서 Map으로 저장함
		CommandProcess com = (CommandProcess) map.get(category);
		System.out.println("com = " + com);
		String view ="";
		
		try {
			view = com.requestPro(request, response);	//WriteFormService에 있는 return값(/member/memberWriteForm.jsp)을 꺼내옴
			System.out.println("view = " + view);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		if(view.equals("none")) return;
		
		//forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);	//상대번지(/member/memberWriteForm.jsp)
		dispatcher.forward(request, response); //제어권 넘기기
	}

}
