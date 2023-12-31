package com.mycompany.springwebapp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.springwebapp.dto.Ch13Board;
import com.mycompany.springwebapp.dto.Ch13Pager;

@Repository
public interface Ch13BoardDaoOld {
	
	public int insert(Ch13Board board);
	
	public List<Ch13Board> selectAll(Ch13Pager pager);
	
	public Ch13Board selectByBno(int bno);
	
	public int updateByBno(Ch13Board board);
	
	public void deleteByBno(int bno);
	
	public int count();
}
