package org.mohang.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.mohang.domain.ExcelDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ExcelServiceImpl implements ExcelService {

	private String filePath = "C://upload";

	private int rowCount;
	private int cellCount;

	@Override
	public List<File> ownloadExcel(HttpServletResponse response) throws Exception {
		// init
		
		SXSSFWorkbook workBook = new SXSSFWorkbook();
		workBook.setCompressTempFiles(true);
		SXSSFSheet sheet = workBook.createSheet("Hello sheet");
		sheet.setRandomAccessWindowSize(100);
		rowCount = 0;
		cellCount = 0; // data setting
		// this.setTitle(workBook, sheet, param);
		List<File> list = this.setChart(workBook, sheet);
		// this.setData(workBook, sheet, param);
		// file download
		String fullpath = "Test.xlsx";
		this.write(workBook, fullpath);
		this.downloadExcelFileToWeb(new File(fullpath), response);
		
		return list;
	}

	@Override
	public void saveFile(String[] uriList) {
		String BASE64_PNG_PRE_FIX = "data:image/png;base64,";

		FileOutputStream fos = null;
		File imageFile = null;

		for (int i = 0; i < uriList.length; i++) {
			try {
				String encodingStr = uriList[i].replace(BASE64_PNG_PRE_FIX, "");
				byte[] decodeImg = Base64.decodeBase64(encodingStr);
				FileUtils.forceMkdir(new File(filePath)); // 디렉토리 미 존재시 생성
				imageFile = new File(filePath + "/chartImg" + i + ".png");
				fos = new FileOutputStream(imageFile);
				fos.write(decodeImg);
				// 이미지를 출력할 CELL 위치 선정
				cellCount = 0;
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e.getMessage(), e);
			} finally {
				IOUtils.closeQuietly(fos);
			}
		}
	}

	public List<File> setChart(SXSSFWorkbook workbook, SXSSFSheet sheet) {

		InputStream in = null;
		File dir = new File(filePath);
		File files[] = dir.listFiles();
		List<File> imageFileList = new ArrayList<>();

		for (File file : files) {
			if (file.isFile()&&file.getName().toUpperCase().startsWith("CHART")) {
				imageFileList.add(file);
			}
		}

		for (int i = 0; i < imageFileList.size(); i++) {
			try {
				in = new FileInputStream(imageFileList.get(i));
				byte[] bytes = IOUtils.toByteArray(in);
				int pictureIdx = workbook.addPicture(bytes, SXSSFWorkbook.PICTURE_TYPE_PNG);
				final CreationHelper helper = workbook.getCreationHelper();
				final Drawing drawing = sheet.createDrawingPatriarch();
				final ClientAnchor anchor = helper.createClientAnchor();
				// 이미지를 출력할 CELL 위치 선정
				cellCount = 0;
				anchor.setCol1(cellCount++);
				anchor.setRow1(rowCount++); // 이미지 그리기
				final Picture pict = drawing.createPicture(anchor, pictureIdx); // 이미지 사이즈 비율 설정
				pict.resize();
				rowCount = rowCount + 20; // FIXME 이미지 높이만큼 rowCount 추가필요
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e.getMessage(), e);
			} finally {
				IOUtils.closeQuietly(in);
			}
		}
		
		return imageFileList;
	}

	private void write(SXSSFWorkbook workBook, String fullPath) throws Exception {
		// file write
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(fullPath);
			workBook.write(fos);
		} finally {
			IOUtils.closeQuietly(fos);
			IOUtils.closeQuietly(workBook);
		}
	}

	private void downloadExcelFileToWeb(File excelFile, HttpServletResponse res) {
		if (excelFile == null || excelFile.exists() == false) {
			throw new IllegalArgumentException("invalid excelFile path");
		}
		String fileNm = FilenameUtils.getName(excelFile.getAbsolutePath());
		res.setContentType("applicaiton/vnd.ms-excel;charset=utf-8");
		res.setHeader("Content-Disposition", "attachment;filename=\"" + fileNm + "\";");
		OutputStream out = null;
		FileInputStream fis = null;
		try {
			out = res.getOutputStream();
			fis = new FileInputStream(excelFile);
			FileCopyUtils.copy(fis, out);
			// buffer copy
			out.flush();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			IOUtils.closeQuietly(fis);
			IOUtils.closeQuietly(out);
			excelFile.delete();
		}
	}

}