package com.meeting.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.CreateSqlSessionFactory;
import com.member.dao.MemberMapper;

import java.util.*;
public class MeetingDAO {
	private SqlSessionFactory ssf;
	private static MeetingDAO dao;
	private SqlSession session;
	private MeetingMapper mapper;
	
	public MeetingDAO()
    {
    	ssf=CreateSqlSessionFactory.getSsf();
    }
    public static MeetingDAO newInstance()
    {
    	if(dao==null)
    		dao=new MeetingDAO();
    	return dao;
    }
    // 모임 개설
    public void meetingInsert(MeetingDTO d){
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		mapper.meetingInsert(d);
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
    // 모임 내용
    public MeetingDTO meetingDetail(int mno){
    	MeetingDTO d=new MeetingDTO();
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		d=mapper.meetingDetail(mno);
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
 // 모임 리스트
    public List<MeetingDTO> meetingTableListData()
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.meetingTableListData();
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
    public List<MeetingDTO> meetingTableListData2()
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.meetingTableListData2();
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
    // 내 모임 목록
    public List<MeetingDTO> myMeetingData(String email)
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.myMeetingData(email);
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
    // 내 모임 숫자
    public int myMeetingCount(String email)
    {
    	int count=0;
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		count=mapper.myMeetingCount(email);
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
    // 모임 검색
    public List<MeetingDTO> searchMeeting(String word)
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.searchMeeting(word);
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
    // 모임 찜
    public void meetingWish(WishDTO dto) {
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		mapper.meetingWish(dto);
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
    public void meetingWishAdd(int mno)
    {
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		mapper.meetingWishAdd(mno);
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
    	
    // 모임 참여
    public void meetingApply(MeetingMemberDTO d)
    {
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		mapper.meetingApply(d);
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
    public void meetingWishMinus(int mno)
	{
		try
    	{
    		session=ssf.openSession(true);
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		mapper.meetingWishMinus(mno);
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
    public void myWishDel(WishDTO d)
    {
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		mapper.myWishDel(d);
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
    public List<MeetingDTO> myWishList(String email)
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.myWishList(email);
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
    public int myWishCount(String email)
    {
    	int count=0;
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		count=mapper.myWishCount(email);
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
    // 모임 참가자 리스트
    public List<MeetingMemberDTO> meetingMemberData(int mm_mno)
    {
    		List<MeetingMemberDTO> list=new ArrayList<MeetingMemberDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.meetingMemberData(mm_mno);
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
    // 모임 언어별 목록
    public List<MeetingDTO> meetingType(String lang)
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.meetingType(lang);
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
    public int meetingTypeCount(String lang)
    {
    	int count=0;
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		count=mapper.meetingTypeCount(lang);
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
    // 모임 지역별 목록
    public List<MeetingDTO> meetingTypePlace(String place)
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.meetingTypePlace(place);
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
    public int meetingTypePlaceCount(String place)
    {
    	int count=0;
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		count=mapper.meetingTypePlaceCount(place);
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
    // 모임 검색
    public List<MeetingDTO> detailSearchForPlace(MeetingDTO d)
    {
    	List<MeetingDTO> list=new ArrayList<MeetingDTO>();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		list=mapper.detailSearchForPlace(d);
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
    public int detailSearchForPlaceCount(MeetingDTO d)
    {
    	int count=0;
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MeetingMapper)session.getMapper(MeetingMapper.class);
    		count=mapper.detailSearchForPlaceCount(d);
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
}
