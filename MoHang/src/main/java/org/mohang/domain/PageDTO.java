package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total){
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd  = (int)(Math.ceil((float)(total)/cri.getAmount()));
		
		if(realEnd < this.endPage){
			this.endPage = realEnd;
		}
		
		this.prev =cri.getPageNum() > 1;
		this.next= cri.getPageNum() < realEnd  ;
	}
}
