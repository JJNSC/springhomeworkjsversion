package com.mycompany.springwebapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.springwebapp.dto.Ch13Board;
import com.mycompany.springwebapp.dto.Ch13Pager;

@Mapper
public interface Ch13BoardDao {
	//board.xml 을 참고하면서 보자
	
	//매개변수 : parameterType 에 주는거
	//리턴값 : 실제 반영된 행수 => int 
	public int insert(Ch13Board board);//추상 메소드 선언
	//리턴값 : 실제 반영된 행들 => List<Ch13Board>
	public List<Ch13Board> selectByPage(Ch13Pager pager);//메소드 이름 : id 와 동일하게.
	//리턴값 : 실제 반영된 행 => selectAll
	public Ch13Board selectByBno(int bno);
	public int updateByBno(Ch13Board board);
	public int deleteByBno(int bno);
	public int count();
}
