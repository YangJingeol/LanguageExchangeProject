package com.custom.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import java.util.*;
public interface NoticeMapper {
	// 공지 리스트
	@Select("SELECT n_No,n_Title,n_Content,n_Hit,n_Regdate,num "
			+ "FROM (SELECT n_No,n_Title,n_Content,n_Hit,n_Regdate,rownum as num "
			+ "FROM (SELECT n_No,n_Title,n_Content,n_Hit,n_Regdate "
			+ "FROM notice_Board ORDER BY n_No DESC))"
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeDTO> notice_boardListData(Map map);
	// 총페이지
	@Select("SELECT COUNT(*) FROM notice_Board")
	public int notice_boardRowCount();
	// 공지 내용
	@Select("SELECT n_No,n_Title,n_Content,n_Regdate,n_Hit FROM notice_Board WHERE n_No=#{no}")
	public NoticeDTO notice_boardContentData(int no);
	//공지추가
	@Insert("INSERT INTO notice_Board(n_No,n_Title,n_Content,n_Hit,n_Regdate) VALUES((SELECT NVL(MAX(n_No)+1,1) FROM notice_Board),#{n_Title},#{n_Content},0,SYSDATE)")
	public void noticeInsert(NoticeDTO dto);
	
	//공지사항 검색
	@Select("SELECT n_No,n_Title,n_Content,n_Hit,n_Regdate,n_rownum FROM (SELECT n_No,n_Title,n_Content,n_Hit,n_Regdate,rownum as n_rownum FROM notice_Board WHERE n_title LIKE '%'||#{word}||'%' ORDER BY n_No DESC) ORDER BY n_rownum DESC")
	public List<NoticeDTO> notice_searchListData(String word);
	
	//공지사항 게시물 검색 갯수
	@Select("SELECT COUNT(*) FROM notice_Board  WHERE n_title LIKE '%'||#{word}||'%'")
	public int notice_searchboardRowCount(String word);
	
	//공지사항 지우기
	@Delete("DELETE FROM notice_Board WHERE n_No=#{nno}")
	public void notice_delete(int nno);
	
	//faq 리스트
	@Select("SELECT f_no,f_title,f_content,f_regdate,f_hit,f_rownum "
			+"FROM (SELECT f_no,f_title,f_content,f_regdate,f_hit,rownum as f_rownum "
			+"FROM (SELECT f_no,f_title,f_content,f_regdate,f_hit FROM faq ORDER BY f_no DESC)) WHERE f_rownum BETWEEN #{start} AND #{end}")
	public List<FaqVO> faq_boardListData(Map map);
	
	//faq리스트 갯수
	@Select("SELECT COUNT(*) FROM faq")
	public int faq_boardRowCount();
	
	//faq 추가
	@Insert("INSERT INTO faq(f_No,f_Title,f_Content,f_Regdate,f_mail,f_hit) VALUES((SELECT NVL(MAX(f_no)+1,1) FROM faq),#{f_title},#{f_content},SYSDATE,'admin',0)")
	public void faqInsert(FaqVO faq);
	//faq검색 
	@Select("SELECT f_no,f_title,f_content,f_regdate,f_hit,f_rownum FROM (SELECT f_no,f_title,f_content,f_regdate,f_hit,rownum as f_rownum FROM  faq WHERE f_title LIKE '%'||#{word}||'%' OR f_content LIKE '%'||#{word}||'%' ORDER BY f_no DESC) ORDER BY f_rownum DESC")
	public List<FaqVO> faq_searchListData(String word);
	
	//faq 게시물 검색 갯수
	@Select("SELECT COUNT(*) FROM faq WHERE f_title LIKE '%'||#{word}||'%'")
	public int faq_searchboardRowCount(String word);
	
	//faq지우기
	@Delete("DELETE FROM faq WHERE f_no=#{fno}")
	public void faq_delete(int fno);
	//qna List
	@Select("SELECT q_No,q_Title,q_mail,q_Regdate,q_pwd,q_hit,depth,num "
			+ "FROM (SELECT q_No,q_Title,q_mail,q_Regdate,q_pwd,q_hit,depth,rownum as num "
			+ "FROM (SELECT q_No,q_Title,q_mail,q_Regdate,q_pwd,q_hit,depth "
			+ "FROM qna ORDER BY q_no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<M_QnaVO> M_qna_boardListData(Map map);
	
	//qna rowcount
	@Select("SELECT COUNT(*) FROM qna")
	public int M_qna_boardRowCount();

	//qna boardContentData
	@Select("SELECT q_no,q_title,q_content,q_regdate,q_regdate,q_mail,q_pwd,q_hit,q_answer,depth,rownum FROM qna WHERE q_No=#{no}")
	public M_QnaVO M_qna_boardContentData(int no);
	
	@Insert("INSERT INTO qna(q_No,q_Title,q_Content,q_Regdate,q_Mail) VALUES((SELECT NVL(MAX(q_no)+1,1) FROM qna),#{q_title},#{q_content},SYSDATE,#{q_Mail})")
	public void M_qna_boardInsert(M_QnaVO vo);
	
	  
	
}
