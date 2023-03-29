package com.myspring.test.board;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int getBoardCount() {
		int result = sqlSession.selectOne("mapper.board.getBoardCount");
		return result;
	}
	
	public int getMaxBoardNo() {
		int maxBoardNo = sqlSession.selectOne("mapper.board.getMaxBoardNo");
		return maxBoardNo;
	}
	
	public int getMaxBoardRef() {
		int maxBoardRef = sqlSession.selectOne("mapper.board.getMaxBoardRef");
		return maxBoardRef;
	}
	
	public void writeBoard(Board board) {
		sqlSession.insert("mapper.board.writeBoard", board);
	}
	
	public List<Board> getAllBoard(){
		List<Board> boardList = sqlSession.selectList("mapper.board.getAllBoard");
		return boardList;
	}
	
	public Board getOneBoard(int boardNo) {
		Board board = sqlSession.selectOne("mapper.board.getOneBoard", boardNo);
		return board;
	}
	
	public List<Board> getBoardListForType(ArrayList<Integer> list){
		List<Board> boardList = sqlSession.selectList("mapper.board.getBoardListForType", list);
		return boardList;
	}
	
}
