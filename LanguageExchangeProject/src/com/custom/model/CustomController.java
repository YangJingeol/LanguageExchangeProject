package com.custom.model;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Controller;
import com.controller.RequestMapping;
import com.custom.dao.FaqVO;
import com.custom.dao.M_QnaVO;
import com.custom.dao.NoticeDAO;
import com.custom.dao.NoticeDAO1;
import com.custom.dao.NoticeDTO;
import com.custom.dao.QnaVO;

@Controller("custom")
public class CustomController {
	@RequestMapping("notice.do")
	public String noticeBoardList(HttpServletRequest req,HttpServletResponse res)
	{
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 a");
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		NoticeDAO dao=NoticeDAO.newInstance();
		List<NoticeDTO> list=dao.notice_boardListData(map);
		for(NoticeDTO d:list)
		{
			d.setDbday(sdf.format(d.getN_Regdate()));
		}
		int count=dao.notice_boardRowCount();
		int total=(int)(Math.ceil(count/10.0));
		req.setAttribute("today", sdf.format(new Date()));
		req.setAttribute("totalpage", total);
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		
		req.setAttribute("jsp", "../custom_board/notice_board.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("notice_content.do")
	public String noticeContentData(HttpServletRequest req,HttpServletResponse res)
	{
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		System.out.println("NO:"+strNo);
		System.out.println("page:"+strPage);
		//
		NoticeDAO dao=NoticeDAO.newInstance();
		NoticeDTO list=dao.notice_boardContentData(Integer.parseInt(strNo));
		list.setDbday(sdf.format(list.getN_Regdate()));
		System.out.println("list.title:"+list.getN_Title());
		//
		req.setAttribute("list",list);
		req.setAttribute("jsp", "../custom_board/notice_board_content.jsp");
		return "main/main.jsp";
		
	}
	//공지사항 게시물 만들기
	@RequestMapping("notice_insert.do")
	public String noticeInsert(HttpServletRequest req, HttpServletResponse res){
			req.setAttribute("jsp", "../custom_board/notice_insert.jsp");
			return "main/main.jsp";
	}
	//공지사항 게시물 체크
	@RequestMapping("notice_insert_ok.do")
	public String noticeInsert_ok(HttpServletRequest req, HttpServletResponse res) throws UnsupportedEncodingException{
		req.setCharacterEncoding("UTF-8");
		String n_title=req.getParameter("f_title");
		String n_content=req.getParameter("f_content");
		NoticeDTO ndto=new NoticeDTO();
		ndto.setN_Title(n_title);
		ndto.setN_Content(n_content);
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.noticeInsert(ndto);
		return "notice.do";
	}
	//공지사항 검색하기
	@RequestMapping("n_search.do")
	public String notice_searchListData(HttpServletRequest req, HttpServletResponse res) throws UnsupportedEncodingException{
			req.setCharacterEncoding("UTF-8");
			SimpleDateFormat sdf=
					new SimpleDateFormat("yyyy-MM-dd");
			String strPage=req.getParameter("page");
			if(strPage==null)
				strPage="1";
			int curpage=Integer.parseInt(strPage);
			int rowSize=10;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
		
			String word = req.getParameter("word");
			System.out.println(word);
			NoticeDAO dao=NoticeDAO.newInstance();
			List<NoticeDTO> list=dao.notice_searchListData(word);
			req.setAttribute("list", list);
			for(NoticeDTO d:list)
			{
				d.setDbday(sdf.format(d.getN_Regdate()));
			}
			int totalpage=dao.notice_searchboardRowCount(word);
			req.setAttribute("today", sdf.format(new Date()));
			req.setAttribute("totalpage", totalpage);
			req.setAttribute("list", list);
			req.setAttribute("curpage", curpage);
			
			req.setAttribute("jsp", "../custom_board/notice_search_board.jsp");
			return "main/main.jsp";
	}
	//공지사항 지우기
	@RequestMapping("n_delete.do")
	public String notice_delete(HttpServletRequest req, HttpServletResponse res){
		String nno=req.getParameter("no");
		NoticeDAO1 dao = new NoticeDAO1();
		dao.notice_delete(Integer.parseInt(nno));
		return "notice.do";
	}
	@RequestMapping("faq.do")
	public String faq_boardListData(HttpServletRequest req, HttpServletResponse res) throws Exception {

		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy-MM-dd");
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		NoticeDAO dao=NoticeDAO.newInstance();
		
		List<FaqVO> list=dao.faq_boardListData(map);
		for(FaqVO d:list)
		{
			d.setDb_fday(sdf.format(d.getF_regdate()));
		}
		int count=dao.faq_boardRowCount();
		int total=(int)(Math.ceil(count/10.0));
		req.setAttribute("today", sdf.format(new Date()));
		req.setAttribute("totalpage", total);
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		req.setAttribute("jsp", "../custom_board/faq_board.jsp");
		return "main/main.jsp";
		}
	@RequestMapping("faq_insert.do")
	public String faq_insert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		req.setAttribute("jsp", "../custom_board/faq_insert.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("faq_insert_ok.do")
	public String faq_insert_ok(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String f_title=req.getParameter("f_title");
		String f_content=req.getParameter("f_content");
		FaqVO fvo=new FaqVO();
		fvo.setF_title(f_title);
		fvo.setF_content(f_content);
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.faqInsert(fvo);
		return "faq.do";
	}
	@RequestMapping("f_search.do")
	public String Faq_Search(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy-MM-dd");
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
	
		String word = req.getParameter("word");
		System.out.println(word);
		NoticeDAO dao=NoticeDAO.newInstance();
		FaqVO list=dao.faq_searchListData(word);
		req.setAttribute("list", list);
		list.setDb_fday(sdf.format(list.getF_regdate()));
		
		int count=dao.faq_searchboardRowCount(word);
		int total=(int)(Math.ceil(count/10.0));
		req.setAttribute("today", sdf.format(new Date()));
		req.setAttribute("totalpage", total);
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		
		req.setAttribute("jsp", "../custom_board/faq_search_board.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("f_delete.do")
	public String faq_delete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String fno=req.getParameter("no");
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.faq_delete(Integer.parseInt(fno));
		return "faq.do";
	}
	@RequestMapping("qna.do")
	public String M_Qna_BoardList(HttpServletRequest req, HttpServletResponse res){
			
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			String admin = (String)session.getAttribute("admin");
			System.out.println("email,admin:"+email+admin);
			SimpleDateFormat sdf=
					new SimpleDateFormat("yyyy-MM-dd");
			String strPage=req.getParameter("page");
			if(strPage==null)
				strPage="1";
			int curpage=Integer.parseInt(strPage);
			int rowSize=10;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			Map map=new HashMap();
			map.put("start", start); // #{start}
			map.put("end", end); // #{end}
			NoticeDAO dao=NoticeDAO.newInstance();
			List<M_QnaVO> list=dao.M_qna_boardListData(map);
			for(M_QnaVO d:list)
			{
				d.setDb_qday(sdf.format(d.getQ_regdate()));
			}
			int count=dao.M_qna_boardRowCount();
			int totalpage=(int)(Math.ceil(count/10.0));
			req.setAttribute("today", sdf.format(new Date()));
			req.setAttribute("totalpage", totalpage);
			req.setAttribute("list", list);
			req.setAttribute("curpage", curpage);
			req.setAttribute("jsp", "../custom_board/qna_board.jsp");
			return "main/main.jsp";
		}
	
	@RequestMapping("qna_content.do")
	public String Qna_BoardContentData(HttpServletRequest req, HttpServletResponse res){
		// TODO Auto-generated method stub
				SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
				String strNo=req.getParameter("no");
				String strPage=req.getParameter("page");
				System.out.println("NO:"+strNo);
				System.out.println("page:"+strPage);
				NoticeDAO dao=NoticeDAO.newInstance();
				M_QnaVO list=dao.M_qna_boardContentData(Integer.parseInt(strNo));
				list.setDb_qday(sdf.format(list.getQ_regdate()));
				System.out.println("list.title:"+list.getQ_title());
				//
				req.setAttribute("list",list);
				req.setAttribute("jsp", "../custom_board/qna_board_content.jsp");
				return "main/main.jsp";
	}
	@RequestMapping("qna_insert.do")
	public String Qna_BoardInsert(HttpServletRequest req, HttpServletResponse res){
		req.setAttribute("jsp", "../custom_board/qna_insert.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("qna_insert_ok.do")
	public String Qna_BoardInsert_Ok(HttpServletRequest req, HttpServletResponse res){
		try{
		NoticeDAO dao=NoticeDAO.newInstance();
		req.setCharacterEncoding("UTF-8");
		String q_title=req.getParameter("Q_title");
		String q_content=req.getParameter("Q_content");
		System.out.println("타이틀"+q_title);
		System.out.println("내용"+q_content);
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		
		M_QnaVO vo = new M_QnaVO();
		vo.setQ_title(q_title);
		vo.setQ_content(q_content);
		/*vo.setQ_pwd(pwd);*/
		vo.setQ_mail(email);
		
		dao.M_qna_boardInsert(vo);

		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "qna.do";
	}

	
}
