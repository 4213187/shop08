package com.neuedu.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisUtil {
    private static SqlSession session = null;

    private MyBatisUtil() {
    }

    public static SqlSession getSession() {
        String resource = "mybatis-config.xml";
        InputStream inputStream;

        try {
            inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            session = sqlSessionFactory.openSession();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return session;
    }

    public static void sessionCommit( SqlSession sqlSession) {
        if (sqlSession != null) {
            System.out.println("进来了");
            try {
                sqlSession.commit();
            } catch (Exception e) {
                System.out.println("事务发生了回滚");
                sqlSession.rollback();
            }
        }

    }
}
