package com.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.io.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<String> clsList=new ArrayList<String>();
	
	public void init(ServletConfig config) throws ServletException {
		try
		{
			String path=config.getInitParameter("contextConfigLocation");
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder();
			Document doc=db.parse(new File(path));
			Element root=doc.getDocumentElement();
			NodeList list=root.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++)
			{
				Element elem=(Element)list.item(i);
				String cls=elem.getAttribute("class");
				clsList.add(cls);
			}
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String cmd=request.getRequestURI();
			cmd=cmd.substring(request.getContextPath().length()+1);
			for(String strName:clsList)
			{
				Class clsName=Class.forName(strName);
				if(clsName.isAnnotationPresent(Controller.class)==false)
				{
					continue;
				}
				Object obj=clsName.newInstance();
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd))
					{
						String jsp=(String)m.invoke(obj, request,response);
						if(jsp!=null)
						{
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
			
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}

}
