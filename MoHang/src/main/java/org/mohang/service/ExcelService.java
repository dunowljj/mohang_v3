package org.mohang.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.mohang.domain.ExcelDTO;
import org.springframework.web.bind.annotation.RequestParam;

public interface ExcelService {

	public List<File> ownloadExcel(HttpServletResponse response) throws Exception;
	public void saveFile(String[] uriList);
}