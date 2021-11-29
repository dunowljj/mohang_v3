package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class PageDTO2 {
	private int startPage;
	private int endPage;
	private boolean prev,next;
	
	private int total;
	private Search search;
	
	public PageDTO2(Search search , int total){
		this.search=search;
		this.total=total;
		this.endPage = (int)(Math.ceil(search.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil(((float)total/search.getAmount())));
		
		if ( realEnd < this.endPage){
			this.endPage = realEnd;
		}
		this.prev =search.getPageNum() > 1;
		this.next= search.getPageNum()!= realEnd;
	}
	
}

