package com.pension.common.file;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	private static int r_no = 0;
	
	public static int getR_no() {
		return r_no;
	}

	public static void setR_no(int r_no) {
		FileUploadUtil.r_no = r_no;
	}
	
	   public static void makeDir(String docRoot) {
	      File fileDir = new File(docRoot);
	      if(fileDir.exists()) {
	         return;
	      }
	     
	      fileDir.mkdirs();
	   }
	   
	   public static String getRealName(MultipartFile file, HttpServletRequest request, String fileName) throws IOException{
			String real_name=null;
			
			String org_name = file.getOriginalFilename();
			logger.info("org_name :" + org_name);
			
			
			if(org_name != null && (!org_name.equals(""))) {
				real_name = fileName + "_" + r_no + "_" + System.currentTimeMillis() + "_" + org_name;
			}
			return real_name;
		}
		
		public static String roomFileUpload(MultipartFile file, HttpServletRequest request, String fileName) throws IOException{
			logger.info("fileUpload ȣ�⼺��");
			
			String real_name=null;
			
			String org_name = file.getOriginalFilename();
			logger.info("org_name :" + org_name);
			
			
			if(org_name != null && (!org_name.equals(""))) {
				real_name = fileName + "_" + r_no + "_" + System.currentTimeMillis() + "_" + org_name; 
				
				
				String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+fileName);
				
				
				
				File fileAdd = new File(docRoot + "/" + real_name);
				logger.info("���������(fileAdd) : " + fileAdd);
				
				
				file.transferTo(fileAdd);
			}
			return real_name;
		}
		
		public static String roomFileUpload(MultipartFile file, HttpServletRequest request, String fileName, String real_name) throws IOException{
			logger.info("fileUpload ȣ�⼺��");

			
			String org_name = file.getOriginalFilename();
			logger.info("org_name :" + org_name);
			
			
			if(org_name != null && (!org_name.equals(""))) {
				
				String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+fileName);
				makeDir(docRoot);
				
				
				File fileAdd = new File(docRoot + "/" + real_name);
				logger.info("���ε������(fileAdd) : " + fileAdd);
				
				
				file.transferTo(fileAdd);
			}
			return real_name;
		}
	   
	  
	   public static String fileUpload(MultipartFile file, HttpServletRequest request, String fileName) throws IOException {
	      logger.info("fileUpload 호출성공");
	      
	      String real_name = null;
	      
	      String org_name = file.getOriginalFilename();
	      logger.info("org_name : " + org_name);
	      
	      
	      if(org_name != null && (!org_name.equals(""))) {
	         real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;      
	         
	       
	         String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/" + fileName);
	         makeDir(docRoot);
	         
	        
	         File fileAdd = new File(docRoot + "/" + real_name);
	         logger.info("저장된파일(filAdd) : " + fileAdd);
	         
	        
	         file.transferTo(fileAdd);
	      }
	      return real_name;
	   }
	   
	 
	   public static void fileDelete(String fileName, HttpServletRequest request) throws IOException {
	      logger.info("fileDelete 호출성공");
	      
	      boolean result = false;
	      String dirName = fileName.substring(0, fileName.indexOf("_"));
	      String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/" + dirName);  
	      
	      File fileDelete = new File(docRoot + "/" + fileName);    
	      logger.info("삭제된 파일(fileDelete) : " + fileDelete);
	      
	      if(fileDelete.exists() && fileDelete.isFile()) {
	         result = fileDelete.delete();
	      }
	      
	      logger.info("삭제여부(true / false) : " + result);
	   }
	   
	 
	   public static String makeThumbnail(String fileName, HttpServletRequest request) throws Exception{
	      String dirName = fileName.substring(0, fileName.indexOf("_"));
	     
	      String imgPath = request.getSession().getServletContext().getRealPath("/uploadStorage/" + dirName);
	      
	      
	      File fileAdd = new File(imgPath, fileName);
	      logger.info("썸네일(fileAdd) : " + fileAdd);
	      
	      BufferedImage sourceImg = ImageIO.read(fileAdd);
	      BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);
	      
	      String thumbnailName = "thumbnail_" + fileName;
	      String docRoot = imgPath + "/thumbnail";
	      makeDir(docRoot);
	      
	      File newFile = new File(docRoot, thumbnailName);
	      logger.info("썸네일(newFile) : " + newFile);
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	      logger.info("(formatName) : " + formatName);
	      
	      ImageIO.write(destImg,formatName, newFile);
	      return thumbnailName;
	   }
	   
	   
	   
	}