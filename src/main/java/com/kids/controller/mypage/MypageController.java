package com.kids.controller.mypage;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;
import com.kids.service.file.ImageFileService;
import com.kids.service.senior.SeniorService;

@Controller
public class MypageController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	SeniorService seniorService;
	
	@Autowired
    private ImageFileService imageFileService;

    // private String uploadDir = "D:\\Eclipse-workspace-11\\JuniorToSeniorProject\\src\\main\\webapp\\resources\\image\\profile\\";
    private String uploadDir = "C:\\upload\\image\\profile\\";
	
	@GetMapping("/sampleSession")
	public String sampleSession() {
		return "sampleSession";
	}
	
	@PostMapping("/sampleSession")
	public String sampleSession_action(@RequestParam("id") String id,
										HttpServletRequest request) {
		
		if(id.equals("")) {
			return "sampleSession";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userId", id);
			
			return "redirect:/updateMypage";
		}
		
	}

	@GetMapping("/updateMypage")
	public String updateMypage(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		
		SeniorDetailDto seniorDetail = seniorService.getSeniorDetailById(id);
		ImageFileDTO seniorImg = seniorService.getImgById(id);
		
		model.addAttribute("seniorDetail", seniorDetail);
		model.addAttribute("seniorImg", seniorImg);
		
		List<SeniorScheduleDto> seniorEnableSchedule = seniorService.getSeniorEnableSchedule(id);
		model.addAttribute("seniorEnableSchedule", seniorEnableSchedule);
		
		return "updateMypage";
	}
	
	@PostMapping("/updateMypage")
	public String updateMypage_action(SeniorDetailDto seniorDetail,
									SeniorScheduleDto schedule,
									@RequestParam("file") MultipartFile file,
									Model model) {
		
		if (!file.isEmpty()) {
            try {
                String originalFileName = file.getOriginalFilename();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String fileName = UUID.randomUUID().toString() + extension;
                Path uploadPath = Paths.get(uploadDir);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                String storedFilePath = filePath.toString();
                // Get the session ID and pass it to the service method
                String sessionId = (String)session.getAttribute("userId"); // Add code to retrieve the session ID here
                ImageFileDTO imageFile = imageFileService.saveImageFile(fileName, storedFilePath, sessionId);
                
                model.addAttribute("uploadedImageFileName", imageFile.getFileName());

            } catch (IOException e) {
                e.printStackTrace();
                return "updateMypage";
            }
        } 		
		
		/* 스케줄 업데이트 */
		String[] scheduleCodeArr = schedule.getScheduleCode().split(",");
		String[] statusArr = schedule.getStatus().split(",");
		String[] workStatusArr = schedule.getWorkStatus().split(",");
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i=0; i<scheduleCodeArr.length; i++) {			
			map.put("id", (String)session.getAttribute("userId"));
			map.put("scheduleCode", scheduleCodeArr[i]);
			if(statusArr[i].equals("Y") && workStatusArr[i].equals("N")) {
				//활동가능한데 매칭중인 경우
				map.put("status", statusArr[i]);
			}else {
				map.put("status", workStatusArr[i]);
			}
			map.put("workStatus", workStatusArr[i]);
			
			int scheduleUpdateResult = seniorService.updateSchedule(map);
			//scheduleUpdateResult 수행 결과 점검해야함
		}
		
		/* 개인정보 업데이트 */
		int result = seniorService.updateUserInfo(seniorDetail);

		if(result != 2) {
			//update가 둘 중 하나는 정상적으로 수행되지 않음 !!!(로직 다시 점검해야함)
			System.out.println("update 실패");
		}else {
			//update가 정상적으로 수행됨 !
			System.out.println("update 성공");
		}
		
		return "redirect:/updateMypage";
	}
	

}
