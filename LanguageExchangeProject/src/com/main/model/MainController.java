package com.main.model;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Controller;
import com.controller.RequestMapping;
import com.meeting.dao.*;
import com.member.dao.*;

@Controller("main")
public class MainController {
	
	@RequestMapping("main.do")
	public String main(HttpServletRequest req,HttpServletResponse res)
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		MeetingDAO dao=MeetingDAO.newInstance();
		//List<gtableDTO> list=MemberDAO.gtableListData();
		List<MeetingDTO> list=dao.meetingTableListData();	
		List<MeetingDTO> list2=dao.meetingTableListData2();	
		
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		if(email!=null){
			int m_count=dao.myMeetingCount(email);
			session.setAttribute("m_count", m_count);
		}
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.setAttribute("title", "자유 게시판");
		req.setAttribute("slide", "../main/slide.jsp");
		req.setAttribute("quick", "../main/quickmenu.jsp");
		req.setAttribute("jsp", "../main/meeting_list.jsp");

		return "main/main.jsp";
	}
	@RequestMapping("search.do")
	public String search(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		String word;
		word = req.getParameter("word");
		System.out.println(word);
		MeetingDAO dao=MeetingDAO.newInstance();
		List<MeetingDTO> list=dao.searchMeeting(word);
		req.setAttribute("list", list);
		req.setAttribute("slide", "../main/slide.jsp");
		req.setAttribute("jsp", "../main/meeting_list.jsp");
		
		return "main/main.jsp";
	}
}
