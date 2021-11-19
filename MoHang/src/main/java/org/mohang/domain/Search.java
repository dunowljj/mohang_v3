package org.mohang.domain;

import lombok.Data;

@Data
public class Search {
	private String field;
	private String type;
	private String keyword;
	private String price;
	@Override
	public String toString() {
		return "Search [field=" + field + ", type=" + type + ", keyword=" + keyword + ", price=" + price + "]";
	}
}
