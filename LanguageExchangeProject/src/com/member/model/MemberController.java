package com.member.model;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Controller;
import com.controller.RequestMapping;
import com.meeting.dao.MeetingDAO;
import com.meeting.dao.MeetingDTO;
import com.member.dao.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller("member")
public class MemberController {
	@RequestMapping("login.do")
	public String login(HttpServletRequest req,HttpServletResponse res)
	{
		req.setAttribute("jsp", "../member/login.jsp");
		
		return "main/main.jsp";
	}
	@RequestMapping("login_check.do")
	public String loginCheck(HttpServletRequest req,HttpServletResponse res)
	{
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		MemberDAO dao=MemberDAO.newInstance();
		int count = dao.memberIdCount(email);
		String result = "";
		if(count == 0)
		{
			result = "NOID";
		}
		else
		{
			MemberDTO d = dao.memberGetInfo(email);
			if(pwd.equals(d.getPwd()))
			{
				result = "OK";
				HttpSession session = req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("name", d.getName());
				session.setAttribute("admin", d.getAdmin());
				
			}
			else
			{
				result ="NOPWD";
			}
		}
		req.setAttribute("result", result);
		
		return "member/login_check.jsp";
	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session = req.getSession();
		session.invalidate();
		return "main.do";
	}
	@RequestMapping("join.do")
	public String join(HttpServletRequest req,HttpServletResponse res)
	{
		req.setAttribute("jsp", "../member/join.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("join_ok.do")
	public String joinOk(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			String path=req.getSession().getServletContext().getRealPath("/")+"human" + File.separator + "multiupload" + File.separator;
		      System.out.println("path="+path);
		      File file = new File(path);
		      if (!file.exists()) {
		          file.mkdirs();
		      }
		      
		      String enctype="UTF-8";
		      int size=1024*1024*10;
		      MultipartRequest lr=new MultipartRequest(req,path,size,enctype,new DefaultFileRenamePolicy());
		      
		      String filename=lr.getOriginalFileName("upload");
		      req.setCharacterEncoding("UTF-8");

		        String email = lr.getParameter("email");
		        String pwd = lr.getParameter("pwd");
		        String name = lr.getParameter("name");
		        String nickname = lr.getParameter("nickname");
		        String age = lr.getParameter("age");
		        String sex = lr.getParameter("sex");
		        String nation = lr.getParameter("nation");
		        String tel = lr.getParameter("tel");
		        String language = lr.getParameter("language");
		        String intro=lr.getParameter("intro");
		        String lang = lr.getParameter("lang");
		       
		      MemberDTO d=new MemberDTO();
		      d.setEmail(email);
		      d.setPwd(pwd);
		      d.setName(name);
		      d.setNickname(nickname);
		      d.setAge(Integer.parseInt(age));
		      d.setSex(sex);
		      d.setNation(nation);
		      d.setIntro(intro);
		      d.setTel(tel);
		      d.setLanguage(language);
		      d.setLang(lang);
		      String admin="n";
		      d.setAdmin(admin);
		      
		      if(filename==null)
		      {
		         d.setPname("");
		         d.setPsize(0);
		      }
		      else
		      {
		         d.setPname(filename);
		         File file2=new File(path+"\\"+filename);
		         d.setPsize((int)file2.length());
		      }
		      MemberDAO dao=MemberDAO.newInstance();
		      dao.memberInsert(d);
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		return "main.do";
	}
	@RequestMapping("idcheck.do")
	public String idcheck(HttpServletRequest req,HttpServletResponse res)
	{
		String email;
		int count = 0;
		MemberDAO dao=MemberDAO.newInstance();
		if(req.getParameter("email") == null)
		{
			email = "";
		}
		else
		{
			email = req.getParameter("email");
			count = dao.memberIdCount(email)+1;
		}
		
		String result = "";
		if(count == 0)
			result = "null";
		else if (count == 1)
			result = "OK";
		else
			result = "NotOK";
		req.setAttribute("result", result);
		req.setAttribute("email", email);
		return "member/idcheck.jsp";
	}
	@RequestMapping("modify.do")
	public String myModify(HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		
		MemberDAO dao=MemberDAO.newInstance();
		MemberDTO d = dao.memberGetInfo(email);

		req.setAttribute("d", d);
          
		 StringTokenizer st = new StringTokenizer(d.getTel(), "-");
		 req.setAttribute("tel1", st.nextToken());
		 req.setAttribute("tel2", st.nextToken());
		 req.setAttribute("tel3", st.nextToken());
		 
		
		req.setAttribute("jsp", "../mypage/modify.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("modify_ok.do")
	public String myModifyOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
        String nickname=req.getParameter("nickname");
        String lang=req.getParameter("lang");
        String pwd=req.getParameter("password");
        String tel1=req.getParameter("tel1");
        String tel2=req.getParameter("tel2");
        String tel3=req.getParameter("tel3");
        String tel=tel1+"-"+tel2+"-"+tel3;
        String intro=req.getParameter("intro");
        
        MemberDAO dao=MemberDAO.newInstance();
        MemberDTO d = dao.memberGetInfo(email);
        d.setEmail(email);
        d.setNickname(nickname);
        d.setLang(lang);
        d.setPwd(pwd);
        d.setTel(tel);
        d.setIntro(intro);
        dao.modifyUpdate(d);

		return "modify.do";
	}
	@RequestMapping("wish.do")
	public String myWish(HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		
		MeetingDAO dao=MeetingDAO.newInstance();
		int count=dao.myWishCount(email);
		List<MeetingDTO> list=dao.myWishList(email);
		
		req.setAttribute("count", count);
		req.setAttribute("list", list);
		
		req.setAttribute("jsp", "../mypage/wish.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("meeting.do")
	public String myMeeting(HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		
		MeetingDAO dao=MeetingDAO.newInstance();
		List<MeetingDTO> list=dao.myMeetingData(email);
		req.setAttribute("list", list);
        
		req.setAttribute("jsp", "../mypage/meeting.jsp");
		return "main/main.jsp";
	}
}
