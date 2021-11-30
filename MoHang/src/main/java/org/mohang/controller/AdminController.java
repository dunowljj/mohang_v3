package org.mohang.controller;

import java.util.ArrayList; 
import java.util.List;

import org.mohang.domain.EventVO;
import org.mohang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

//
//import java.io.IOException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import mohang.action.Action;
//import mohang.action.ActionForward;
//import mohang.action.admin.AdminApproveAction;
//import mohang.action.admin.AdminApproveDetailAction;
//import mohang.action.admin.AdminMainAction;
//import mohang.action.admin.AdminManagementAction;
//import mohang.action.admin.AdminManagementDetailAction;
//import mohang.action.admin.AdminNoticeAction;
//import mohang.action.admin.AdminNoticeInsertFormAction;
//import mohang.action.admin.AdminReservationTicketManagementAction;
//import mohang.action.admin.AdminReviewManagementAction;
//import mohang.action.main.MainAction;
//
//
//
//@WebServlet("/admin/*")
//public class AdminController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
// 
//    public AdminController() {
//        super();
//        
//    }
//
//    public void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
//    	String requestURI = request.getRequestURI();
//    	String contextPath = request.getContextPath(); 
//    	String command = requestURI.substring(contextPath.length()+7);
//    	Action action = null; 
//    	ActionForward forward = null;
//    	if(command.equals("Main.do")) {
//    		action = new AdminMainAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminApprove.do")) {
//    		action = new AdminApproveAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminManagement.do")) {
//    		action = new AdminManagementAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminReservationTicket.do")) {
//    		action = new AdminReservationTicketManagementAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminNotice.do")) {
//    		action = new AdminNoticeAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminReview.do")) {
//    		action = new AdminReviewManagementAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminNoticeInsertForm.do")) {
//    		action = new AdminNoticeInsertFormAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminApproveDetail.do")) {
//    		action = new AdminApproveDetailAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}else if(command.equals("AdminManagementDetail.do")) {
//    		action = new AdminManagementDetailAction();
//    		try {
//				forward = action.execute(request, response);	
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//    	}
//    	
//    	
//    	if(forward !=null) {
//    		if(forward.isRedirect()) {
//    			response.sendRedirect(forward.getPath());
//    		}else {
//    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
//    			dispatcher.forward(request, response);
//    		}
//    	}
//    }
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doProcess(request, response);
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doProcess(request, response);
//	}
//
//}

