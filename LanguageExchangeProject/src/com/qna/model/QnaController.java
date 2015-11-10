package com.qna.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.controller.RequestMapping;
import com.qna.dao.*;
import java.util.*;

@Controller("qna")
public class QnaController {
	@RequestMapping("qa_pw_ch.do")
	public String qnaPwdCheck(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		String no=req.getParameter("qano");
		String pwd=req.getParameter("pw");
		QnaDAO dao=QnaDAO.newInstance();
		String rpw=dao.qnaPwCheck(Integer.parseInt(no));
		String result="";
		if(pwd.equals(rpw))
		{
			result="OK";
			String cont=dao.contOut(Integer.parseInt(no));
			req.setAttribute("qa_cont", cont);
			String ans_ch=dao.ansCh(Integer.parseInt(no));
			if(ans_ch.equals("Y"))
			{
				result="ANS_OK";
				String ans_cont=dao.ansContOut(Integer.parseInt(no));
				req.setAttribute("ans_cont", ans_cont);
			}
		}
		else
		{
			result="NOPWD";
		}
		req.setAttribute("result", result);
		return "meeting/qa_pw_ch.jsp";
	}
	@RequestMapping("qa_write_ok.do")
	public String qnaWrite(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		QnaDAO dao=QnaDAO.newInstance();
		String id=req.getParameter("qa_id");
		String no=req.getParameter("no");
		String sub=req.getParameter("iq_subject");
		String cont=req.getParameter("iq_question");
		String s_check=req.getParameter("iq_secret");
		String s_txt=req.getParameter("iq_secret_txt");
		if(s_check==null)
		{
			s_check="N";
		}
		if(s_txt==""||s_txt==null)
		{
			s_txt="0000";
		}
		String a="Y";
		q_dto d=new q_dto();
		d.setB_no(Integer.parseInt(no));
		d.setQ_id(id);
		d.setSubject(sub);
		d.setCont(cont);
		d.setSecret(s_check);
		d.setPw(s_txt);
		dao.qnaInput(d);
		req.setAttribute("no", no);
		return "meeting/qa_write_ok.jsp";
	}
	@RequestMapping("qa_ans_write_in.do")
	public String qnaAnsWrite(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		String qa_no=req.getParameter("qa_no");
		QnaDAO dao=QnaDAO.newInstance();
		q_dto d=dao.qnaGetData(Integer.parseInt(qa_no));
		req.setAttribute("qa_d", d);
		return "meeting/qa_ans_write.jsp?qa_no="+qa_no;
	}
	@RequestMapping("qa_ans_ok.do")
	public String qnaAnsWriteOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		QnaDAO dao=QnaDAO.newInstance();
		String qa_no=req.getParameter("qa_no");
		String a_id=req.getParameter("qa_id");
		String ans_cont=req.getParameter("iq_answer");
		a_dto a=new a_dto();
		a.setNo(Integer.parseInt(qa_no));
		a.setA_id(a_id);
		a.setCont(ans_cont);
		dao.ansInsert(a);
		return "meeting/qa_ans_ok.jsp";
	}
	@RequestMapping("ntc_write_ok.do")
	public String ntcWriteOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		QnaDAO dao=QnaDAO.newInstance();
		String strNo=req.getParameter("no");
		String ntc_id=req.getParameter("ntc_id");
		String title=req.getParameter("iq_subject");
		String cont=req.getParameter("iq_ntc");
		ntc_dto nd=new ntc_dto();
		nd.setB_no(Integer.parseInt(strNo));
		nd.setNtc_id(ntc_id);
		nd.setNtc_sub(title);
		nd.setNtc_cont(cont);
		dao.ntcInsert(nd);
		return "meeting/ntc_ok.jsp";
	}
	@RequestMapping("comment_ok.do")
	public String commetOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		QnaDAO dao=QnaDAO.newInstance();
		String cont=req.getParameter("cont");
		System.out.println("cont="+cont);
		String id=req.getParameter("id");
		System.out.println("id="+id);
		String strNo=req.getParameter("bno");
		System.out.println(strNo);
		cm_dto cd=new cm_dto();
		cd.setB_no(Integer.parseInt(strNo));
		cd.setId(id);
		cd.setCmt(cont);
		dao.cmInsert(cd);
		List<cm_dto> clist=dao.cmListData(Integer.parseInt(strNo));
		req.setAttribute("clist", clist);
		return "comment_ok.jsp";
	}
	@RequestMapping("cmtdel_ok.do")
	public String cmtdelOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		String cm_no=req.getParameter("cm_no");
		QnaDAO dao=QnaDAO.newInstance();
		dao.cmDelete(Integer.parseInt(cm_no));
		return "meeting/cmtdel_ok.jsp";
	}
}
