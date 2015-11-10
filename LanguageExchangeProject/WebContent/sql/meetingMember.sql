CREATE TABLE meetingMember(
  mm_no NUMBER,
  mm_mno NUMBER CONSTRAINT mm_nn_mno NOT NULL,
  mm_email VARCHAR2(100) CONSTRAINT mm_nn_email NOT NULL,
  mm_nickname VARCHAR2(100) CONSTRAINT mm_nn_nickname NOT NULL,
  mm_lang VARCHAR2(100) CONSTRAINT mm_nn_lang NOT NULL,
  mm_sex CHAR(6) CONSTRAINT mm_nn_sex NOT NULL,
  CONSTRAINT mm_pk_no PRIMARY KEY(mm_no),
  CONSTRAINT mm_fk_mno FOREIGN KEY (mm_mno) REFERENCES meeting(m_no),
  CONSTRAINT mm_fk_email FOREIGN KEY (mm_email) REFERENCES Lmember(email)
);

INSERT INTO meetingMember (mm_no,mm_mno,mm_email,mm_nickname,mm_lang,mm_sex) VALUES((SELECT NVL(MAX(mm_no)+1,1) FROM meetingMember),
'3','488654@naver.com','joo','영어','여자');

INSERT INTO meetingMember (mm_no,mm_mno,mm_email,mm_nickname,mm_lang,mm_sex) VALUES((SELECT NVL(MAX(mm_no)+1,1) FROM meetingMember),
'4','488654@naver.com','joo','영어','여자');
COMMIT;
