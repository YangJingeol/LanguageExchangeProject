package com.qna.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.CreateSqlSessionFactory;
import com.meeting.dao.MeetingMapper;

public class QnaDAO {
	private SqlSessionFactory ssf;
	private static QnaDAO dao;
	private SqlSession session;
	private QnaMapper mapper;

	public QnaDAO() {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static QnaDAO newInstance() {
		if (dao == null)
			dao = new QnaDAO();
		return dao;
	}

	// QNA 확인
	public int qnaCheck(int bno) {
		int count = 0;
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			count = mapper.qnaCheck(bno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	// QNA list
	public List<q_dto> qnaList(int bno) {
		List<q_dto> list = new ArrayList<q_dto>();
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			list = mapper.qnaList(bno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// QNA 비밀번호 체크
	public String qnaPwCheck(int rno) {
		String pw = "";
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			pw = mapper.qnaPwCheck(rno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return pw;
	}

	// 질문가져오기
	public String contOut(int rno) {
		String cont = "";
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			cont = mapper.contOut(rno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return cont;
	}

	// QNA 등록
	public void qnaInput(q_dto d) {

		try {
			session = ssf.openSession(true);
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			mapper.qnaInput(d);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// QNA 내용
	public q_dto qnaGetData(int no) {
		q_dto dto = new q_dto();
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			dto = mapper.qnaGetData(no);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return dto;
	}

	// QNA 답변 작성
	public void ansInsert(a_dto d) {
		try {
			session = ssf.openSession(true);
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			mapper.ansInsert(d);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// 답변 체크업데이트
	public void ansChupdate(int no) {
		try {
			session = ssf.openSession(true);
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			mapper.ansChupdate(no);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// 답변확인
	public String ansCh(int no) {
		String ans_ch = "";
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			ans_ch = mapper.ansCh(no);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return ans_ch;
	}

	// 답변 내용
	public String ansContOut(int no) {
		String cont = "";
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			cont = mapper.ansContOut(no);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return cont;
	}

	// 상세페이지 공지사항 작성
	public void ntcInsert(ntc_dto d) {
		try {
			session = ssf.openSession(true);
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			mapper.ntcInsert(d);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// 상세페이지 공지사항 리스트
	public List<ntc_dto> ntcListData(int bno) {
		List<ntc_dto> list = new ArrayList<ntc_dto>();
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			list = mapper.ntcListData(bno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 상세페이지 공지사항 숫자
	public int ntcCh(int bno) {
		int count = 0;
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			count = mapper.ntcCh(bno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	// 상세페이지 후기 작성
	public void cmInsert(cm_dto d) {
		try {
			session = ssf.openSession(true);
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			mapper.cmInsert(d);
			;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// 상세페이지 후기 리스트
	public List<cm_dto> cmListData(int bno) {
		List<cm_dto> list = new ArrayList<cm_dto>();
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			list = mapper.cmListData(bno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;

	}

	// 상세페이지 후기 숫자
	public int cmCount(int bno) {
		int count = 0;
		try {
			session = ssf.openSession();
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			count = mapper.cmCount(bno);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	// 상세페이지 후기 삭제
	public void cmDelete(int no) {
		try {
			session = ssf.openSession(true);
			mapper = (QnaMapper) session.getMapper(QnaMapper.class);
			mapper.cmDelete(no);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}
}
