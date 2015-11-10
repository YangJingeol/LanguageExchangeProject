package com.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.meeting.dao.*;

import java.util.*;

public interface MemberMapper {
	// 로그인
	@Select("SELECT COUNT(*) FROM lmember WHERE email=#{email}")
	public int memberIdCount(String email);
	@Select("SELECT email,pwd,nickname,name,nation,tel,lang,language,pname,admin,intro,sex FROM lmember WHERE email=#{email}")
	public MemberDTO memberGetInfo(String email);
	// 회원가입
	@Insert("INSERT INTO Lmember VALUES(#{email},#{pwd},#{name},#{nickname},#{sex},#{age},#{nation},#{tel},#{lang},#{language},#{intro},#{pname},#{psize},#{admin}")
	public void memberInsert(MemberDTO d);
	// 회원정보 수정
	@Update("UPDATE lmember SET pwd=#{pwd},nickname=#{nickname},tel=#{tel},lang=#{lang},intro=#{intro} WHERE email=#{email}")
	public void modifyUpdate(MemberDTO d);
	// 모임 개설자 정보
	@Select("SELECT email,nickname,tel FROM Lmember WHERE email=#{email}")
	public MemberDTO meetingOpenerData(String email);
	// 모임 참여자 정보 가져오기
	@Select("SELECT email,nickname,sex FROM Lmember WHERE email=#{email}")
	public MemberDTO meetingMemberData(String email);
	
	//@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish FROM meeting WHERE m_lang1 LIKE '%'||#{lang}||'%' ORDER BY m_no DESC")
}
