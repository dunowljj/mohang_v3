package org.mohang.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.mohang.domain.ExcelDTO;
import org.springframework.web.bind.annotation.RequestParam;

public interface ExcelService {

	

	public void downloadExcel(HttpServletResponse response, List<ExcelDTO> excelUriList) throws Exception;
	
	public void setChart(SXSSFWorkbook workbook, SXSSFSheet sheet, List<ExcelDTO> excelUriList);

	void setChart(SXSSFWorkbook workbook, SXSSFSheet sheet, String excelUriList);

	void downloadExcel(HttpServletResponse response) throws Exception;
	
}