@Log4j
@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	private AdminService service;

	/* 관리자 메인화면페이지를 보여준다. */
	@GetMapping("/mohang")
	public String admin() {
		log.info("--------------");
		return "module/admin/adminmain";
	}

	/* 행사반려승인리스트에서 승인리스트만 받아와서 조회해준다. */
	@GetMapping("listApprove")
	public String listapprove(Model model) {
		List list = new ArrayList<>();
		list = service.listApprove();
		System.out.println("List : " + list);
		model.addAttribute("approve", service.listApprove());
		return "module/admin/adminApprove";
	}
	
	/*승인반려리스트에서 글 제목 눌렀을시 디테일 페이지로 이동하게끔*/
	@GetMapping("detailApprove")
	public String detailApprove(@RequestParam("e_num") String e_num, Model model){
		model.addAttribute("detailApprove", service.detailApprove(e_num));
		EventVO event = service.detailApprove(e_num);
		String eh_num = event.getEh_num();
		
		//행사장정보가 필요해서
		model.addAttribute("eventhall", service.eventHallGet(eh_num));
		
		return "module/admin/adminApproveDetail";
	}

	
	/* 행사반려승인리스트에서 반려 버튼 눌렀을시 삭제되어 삭제된거 제외후 다시 리스트에 뿌려주는 부분 */
	@GetMapping("deleteApprove")
	public String deleteApprove(@RequestParam("ap_num") String ap_num) {
		log.info("delete@@@@@@@@@@@@@@@@@@!!!!!");
		if (service.deleteEventHall(ap_num) == 1) {
			// rttr.addFlashAttribute("ap_num", "1");
			if (service.deleteApprove(ap_num) == 1) {
				
			}
		}
		
		return "module/admin/approve";
	}

	/* 행사반려승인리스트에서 승인 버튼 눌렀을시 승인되어 리스트 비고란에 버튼들이 없어지면서 다시 리스트를 보여주는 부분 */
	@GetMapping("listApprovebtn")
	public String listApprovebtn(Model model) {
		model.addAttribute("approve",service.listApprovebtn());
		log.info("@@@@@@@@@@@");
		return "module/admin/adminApprove";
	}

	/* 행사신청디테일 조회 승인리스트에서 예를들어 이름 클릭시 지금처럼 디테일페이지로 이동 */
	@GetMapping("getApprove")
	public String getApprove() {
		
		return "module/admin/adminApproveDetail";
	}

	/* 행사예약티켓 조회 예약한 티켓리스트들을 보여준다. */
	@GetMapping("listReservationTicket")
	public String listreservationTicket(Model model) {
		model.addAttribute("ticket",service.listreservationTicket());
		return "module/admin/adminReservationTicketManagement";
	}

	/* 예약티켓 삭제버튼 눌렀을시에 적용되어 다시 삭제가 되고 삭제된 리스트를 보여준다.  */
	@GetMapping("deleteTicket")
	public String deleteTicket(@RequestParam("ticket_reservation_num") String ticket_reservation_num) {
		log.info("티켓리스트 삭제");
		if(service.deleteTicketReservation(ticket_reservation_num)==1){
			
		}
		return "redirect:listReservationTicket";
	}

	/* 게시판 공지사항을 들어갔을때 공지사항 리스트들을 보여준다. */
	@GetMapping("listNotice")
	public String notice(Model model) {
		model.addAttribute("notice",service.listNotice());
		
		return "module/admin/adminNotice";
	}

	/* 게시판 공지사항 삭제버튼 눌렀을시 리스트 목록에서 삭제되고 다시 삭제되고 남은 리스트들을 보여준다 */
	@GetMapping("deleteNotice")
	public String deleteNotice(@RequestParam("notice_num") String notice_num) {
		if(service.deleteNotice(notice_num)==1){
			
		}
		return "redirect:listNotice";
	}

	/* 공지사항게시판에서 글쓰기를 눌렀을시 등록폼으로 이동할 수 있게 하는 부분 */
	@GetMapping("noticeInsertForm")
	public String noticeInsertForm() {

		return "module/admin/adminNoticeInsertForm";
	}
	
	/*공지사항게시판에서 글제목눌렀을때 디테일페이지로 이동하게끔*/
	@GetMapping("noticeDetail")
	public String noticeDetail(@RequestParam("notice_num") String notice_num, Model model){
				model.addAttribute("detailNotice" ,service.detailNotice(notice_num));
				return "module/admin/adminNoticeDetail";
	}

	/* 등록된 리뷰게시판을 조회하는 부분이다. */
	@GetMapping("listReview")
	public String getReview(Model model) {
		model.addAttribute("review", service.listReview());
		return "/module/admin/adminReviewManagement";
	}

	/* 리뷰게시판 리스트에서 수정 버튼 눌렀을시 수정된거를 다시 포함하여 리뷰게시판에 뿌려주는 부분 */
	@PostMapping("updateReview")
	public String updateReview() {

		return "redirect:/module/admin/adminReviewManagement";
	}

	/* 리뷰게시판 리스트에서 삭제 버튼 눌렀을시 삭제 된거 제외후 다시 리뷰게시판에 뿌려주는 부분 */
	@GetMapping("deleteReview")
	public String deleteReview(@RequestParam("review_num") String review_num) {
		if(service.deleteReview(review_num) == 1){
			log.info("리뷰게시판 삭제완료");
		}
		
		return "redirect:listReview";
	}

	/* 등록된 회원에 대한 리스트들을 보여준다. */
	@GetMapping("listAccount")
	public String management(Model model) {
		model.addAttribute("account", service.listAccount());

		return "module/admin/adminManagement";
	}

	/* 회원정보삭제 버튼 눌렀을시 다시 회원리스트로 삭제된거 제외한 후 리스트로 돌아간다.  아직 보류*/
	/*
	@GetMapping("deleteAccount")
	public String deletemanagement(@RequestParam("account_num") String account_num) {
		log.info("회원리스트삭제완료");
		if(service.deleteAccount(account_num)==1){
			
		}
		return "redirect:listAccount";
	}
	*/

	/* 예를들어 회원관리 리스트에서 아이디를 눌렀을시 회원정보에 대한 디테일이 나오게끔 */
	@GetMapping("accountDetail")
	public String managementDetail(@RequestParam("account_num") String account_num, Model model) {
		model.addAttribute("accountDetail", service.detailAccount(account_num));
		return "module/admin/adminManagementDetail";
	}
	
	

}
