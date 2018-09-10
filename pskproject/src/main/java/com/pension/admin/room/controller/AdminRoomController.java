package com.pension.admin.room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pension.admin.price.service.PriceService;
import com.pension.admin.room.service.AdminRoomService;
import com.pension.admin.room.vo.RoomVO;
import com.pension.admin.sterm.service.StermService;
import com.pension.admin.sterm.vo.StermVO;
import com.pension.common.file.FileUploadUtil;
import com.pension.common.image.service.ImageService;
import com.pension.common.image.vo.ImageVO;

@Controller
@RequestMapping(value="/admin")
public class AdminRoomController {
	Logger logger = Logger.getLogger(AdminRoomController.class);
	 
	@Autowired
	private AdminRoomService adminRoomService;

	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private PriceService priceService;
	
	@Autowired
	private StermService stermService;
	
	@RequestMapping(value = "/room/roomList.do", method = RequestMethod.GET)
	public String roomList(@ModelAttribute("roomData") RoomVO rvo, Model model,ObjectMapper mapper) {
		logger.info("roomList 호출성공");

		List<RoomVO> roomList = adminRoomService.roomList(rvo);
		StermVO sterm = stermService.getSterm();
		
		model.addAttribute("roomList",roomList);
		model.addAttribute("sterm",sterm);

		return "admin/room/roomList";
	}
	
	/***************************************************************************
	 * 객실 등록 폼
	 ***************************************************************************/
	@RequestMapping(value="/room/writeForm.do")
	public String writeForm() {
		logger.info("writeForm 호출성공");
		
		return "admin/room/writeForm";
	}
	
