package com.mybatis.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisManager {
	public static SqlSessionFactory sqlSessionFactory;
	static {
		String resource = "com/mybatis/config/Configuration.xml";
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("sqlsessionFactory객체생성!");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
	
}




