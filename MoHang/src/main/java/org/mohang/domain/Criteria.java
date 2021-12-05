package org.mohang.domain;

import lombok.Data;

@Data
public class Criteria { 
	private int pageNum; //현재페이지를 나타낸다  
 	private int amount; //한페이지당 글 갯수  
	
 	private String keyword;
	public Criteria(){ 
		this(1,5); 
	 } 
 
	public Criteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
	}
}
