package com.tumbler.review.file;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	
	// 업로드할 폴더 생성 
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	// 파일 업로드 메서드
	public static String fileUpload(MultipartFile file, HttpServletRequest request, String fileName) throws Exception{
		System.out.println("fileUpload 호출 성공");
		String real_name = null;
		
		// MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename();
		System.out.println("org_name:" + org_name);
		
		// 파일명 변경(중복되지 않게)
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			// 저장할 파일 이름
			String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+fileName);
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/"+ real_name); // 파일 생성후
			System.out.println("업로드할 파일(fileAdd)" + fileAdd);
			
			file.transferTo(fileAdd);
			
		}
		return real_name;
	}
	
	// 파일 삭제 메서드
	public static void fileDelete(String fileName, HttpServletRequest request) throws Exception{
		System.out.println("fileDelete 호출 성공");
		boolean result = false;
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+ dirName);
		
		File fileDelete = new File(docRoot +"/"+ fileName); // 파일 생성후
		System.out.println("삭제할 파일(fileDelete):" + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		System.out.println("파일 삭제 여부(ture/false): " + result);
		
	}
	
}
