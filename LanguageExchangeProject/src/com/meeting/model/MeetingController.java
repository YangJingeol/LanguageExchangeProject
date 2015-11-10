package com.meeting.model;

import java.io.*;
import java.util.*;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Controller;
import com.controller.RequestMapping;
import com.meeting.dao.*;
import com.member.dao.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.qna.dao.*;

@Controller("meeting")
public class MeetingController {
	@RequestMapping("meeting_insert.do")
	public String meetingInsert(HttpServletRequest req,HttpServletResponse res)
	{
		req.setAttribute("jsp", "../meeting/meeting_insert.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("meeting_insert_ok.do")
	public String meetingInsertOk(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String path=req.getSession().getServletContext().getRealPath("/")
				+"SE2" + File.separator + "multiupload" + File.separator;
		System.out.println("path="+path);
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
		
		String enctype="UTF-8";
		int size=1024*1024*10;
		MultipartRequest mr=new MultipartRequest(req,path,size,enctype,new DefaultFileRenamePolicy());
		
		String filename=mr.getOriginalFileName("upload");
		
		req.setCharacterEncoding("UTF-8");
		String m_lang1=mr.getParameter("lang1");
		String m_lang1num=mr.getParameter("lang1num");
		String m_lang2=mr.getParameter("lang2");
		String m_lang2num=mr.getParameter("lang2num");
		String m_title=mr.getParameter("title");
		String m_summary=mr.getParameter("summary");
		String m_content=mr.getParameter("content");
		String m_meetingDate1=mr.getParameter("meetingDate1");
		String m_meetingDate2=mr.getParameter("meetingDate2");
		String m_partDate1=mr.getParameter("partDate1");
		String m_partDate2=mr.getParameter("partDate2");
		String m_place=mr.getParameter("place");
		String m_location=mr.getParameter("location");
		String m_email=mr.getParameter("email");
		
		MemberDAO dao1=MemberDAO.newInstance();
		MemberDTO md=dao1.meetingOpenerData(m_email);
		
		MeetingDTO d=new MeetingDTO();
		d.setM_lang1(m_lang1);
		d.setM_lang1num(Integer.parseInt(m_lang1num));
		d.setM_lang2(m_lang2);
		d.setM_lang2num(Integer.parseInt(m_lang2num));
		d.setM_title(m_title);
		d.setM_summary(m_summary);
		d.setM_content(m_content);
		d.setM_meetingDate1(m_meetingDate1);
		d.setM_meetingDate2(m_meetingDate2);
		d.setM_partDate1(m_partDate1);
		d.setM_partDate2(m_partDate2);
		d.setM_place(m_place);
		d.setM_location(m_location);
		d.setM_email(m_email);
		d.setM_tel(md.getTel());
		
		if(filename==null)
		{
			d.setM_filename("");
			d.setM_filesize(0);
		}
		else
		{
			d.setM_filename(filename);
			File file2=new File(path+"\\"+filename);
			
			
			d.setM_filesize((int)file2.length());
		}
		MeetingDAO dao2=MeetingDAO.newInstance();
		
		dao2.meetingInsert(d);
		return "meeting/meeting_insert_ok.jsp";
	}
	@RequestMapping("meeting_detail.do")
	public String meetingDetail(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		

		QnaDAO qdao=QnaDAO.newInstance();
		int qa_count=qdao.qnaCheck(Integer.parseInt(strNo));
		String qa_check="N";
		if(qa_count>0)
		{
			qa_check="Y";
		}
		List<q_dto> qlist=
				qdao.qnaList(Integer.parseInt(strNo));
		List<ntc_dto> nlist=qdao.ntcListData(Integer.parseInt(strNo));
		int cm_ch=qdao.cmCount(Integer.parseInt(strNo));
		String cm_check="N";
		if(cm_ch>0)
		{
			cm_check="Y";
		}
		List<cm_dto> clist=qdao.cmListData(Integer.parseInt(strNo));
		
		req.setAttribute("qlist", qlist);
		req.setAttribute("qa_check", qa_check);
		req.setAttribute("cm_check", cm_check);
		req.setAttribute("clist", clist);
		String ntc_check="N";
		int ntc_count=qdao.ntcCh(Integer.parseInt(strNo));
		if(ntc_count>0)
		{
			ntc_check="Y";
		}
		
		req.setAttribute("ntc_check", ntc_check);
		req.setAttribute("nlist", nlist);
		
		
		
		MeetingDAO dao=MeetingDAO.newInstance();
		MeetingDTO d=dao.meetingDetail(Integer.parseInt(strNo));
		/*취소버튼만들기*/
		HttpSession session=req.getSession();
		String email=(String)session.getAttribute("email");
		String attend="";
		List<MeetingMemberDTO> list=dao.meetingMemberData(Integer.parseInt(strNo));
		for (MeetingMemberDTO a : list) {
			if(a.getMm_email().equals(email)){
				attend="yes";
			}
		}
		req.setAttribute("real", attend);
		req.setAttribute("d", d);
		req.setAttribute("list", list);
		String img="/NadeulmokAnnotation/SE2/multiupload/"+d.getM_filename();
		System.out.println("파일 이름 : "+img);
		req.setAttribute("total", d.getM_lang1num()+d.getM_lang2num());
		req.setAttribute("img", img);
		req.setAttribute("jsp", "../meeting/meeting_detail.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("meeting_zzim.do")
	public String meetingZzim(HttpServletRequest req,HttpServletResponse res)
	{
		String mno = req.getParameter("mno");
        String result=null;
    	HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
         if(email==null){
      	 result="noid";
         }
         else{
    	System.out.println("mno,email=="+mno+email );
    	MeetingDAO dao=MeetingDAO.newInstance();
    	  WishDTO d= new WishDTO();
         d.setW_email(email);
         d.setW_mno(Integer.parseInt(mno));
         int count=dao.wishCount(d);
         System.out.println("count:"+count);
         if(count==0){
      	   dao.meetingWish(d);
      	   dao.meetingWishAdd(Integer.parseInt(mno));
      	   System.out.println("count0:"+d.getW_email());
              result="ok";
         }else{ 
         System.out.println("count-:"+d.getW_email());
            dao.myWishDel(d);
            dao.meetingWishMinus(Integer.parseInt(mno));
            result="no";
         }
         }
         System.out.println("re="+result);
         req.setAttribute("result", result);
		
		return "main/meeting_zzim.jsp";
	}
	@RequestMapping("meeting_apply.do")
	public String meetingApply(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		req.setCharacterEncoding("UTF-8");
		String email=req.getParameter("email");
		String no=req.getParameter("no");
		String lang=req.getParameter("lang");
		
		MemberDAO dao1=MemberDAO.newInstance();
		MemberDTO d1=dao1.meetingMemberData(email);
		
		MeetingDAO dao2=MeetingDAO.newInstance();
		MeetingMemberDTO d2=new MeetingMemberDTO();
		
		d2.setMm_mno(Integer.parseInt(no));
		d2.setMm_email(email);
		d2.setMm_nickname(d1.getNickname());
		d2.setMm_lang(lang);
		d2.setMm_sex(d1.getSex());
		
		dao2.meetingApply(d2);
		
		req.setAttribute("no", no);
		return "meeting/meeting_apply_ok.jsp";
	}
	@RequestMapping("meeting_type.do")
	public String meetingType(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		String lang;
		lang = req.getParameter("lang");
		System.out.println(lang);
		MeetingDAO dao=MeetingDAO.newInstance();
		int count = dao.meetingTypeCount(lang);
		List<MeetingDTO> list=dao.meetingType(lang);
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		req.setAttribute("jsp", "../meeting/meeting_type.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("meeting_place.do")
	public String meetingPlace(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		String place;
		place = req.getParameter("place");
		System.out.println(place);
		MeetingDAO dao=MeetingDAO.newInstance();
		List<MeetingDTO> list=dao.meetingTypePlace(place);
		int count = dao.meetingTypePlaceCount(place);
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		req.setAttribute("jsp", "../meeting/meeting_place.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("detailsearch_ok.do")
	public String detailSearchOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		String m_location;
		m_location = req.getParameter("slocation");
		System.out.println(m_location);
		
		String m_lang1;
		m_lang1 = req.getParameter("slang");
		System.out.println(m_lang1);
		
		String m_place;
		m_place = req.getParameter("splace");
		System.out.println(m_place);
		
		MeetingDTO d = new MeetingDTO();
		d.setM_location(m_place);
		d.setM_place(m_location);
		d.setM_lang1(m_lang1);
		
		MeetingDAO dao=MeetingDAO.newInstance();
		List<MeetingDTO> list=dao.detailSearchForPlace(d);
		int count = dao.detailSearchForPlaceCount(d);
		req.setAttribute("count", count);
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../meeting/meeting_place.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("typedetailsearch_ok.do")
	public String typeDetailSearchOk(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		return "main/main.jsp";
	}
}
