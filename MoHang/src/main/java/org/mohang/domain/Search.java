package org.mohang.domain;


import lombok.Data;

@Data
public class Search {
	private String field;
	private String type;
	private String keyword;
	private String price;
	private String e_price;
	private String e_hitcount;
	private String e_like;
	private int pageNum;
	private int amount;
	private String startDate;
	private String endDate;
	public Search() {
	    this(1, 5);
	}

	public Search(int pageNum, int amount) {
	    this.pageNum = pageNum;
	    this.amount = amount;
	}
	public Search(String field, String type, String keyword, String price, String startDate, String endDate) {
		this.field = field;
		this.type = type;
		this.keyword = keyword;
		this.price = price;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public Search replace(Search search) {
		if (search.getField() != null && !search.getField().equals("")) {
			search.setField(search.getField().replace(",", ""));
		}
		if (search.getType() != null && !search.getType().equals("")) {
			search.setType(search.getType().replace(",", ""));
		}
		if (search.getKeyword() != null && !search.getKeyword().equals("")) {
			search.setKeyword(search.getKeyword().replace(",", ""));
		}
		if (search.getPrice() != null && !search.getPrice().equals("")) {
			search.setPrice(search.getPrice().replace(",", ""));
		}
		return search;
	}

	
}
