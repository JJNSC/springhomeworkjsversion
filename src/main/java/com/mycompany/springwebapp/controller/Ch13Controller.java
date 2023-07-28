package com.mycompany.springwebapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springwebapp.dto.Ch13Board;
import com.mycompany.springwebapp.dto.Ch13Pager;
import com.mycompany.springwebapp.service.Ch13BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch13")
public class Ch13Controller {
	
	/*@Resource
	private Ch13BoardDaoOldImpl boardDaoOld;
	
	@Autowired //resource 도 사용가능
	private Ch13BoardDao boardDao; //인터페이스인데 구현객체가 없다. -> mybatis 가 자동으로 생성한 구현객체라는 뜻
*/	
	
	@Resource
	private Ch13BoardService boardService;//Controller은 Service를 사용한다.
	
   @RequestMapping("/content")
   public String content(HttpSession session) {
	  log.info("실행");
      return "ch13/content";
   } 
   
   @GetMapping("/insertBoard")
   public String insertBoard() {
	   log.info("실행");
	   
	   Ch13Board board = new Ch13Board();
	   board.setBtitle("오늘은 금요일");
	   board.setBcontent("연봉 1000000000억받아서 1년만 일하고 파이어족 가즈아.");
	   board.setMid("user");
	   
	   /*boardDaoOld.insert(board);*/
	   //boardDao.insert(board);
	   
	   boardService.write(board);
	   
	   //실제로 저장된 bno : 바로 board 에서 받아올수있다. 위에서 insert를 먼저 실행해야지 얻을수있다!
	   log.info("저장된 bno: "+ board.getBno()); 
   
	   return "redirect:/ch13/content";
   }
   
   @GetMapping("/getBoardList")
   public String getBoardList() {
	   //int totalRows = boardDao.count();//전체 게시물 수
	   int totalBoardNum = boardService.getTotalBoardNum();
	   Ch13Pager pager = new Ch13Pager(10,5,totalBoardNum,3);
	   
	  /* List<Ch13Board> list = boardDaoOld.selectAll(pager);*/
	   //List<Ch13Board> list = boardDao.selectByPage(pager); 
	   List<Ch13Board> list = boardService.getList(pager); 
	   log.info(list.toString());
	   return "redirect:/ch13/content";
   }
   
   @GetMapping("/updateBoard")
   public String updateBoard() {
	   //Ch13Board board = boardDaoOld.selectByBno(1);
	   //Ch13Board board = boardDao.selectByBno(27);
	   Ch13Board board = boardService.getBoard(1);
	   board.setBtitle("하하");
	   board.setBcontent("업데이트 내용");
	   
	   boardService.modify(board);
	   return "redirect:/ch13/content";
   }
   
   @GetMapping("/deleteBoard")
   public String deleteBoard(int bno) {
	  // boardDaoOld.deleteByBno(bno);
	  // boardDao.deleteByBno(bno);
	   boardService.remove(bno);
	   return "redirect:/ch13/content";
   }
   
   
}