package com.community.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;

/**
 * 첨부파일 업로드를 지원하는 클래스다.
 * @author lee_e
 *
 */
public class MultipartRequest {

	private HttpServletRequest request;
	private String directory;
	private Map<String, List<FileItem>> parameterMap;
	private Map<String, List<String>> formFieldMap = new HashMap<>();
	
	public MultipartRequest(HttpServletRequest request, String saveDirectory) throws ServletException, IOException {
		this.request = request;
		this.directory = saveDirectory;
		createParameterMap();
		parseParameterMap();
	}
	
	private void createParameterMap() throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setDefaultCharset("utf-8");
		ServletFileUpload upload = new ServletFileUpload(factory);
		parameterMap = upload.parseParameterMap(request);
	}
	
	private void parseParameterMap() throws IOException {
		Set<Entry<String, List<FileItem>>> entries = parameterMap.entrySet();
		for (Entry<String, List<FileItem>> entry : entries) {
			
			String filedName = entry.getKey();
			List<String> fieldValues = new ArrayList<>();
			
			List<FileItem> items = entry.getValue();
			for (FileItem item : items) {
				if (!item.isFormField()) {
					if (!item.getName().isEmpty()) {
						String filename = item.getName();
						fieldValues.add(filename);
						InputStream in = item.getInputStream();
						OutputStream out = new FileOutputStream(new File(directory, filename));
						IOUtils.copy(in, out);
						in.close();
						out.close();
					}
				} else {
					String value = item.getString();
					fieldValues.add(value);
				}
			}
			if (!fieldValues.isEmpty()) {
				formFieldMap.put(filedName, fieldValues);				
			}
		}
	}
	
	/**
	 * 지정된 이름의 요청파라미터값을 반환한다.
	 * @param name 요청파라미터 이름
	 * @return 요청파라미터 값, 지정의 이름의 요청파라미터가 없으면 null을 반환한다.
	 */
	public String getParameter(String name) {
		List<String> values = formFieldMap.get(name);
		if (values == null) {
			return null;
		} 
		if (values.isEmpty()) {
			return null;
		}
		return values.get(0);
	}
	
	/**
	 * 지정된 이름의 요청파라미터값을 반환한다.
	 * @param name 요청파라미터 이름
	 * @return 요청파라미터 값, 지정의 이름의 요청파라미터가 없으면 null을 반환한다.
	 */
	public String[] getParameterValues(String name) {
		List<String> values = formFieldMap.get(name);
		if (values == null) {
			return null;
		}
		if (values.isEmpty()) {
			return null;
		}
		return values.toArray(new String[values.size()]);
	}
	
	/**
	 * 지정된 이름의 파일 입력필드로 업로드된 첨부파일이름을 반환한다.
	 * @param name 파일 입력필드의 이름
	 * @return 업로드된 첨부파일이름, 업로드된 첨부파일이 없으면 null을 반환한다.
	 */
	public String getFilename(String name) {
		return getParameter(name);
	}
	
	/**
	 * 지정된 이름의 파일 입력필드로 업로드된 첨부파일이름을 반환한다.
	 * @param name 파일 입력필드의 이름
	 * @return 업로드된 첨부파일이름, 업로드된 첨부파일이 없으면 null을 반환한다.
	 */
	public String[] getFilenames(String name) {
		return getParameterValues(name);
	}
}
