package com.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.CreateSqlSessionFactory;
import com.meeting.dao.MeetingDTO;

public class MemberDAO {
	private SqlSessionFactory ssf;
	private static MemberDAO dao;
	private SqlSession session;
	private MemberMapper mapper;
	
	public MemberDAO()
    {
    	ssf=CreateSqlSessionFactory.getSsf();
    }
    public static MemberDAO newInstance()
    {
    	if(dao==null)
    		dao=new MemberDAO();
    	return dao;
    }
    // 로그인
    public int memberIdCount(String email)
    {
    	int count=0;
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MemberMapper)session.getMapper(MemberMapper.class);
    		count=mapper.memberIdCount(email);
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
    public MemberDTO memberGetInfo(String email)
    {
    	MemberDTO d=new MemberDTO();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MemberMapper)session.getMapper(MemberMapper.class);
    		d=mapper.memberGetInfo(email);
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
    // 회원가입
    public void memberInsert(MemberDTO d)
    {
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MemberMapper)session.getMapper(MemberMapper.class);
    		mapper.memberInsert(d);
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
    // 회원정보 수정
    public void modifyUpdate(MemberDTO d)
    {
    	try
    	{
    		session=ssf.openSession(true);
    		mapper=(MemberMapper)session.getMapper(MemberMapper.class);
    		mapper.modifyUpdate(d);
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
    // 모임 개설자 정보
    public MemberDTO meetingOpenerData(String email)
    {
    	MemberDTO d=new MemberDTO();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MemberMapper)session.getMapper(MemberMapper.class);
    		d=mapper.meetingOpenerData(email);
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
    // 모임 참여자 정보 가져오기
    public MemberDTO meetingMemberData(String email)
    {
MemberDTO d=new MemberDTO();
    	
    	try
    	{
    		session=ssf.openSession();
    		mapper=(MemberMapper)session.getMapper(MemberMapper.class);
    		d=mapper.meetingMemberData(email);
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
}
