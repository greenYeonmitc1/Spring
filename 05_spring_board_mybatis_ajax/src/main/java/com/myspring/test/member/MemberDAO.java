package com.myspring.test.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlsession;
	

	public int checkMember(Member member) {

		int check = sqlsession.selectOne("mapper.member.checkMember", member);
		return check;
	}
	
	public int checkId(String id) {

		int check = sqlsession.selectOne("mapper.member.checkId", id);
		return check;
	}
	
	public void joinMember(Member member) {
		sqlsession.insert("mapper.member.joinMember", member);
	}
}
