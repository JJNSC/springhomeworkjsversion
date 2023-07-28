package com.mycompany.springwebapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor //알규먼트 다들어있는거
@NoArgsConstructor  //기본생성자 만들어짐(알규먼트없는거)
public class Ch11City {
	private int code;
	private String label;
}
