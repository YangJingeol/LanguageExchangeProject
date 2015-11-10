package com.custom.dao;

import org.apache.catalina.mapper.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.CreateSqlSessionFactory;
import com.meeting.dao.MeetingMapper;

import javafx.beans.property.MapProperty;

import java.util.*;

public class NoticeDAO {
	private SqlSessionFactory ssf;
	private static NoticeDAO dao;
	private SqlSession session;
	private NoticeMapper mapper;
	
	public NoticeDAO()
    {
    	ssf=CreateSqlSessionFactory.getSsf();
    }
    public static NoticeDAO newInstance()
    {
    	if(dao==null)
    		dao=new NoticeDAO();
    	return dao;
    }
    // 모임 리스트
    public List<NoticeDTO> notice_boardListData(Map map)
    {
    	List<NoticeDTO> list=new ArrayList<NoticeDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		list=mapper.notice_boardListData(map);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return list;
    }
    // 총 페이지
    public int notice_boardRowCount()
    {
    	int count=0;
    	
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		count=mapper.notice_boardRowCount();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return count;
    }
    // 공지 내용
    public NoticeDTO notice_boardContentData(int no)
    {
    	NoticeDTO d=new NoticeDTO();
    	
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		d=mapper.notice_boardContentData(no);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return d;
    }
    //게시물만들기
    public void noticeInsert(NoticeDTO dto){
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		mapper.noticeInsert(dto);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    }
    //공지사항 검색
    public List<NoticeDTO> notice_searchListData(String word){
    	List<NoticeDTO> list=new ArrayList<NoticeDTO>();
    	try
    	{
    		session=ssf.openSession();
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		list=mapper.notice_searchListData(word);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return list;
    }
    //공지사항 검색결과 갯수
    public int notice_searchboardRowCount(String word){
    	int count=0;
    	try
    	{
    		session=ssf.openSession();
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		count=mapper.notice_searchboardRowCount(word);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return count;
    }
    //공지사항 지우기
    public void notice_delete(int nno){
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		mapper.notice_delete(nno);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    }
    //faq 리스트 
    public List<FaqVO> faq_boardListData(Map map)
    {
    	List<FaqVO> list=new ArrayList<FaqVO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		list=mapper.faq_boardListData(map);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return list;
    }
    //faq 전체 갯수
    public int faq_boardRowCount(){
    	int count=0;
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		count=mapper.faq_boardRowCount();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return count;
    }
    
    public void faqInsert(FaqVO fvo){
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		mapper.faqInsert(fvo);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    }
    public List<FaqVO> faq_searchListData(String word){
    	
    	List<FaqVO> vo=new ArrayList<FaqVO>();
    	try
    	{
    		session=ssf.openSession();
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		vo=mapper.faq_searchListData(word);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return vo;
    }
    
    public int faq_searchboardRowCount(String word){
    	int count=0;
    	try
    	{
    		session=ssf.openSession();
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		count=mapper.faq_searchboardRowCount(word);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return count;
    }
    public void faq_delete(int fno){
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
    		mapper.faq_delete(fno);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    }
  //qna
  	public List<M_QnaVO> M_qna_boardListData(Map map){
      	List<M_QnaVO> list=new ArrayList<M_QnaVO>();
      	try
      	{
      		session=ssf.openSession();
      		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
      		list=mapper.M_qna_boardListData(map);
      	}catch(Exception ex)
      	{
      		System.out.println(ex.getMessage());
      	}
      	finally
      	{
      		if(session!=null)
      			session.close();
      	}
      	return list;
      }
  	
  	//qna rowcount
  	public int M_qna_boardRowCount(){
  		int count=0;
      	try
      	{
      		session=ssf.openSession();
      		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
      		count=mapper.M_qna_boardRowCount();
      	}catch(Exception ex)
      	{
      		System.out.println(ex.getMessage());
      	}
      	finally
      	{
      		if(session!=null)
      			session.close();
      	}
      	return count;
  	}

  	//qna boardContentData
  	public M_QnaVO M_qna_boardContentData(int no){
  		M_QnaVO d=new M_QnaVO();
      	try
      	{
      		session=ssf.openSession();
      		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
      		d=mapper.M_qna_boardContentData(no);
      	}catch(Exception ex)
      	{
      		System.out.println(ex.getMessage());
      	}
      	finally
      	{
      		if(session!=null)
      			session.close();
      	}
      	return d;
  	}
  	//qna boardInsert
  	public void M_qna_boardInsert(M_QnaVO vo){
  		try
      	{
      		session=ssf.openSession(true);
      		mapper=(NoticeMapper)session.getMapper(NoticeMapper.class);
      		mapper.M_qna_boardInsert(vo);
      		System.out.println(vo.getQ_title());
      	}catch(Exception ex)
      	{
      		System.out.println(ex.getMessage());
      	}
      	finally
      	{
      		if(session!=null)
      			session.close();
      	}
  	}
    
}
