package com.qna.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import java.util.*;
public interface QnaMapper {
	// QNA 확인
	@Select("SELECT COUNT(*) FROM Q_TABLE WHERE b_no=#{no}")
	public int qnaCheck(int bno);
	// QNA list
	@Results({
		@Result(property="no",column="qa_no"),
		@Result(property="b_no",column="b_no"),
		@Result(property="regdate", column="qa_regdate"),
		@Result(property="q_id", column="qa_id"),
		@Result(property="cont", column="qa_cont"),
		@Result(property="subject", column="qa_subject"),
		@Result(property="secret", column="qa_secret"),
		@Result(property="ans_ch", column="ans_check"),
		@Result(property="a_vo.no", column="ans_no"),
		@Result(property="a_vo.cont", column="ans_cont")
	})
	@Select("SELECT q.no as qa_no,q.b_no as b_no,q.regdate as qa_regdate,q.q_id as qa_id,q.cont as qa_cont,"
			+ "q.subject as qa_subject,q.secret as qa_secret,q.ans_ch as ans_check,a.no as ans_no,a.cont as ans_cont "
			+ "FROM Q_TABLE q, A_TABLE a "
			+ "WHERE q.b_no=#{b_no} AND q.no=a.no(+) ORDER BY q.no DESC")
	public List<q_dto> qnaList(int bno);
	// QNA 비밀번호 체크
	@Select("SELECT pw FROM Q_TABLE WHERE NO=#{rno}")
	public String qnaPwCheck(int rno);
	// 질문
	@Select("SELECT cont FROM Q_TABLE WHERE NO=#{rno}")
	public String contOut(int rno);
	// QNA 등록
	@SelectKey(keyProperty="no",before=true,resultType=int.class,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM Q_TABLE")
	@Insert("INSERT INTO Q_TABLE VALUES(#{no},#{b_no},#{q_id},#{subject},#{cont},SYSDATE,#{secret},#{pw},DEFAULT)")
	public void qnaInput(q_dto d);
	// QNA 내용
	@Select("SELECT NO,Q_ID,SUBJECT,CONT,REGDATE,SECRET FROM Q_TABLE WHERE NO=#{no}")
	public q_dto qnaGetData(int no);
	// QNA 답변 작성
	@Insert("INSERT INTO A_TABLE VALUES(#{no},#{a_id},#{cont},SYSDATE)")
	public void ansInsert(a_dto d);
	// 답변 업데이트
	@Update("UPDATE Q_TABLE SET ANS_CH='Y' WHERE NO=#{no}")
	public void ansChupdate(int no);
	//답변 확인
	@Select("SELECT ANS_CH FROM Q_TABLE WHERE NO=#{no} ")
	public String ansCh(int no);
	// 답변 내용
	@Select("SELECT CONT FROM A_TABLE WHERE NO=#{no}")
	public String ansContOut(int no);
	// 상세페이지 공지사항 작성
	@SelectKey(keyProperty="no",before=true,resultType=int.class,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM NTC_TABLE")
	@Insert("INSERT INTO NTC_TABLE VALUES(#{no},#{b_no},#{ntc_id},#{ntc_sub},#{ntc_cont},SYSDATE)")
	public void ntcInsert(ntc_dto d);
	// 상세페이지 공지사항 리스트
	@Select("SELECT * FROM NTC_TABLE WHERE B_NO=#{b_no} ORDER BY NO DESC")
	public List<ntc_dto> ntcListData(int bno);
	// 상세페이지 공지사항 숫자
	@Select("SELECT COUNT(*) FROM NTC_TABLE WHERE B_NO=#{b_no}")
	public int ntcCh(int bno);
	// 상세페이지 후기 작성
	@SelectKey(keyProperty="no",before=true,resultType=int.class,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM CM_TABLE")
	@Insert("INSERT INTO CM_TABLE VALUES(#{no},#{b_no},#{id},#{cmt},SYSDATE)")
	public void cmInsert(cm_dto d);
	// 상세페이지 후기 리스트
	@Select("SELECT * FROM CM_TABLE WHERE B_NO=#{b_no} ORDER BY NO ASC")
	public List<cm_dto> cmListData(int bno);
	// 상세페이지 후기 숫자
	@Select("SELECT COUNT(*) FROM CM_TABLE WHERE B_NO=#{b_no}")
	public int cmCount(int bno);
	// 상세페이지 후기 삭제
	@Delete("DELETE FROM CM_TABLE WHERE NO=#{no}")
	public void cmDelete(int no);
}
