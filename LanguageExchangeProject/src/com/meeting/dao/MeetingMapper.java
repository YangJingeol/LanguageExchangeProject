package com.meeting.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface MeetingMapper {
	// 모임 개설
	@SelectKey(keyProperty="m_no",before=true,resultType=int.class,
			statement="SELECT NVL(MAX(m_no)+1,1) as m_no FROM meeting")
	@Insert("INSERT INTO meeting VALUES(#{m_no},#{m_lang1},#{m_lang2},#{m_lang1num},#{m_lang2num},"
			+"#{m_title},#{m_summary},#{m_content},#{m_meetingDate1},#{m_meetingDate2},"
			+"#{m_partDate1},#{m_partDate2},#{m_place},#{m_location},#{m_email},#{m_nickname},#{m_tel},0,0,#{m_filename},#{m_filesize})")
	public void meetingInsert(MeetingDTO d);
	// 모임 내용
	@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,"
			+"m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_location,m_email,m_nickname,m_tel,m_filename "
			+"FROM meeting WHERE m_no=#{m_no}")
	public MeetingDTO meetingDetail(int m_no);
	// 모임 리스트
	@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,"
			+"m_meetingDate1,m_partDate1,m_place,m_location,m_email,m_tel,m_end "
			+"FROM meeting ORDER BY m_no DESC")
	public List<MeetingDTO> meetingTableListData();
	@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,"
			+ "m_meetingDate1,m_partDate1,m_place,m_location,m_email,m_tel,m_end "
			+ "FROM meeting ORDER BY m_wish DESC")
	public List<MeetingDTO> meetingTableListData2();
	// 내 모임 리스트
	@Select("SELECT m_title,m_partdate1,m_end,m_no,Rownum as mu_no "
			+ "FROM meeting,meetingMember WHERE meetingMember.mm_email=#{mm_email} AND meetingMember.mm_no=meeting.m_no ORDER BY mu_no DESC")
	public List<MeetingDTO> myMeetingData(String email);
	@Select("SELECT COUNT(*) FROM meetingMember WHERE mm_email=#{mm_email}")
	public int myMeetingCount(String email);
	// 모임 검색
	@Select("SELECT m_no,m_email,m_title,m_partdate2 FROM meeting WHERE lang1 LIKE '%'||#{word}||'%' OR lang2 LIKE '%'||#{word}||'%' ORDER BY g_no DESC")
	public List<MeetingDTO> searchMeeting(String word);
	// 모임 찜
	@SelectKey(keyProperty="w_no",before=true,resultType=int.class,
			statement="SELECT NVL(MAX(w_no)+1,1) as w_no FROM wish")
	@Insert("INSERT INTO wish VALUES(#{w_no},#{w_mno},#{w_email})")
	public void meetingWish(WishDTO d);
	@Update("UPDATE meeting SET m_wish=m_wish+1 WHERE m_no=#{m_no}")
	public void meetingWishAdd(int mno);
	@Update("UPDATE meeting SET m_wish=m_wish-1 WHERE m_no=#{m_no}")
	public void meetingWishMinus(int mno);
	@Delete("DELETE FROM wish WHERE w_mno=#{w_mno} AND w_email=#{w_email}")
	public void myWishDel(WishDTO d);
    @Select("SELECT m_MeetingDate1,m_partDate2,m_Lang1,m_Lang2,m_Summary,m_title,m_content,m_no "
    		+ "FROM wish,meeting WHERE w_email=#{w_email} AND m_no=w_mno")
    public List<MeetingDTO> myWishList(String email);
    @Select("SELECT COUNT(*) FROM wish WHERE w_email=#{w_email}")
    public int myWishCount(String email);
	// 모임 참여
	@SelectKey(keyProperty="mm_no",before=true,resultType=int.class,
			statement="SELECT NVL(MAX(mm_no)+1,1) as mm_no FROM meetingMember")
	@Insert("INSERT INTO meetingMember VALUES(#{mm_no},#{mm_mno},#{mm_email},#{mm_nickname},#{mm_lang},#{mm_sex})")
	public void meetingApply(MeetingMemberDTO d);
	// 모임 참가자 리스트
	@Select("SELECT mm_email,mm_nickname,mm_lang,mm_sex FROM meetingMember WHERE mm_mno=#{mm_mno} ORDER BY mm_no DESC")
	public List<MeetingMemberDTO> meetingMemberData(int mm_mno);
	// 모임 언어별 목록
	@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM meeting WHERE m_lang1 LIKE '%'||#{lang}||'%' ORDER BY m_no DESC")
	public List<MeetingDTO> meetingType(String lang);
	@Select("SELECT COUNT(*) FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM meeting WHERE m_lang1 LIKE '%'||#{lang}||'%' ORDER BY m_no DESC)")
	public int meetingTypeCount(String lang);
	// 모임 지역별 목록
	@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM meeting WHERE m_place LIKE '%'||#{place}||'%' ORDER BY m_no DESC")
	public List<MeetingDTO> meetingTypePlace(String place);
	@Select("SELECT COUNT(*) FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM meeting WHERE m_place LIKE '%'||#{place}||'%' ORDER BY m_no DESC)")
	public int meetingTypePlaceCount(String place);
	// 모임 검색
	@Select("SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM meeting WHERE m_location LIKE '%'||#{m_location}||'%') WHERE m_place LIKE '%'||#{m_place}||'%') WHERE m_lang1 LIKE '%'||#{m_lang1}||'%' ORDER BY m_no DESC")
	public List<MeetingDTO> detailSearchForPlace(MeetingDTO d);
	@Select("SELECT COUNT(*) FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM (SELECT m_no,m_lang1,m_lang2,m_lang1num,m_lang2num,m_title,m_summary,m_content,m_meetingDate1,m_meetingDate2,m_partDate1,m_partDate2,m_place,m_location,m_email,m_tel,m_end,m_wish "
			+ "FROM meeting WHERE m_location LIKE '%'||#{m_location}||'%') WHERE m_place LIKE '%'||#{m_place}||'%') WHERE m_lang1 LIKE '%'||#{m_lang1}||'%' OR m_lang2 LIKE '%'||#{m_lang1}||'%' ORDER BY m_no DESC)")
	public int detailSearchForPlaceCount(MeetingDTO d);
}
