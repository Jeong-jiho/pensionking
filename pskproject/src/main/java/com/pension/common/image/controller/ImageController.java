package com.pension.common.image.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pension.admin.room.dao.AdminRoomDao;
import com.pension.admin.room.service.AdminRoomService;
import com.pension.admin.room.vo.RoomVO;
import com.pension.common.file.FileUploadUtil;
import com.pension.common.image.service.ImageService;
import com.pension.common.image.vo.ImageVO;

@RestController
@RequestMapping(value="/Image")
public class ImageController {
	Logger logger = Logger.getLogger(ImageController.class);
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private AdminRoomService adminRoomService;
	
	@RequestMapping(value="/roomImageInsert.do", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String roomImageInsert(RoomVO rvo, HttpServletRequest request, Model model){
		logger.info("roomInsert ȣ�⼺��");
		int result = 0;
		String value="";
		logger.info("fsgnlsge"+rvo.getFilename());
		result = imageService.roomImageInsert(rvo);
		
		if(result==1) {
			value = "성공";
		}else {
			value="실패";
		}
		return value;
	}
	
	/***************************************************************************
	 * �̹��� ����
	 ***************************************************************************/
	@RequestMapping(value="/imageDelete.do")      
	public String imageDelete(ImageVO ivo, HttpServletRequest request) throws IOException {     
		logger.info("imageDelete ȣ�⼺��");

		int result = 0;
		String value = "";
		RoomVO rvo = new RoomVO();
		rvo.setR_no(ivo.getR_no());
		if(ivo.getFilenames().length != 0) {
			
			for(int i=0; i<ivo.getFilenames().length; i++) {
				FileUploadUtil.fileDelete(ivo.getFilenames()[i], request);
				ivo.setI_name(ivo.getFilenames()[i]);
				result = imageService.imageDelete(ivo);

				if(ivo.getFilenames()[i].equals(adminRoomService.getMain(ivo.getR_no()))) {
					rvo.setR_main("");
					adminRoomService.roomR_mainUpdate(rvo);
				}
			}
			
		}
		
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
}
