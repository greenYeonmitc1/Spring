package com.myspring.test.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	
	@Autowired
	BoardDAO boardDAO;
	
	@ModelAttribute("cp")
	public String getContextPath(Model model , HttpServletRequest request) {		
		model.addAttribute("cp", request.getContextPath());	
		return request.getContextPath();
	}
	
	@RequestMapping(value = "/board/index")
	public String index(Model model) {
		int count = boardDAO.getBoardCount();
		ArrayList<Board> boardList = (ArrayList<Board>)boardDAO.getAllBoard();
		model.addAttribute("count", count);
		model.addAttribute("boardList", boardList);
		return "board/index";
	}
	
	@RequestMapping(value = "/board/write")
	public String write(Model model) {
		int maxNum = boardDAO.getMaxBoardNo();
		model.addAttribute("maxNum", maxNum + 1);
		return "board/write";
	}
	
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String writePro(Board board, HttpSession session) {
		String writer = board.getWriter(); 
		if(writer == null) {
			writer = (String)session.getAttribute("log");
			board.setWriter(writer);
		}
		int maxBoardRef = boardDAO.getMaxBoardRef();
		board.setRef(maxBoardRef + 1);
		boardDAO.writeBoard(board);
		return "redirect:/board/index";
	}
	
	@RequestMapping(value = "/board/content")
	public String getOneBoard(int boardNo, Model model) {
		Board board = boardDAO.getOneBoard(boardNo);
		model.addAttribute("board", board);
		return "board/content";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/getBoardListForType")
	public ArrayList<Board> getBoardListForType(@RequestParam (value="checkList[]") List<String> checkList, Model model) {
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		for(String check : checkList) {
			list.add(Integer.parseInt(check));
		}
		
		ArrayList<Board> boardList = null;
	
		if(list.size() == 1 && list.get(0) == 0 || checkList.size()==0 ) {
			boardList = (ArrayList<Board>)boardDAO.getAllBoard();
		} else {
			boardList = (ArrayList<Board>)boardDAO.getBoardListForType(list);
		}
		
		for(Board board : boardList) {
			System.out.println(board.getTitle());
		}
		
		model.addAttribute("boardList", boardList);
		
		return boardList;
	}
	
}





