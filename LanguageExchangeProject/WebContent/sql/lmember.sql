DROP TABLE Lmember CASCADE CONSTRAINT;
CREATE TABLE Lmember(
   email VARCHAR2(30) CONSTRAINT Lmember_nn_email NOT NULL,
   pwd VARCHAR2(10) CONSTRAINT Lmember_nn_pwd NOT NULL,
   name VARCHAR2(34) CONSTRAINT Lmember_nn_name NOT NULL,
   nickname VARCHAR2(34) CONSTRAINT Lmember_nn_nickname NOT NULL,
   sex CHAR(6),
   age NUMBER,
        nation VARCHAR2(80) CONSTRAINT Lmember_nn_nation NOT NULL,
   tel VARCHAR2(20) CONSTRAINT Lmember_nn_tel NOT NULL,
   lang VARCHAR2(20) CONSTRAINT Lmember_nn_lang NOT NULL,
   language VARCHAR2(20) CONSTRAINT Lmember_nn_language NOT NULL,   
   intro CLOB,
   pname VARCHAR2(80),
   Psize VARCHAR2(60),
        admin VARCHAR(20)DEFAULT 'n',
   CONSTRAINT Lmember_pk_email PRIMARY KEY(email),
   CONSTRAINT Lmember_ck_sex CHECK(sex IN('남자','여자'))        
);
*/


INSERT INTO Lmember VALUES('488654@naver.com','1234','승주','주주','여자','24','한국','111-1111-11111','한국어','영어','안녕하세용요요용','jjjdd','123','y');
COMMIT;