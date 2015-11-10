package com.common;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class CreateSqlSessionFactory {
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			Class[] mapper={com.member.dao.MemberMapper.class,
					com.meeting.dao.MeetingMapper.class,
					com.custom.dao.NoticeMapper.class,
					com.qna.dao.QnaMapper.class};
			for(Class m:mapper)
			{
				ssf.getConfiguration().addMapper(m);
			}
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	public static SqlSessionFactory getSsf() {
		return ssf;
	}
	
}