	/***************************************************************************
	 * 객실등록
	 ***************************************************************************/
	@RequestMapping(value="/room/roomInsert.do", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String roomInsert(RoomVO rvo, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		logger.info("roomInsert 호출성공");
		int result = 0;
		int result1 = 0;
		String url = "";
		String r_cvc = "";
		if(rvo.getCvc() != null) {
			for(int i=0; i<rvo.getCvc().length; i++) {
				r_cvc += rvo.getCvc()[i]+" ";
			}
		}
		rvo.setR_cvc(r_cvc);
		result = adminRoomService.roomInsert(rvo);
		rvo.setR_no(adminRoomService.getRoomSeq());
		priceService.priceInsert(rvo);
		String filename = "";
		FileUploadUtil.setR_no(adminRoomService.getRoomSeq());
		
		if(rvo.getFile() != null && result == 1) {
			
			for(int i=0; i<rvo.getFile().length; i++) {
				if(rvo.getFile()[i].getOriginalFilename() != "" ){
					logger.info(rvo.getFile()[i].getOriginalFilename());
					if(i==0) {
						filename = FileUploadUtil.getRealName(rvo.getFile()[i], request, "room");
						rvo.setR_main(filename);
						adminRoomService.roomR_mainUpdate(rvo);	
						rvo.setFilename(filename);
						
						FileUploadUtil.roomFileUpload(rvo.getFile()[i], request, "room", filename);
						result1 = imageService.roomImageInsert(rvo);
					}else {
						filename = FileUploadUtil.roomFileUpload(rvo.getFile()[i], request, "room");

						rvo.setFilename(filename);
						
						result1 = imageService.roomImageInsert(rvo); 
					}
				}	
			}
		}
		
		
		if(result == 1 && result1 == 1) {
			url = "admin/room/success";
		}else {
			url = "admin/room/error";
		}
		return url+"";
	}
	
	/***************************************************************************
	 * ���� �󼼺���
	 ***************************************************************************/
	@RequestMapping(value="/room/roomDetail.do", method=RequestMethod.GET)
	public String roomDetail(RoomVO rvo, Model model) {
		logger.info("roomDetail 호출성공");
		
		RoomVO detail = new RoomVO();
		detail = adminRoomService.roomDetail(rvo);
		List<ImageVO> roomImageList = imageService.roomImageList(rvo);
		RoomVO priceDetail = priceService.priceSelect(rvo.getR_no());
		
		if(detail != null && (!detail.equals(""))) {
			detail.setR_cvc(detail.getR_cvc().toString().replaceAll("\n", "<br>"));
			detail.setR_info(detail.getR_info().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		model.addAttribute("roomImageList", roomImageList);
		model.addAttribute("price", priceDetail);
		
		return "admin/room/roomDetail";
	}
	
	/***************************************************************************
	 * ���� ���� ��
	 ***************************************************************************/
	@RequestMapping(value="/room/updateForm.do", method=RequestMethod.POST)
	public String roomUpdateForm(RoomVO rvo, Model model, HttpServletRequest request){ 
		logger.info("UpdateForm 호출성공");
		
		RoomVO updateData = new RoomVO();
		updateData = adminRoomService.roomDetail(rvo);
		List<ImageVO> roomImageList = imageService.roomImageList(rvo);
		RoomVO updatePrice = priceService.priceSelect(rvo.getR_no());
		
		model.addAttribute("updateData", updateData);
		model.addAttribute("roomImageList", roomImageList);
		model.addAttribute("updatePrice", updatePrice);
		
		return "admin/room/updateForm";
	}
	/***************************************************************************
	 * ���� ����
	 ***************************************************************************/
	@RequestMapping(value="/room/roomUpdate.do", method=RequestMethod.POST , produces="text/plain; charset=UTF-8")
	public String roomUpdate(RoomVO rvo, HttpServletRequest request) throws IOException{
		logger.info("roomUpdate 호출성공");
		
		int result = 0;
		String url = "";
		String filename = "";
		
		String r_cvc = "";
		if(rvo.getCvc() != null) {
			for(int i=0; i<rvo.getCvc().length; i++) {
				r_cvc += rvo.getCvc()[i]+" ";
			}
		}
		rvo.setR_cvc(r_cvc);
		
		FileUploadUtil.setR_no(rvo.getR_no());
		if(rvo.getFile() != null) {
			for(int i=0; i<rvo.getFile().length; i++) {
				if(rvo.getFile()[i].getOriginalFilename() != "" ){
					filename = FileUploadUtil.getRealName(rvo.getFile()[i], request, "room");
					rvo.setFilename(filename);
					if(i==0) {
						if(adminRoomService.getMain(rvo.getR_no()) == null) {
							rvo.setR_main(filename);
							adminRoomService.roomR_mainUpdate(rvo);
							imageService.roomMainImageInsert(rvo);

						}else {
							imageService.roomImageInsert(rvo);
						}
						FileUploadUtil.roomFileUpload(rvo.getFile()[i], request, "room", filename);

					}else {
						FileUploadUtil.roomFileUpload(rvo.getFile()[i], request, "room");


						
						imageService.roomImageInsert(rvo); 
					}
				}	
			}
		}
		result = adminRoomService.roomUpdate(rvo);

		url = "/admin/room/roomDetail.do?r_no="+rvo.getR_no();

		return "redirect:" + url;
	}
	/***************************************************************************
	 * ���� ����
	 ***************************************************************************/
	@ResponseBody
	@RequestMapping(value="/room/roomDelete.do", produces="text/plain; charset=UTF-8")      
	public String roomDelete(RoomVO rvo, HttpServletRequest request) throws IOException {  
		logger.info("roomDelete ȣ�⼺��");
		
		int result = 0;
		String value = "";
		String filename = "";
		List<ImageVO> image = imageService.roomImageList(rvo);
		if(priceService.priceSelect(rvo.getR_no()) == null) {
			if(image.iterator().hasNext()) {
				filename = image.iterator().next().getI_name();
				logger.info(filename);
				FileUploadUtil.fileDelete(filename, request);
			}
			imageService.imageAllDelete(rvo);
			priceService.priceDelete(rvo); 
			result = adminRoomService.roomDelete(rvo);
			logger.info(result);
		}else {
			result = 0;
		}
		
		if(result==1) {
			value="성공";
		}else {
			value="실패";
		}
		return value;
	}
	
}
