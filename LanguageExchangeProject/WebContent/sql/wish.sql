DROP TABLE wish;
CREATE TABLE wish(
w_no NUMBER CONSTRAINT wish_nn_wno NOT NULL,
w_mno NUMBER CONSTRAINT wish_nn_wmno NOT NULL,
w_email VARCHAR2(30) CONSTRAINT wish_nn_wemail NOT NULL,
CONSTRAINT wish_pk_wno PRIMARY KEY(w_no),
CONSTRAINT wish_fk_mno FOREIGN KEY(w_mno) REFERENCES meeting(m_no)
);

