package org.mohang.controller;

import java.util.ArrayList; 
import java.util.List;

import org.mohang.domain.AccountVO;
import org.mohang.domain.Criteria;
import org.mohang.domain.EventVO;
import org.mohang.domain.NoticeVO;
import org.mohang.domain.PageDTO;
import org.mohang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;



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

	
	/* 행사반려승인리스트에서 반려 버튼 눌렀을시 삭제되어 삭제된거 제외후 다시 리스트에 뿌려주는 부분
	 * y 승인  w대기   n 반려 */
	@GetMapping("deleteApprove")
	public String deleteApprove(@RequestParam("ap_num") String ap_num) {
		log.info("delete@@@@@@@@@@@@@@@@@@!!!!!");
		service.updatestatuswait(ap_num,"1");
		
		return "redirect:listApprove";
	}

	/* 행사반려승인리스트에서 승인 버튼 눌렀을시 승인되어 리스트 비고란에 버튼들이 없어지면서 다시 리스트를 보여주는 부분 */
	@GetMapping("listApprovebtn")
	public String listApprovebtn(@RequestParam("ap_num") String ap_num) {
		service.updateApprovebtn(ap_num, "1");
		log.info("@@@@@@@@@@@");
		return "redirect:listApprove";
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
	/*@GetMapping("listNotice")
	public String notice(Model model) {
		model.addAttribute("notice",service.listNotice());
		
		return "module/admin/adminNotice";
	}*/
	
	/*페이징처리를 위한 게시판공지사항 리스트*/
	@GetMapping("listNotice")
	public String notice(Criteria cri, Model model) {
		model.addAttribute("notice",service.getNoticePaging(cri));
		log.info(service.getNoticePaging(cri));
		int total = service.getNoticeTotal();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "module/admin/adminNotice";
	}
	
	/*공지사항게시판에서 수정버튼 눌렀을시 수정폼이 나오게 하는 getmapping부분*/
	@GetMapping("updateNoticeForm")
	public String updateNoticeForm(@RequestParam("notice_num") String notice_num,Model model){
		service.updateNoticeForm(notice_num);
		model.addAttribute("detailNotice",service.updateNoticeForm(notice_num));
		
		return "module/admin/adminModifyInsertForm";
	}
	
	
	/*공지사항게시판에서 수정버튼 눌렀을시 수정이 되고 다시 리스트에 보여주게끔*/
	@PostMapping("updateNotice")
	public String updateNotice(NoticeVO notice){
		log.info("update :"+notice);
		service.updateNotice(notice);
		
		return "redirect:listNotice";
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
	
	/*공지사항게시판 글쓰기 안에서 공지사항 글을 작성하고 등록 눌렀을시 발생하는 부분*/
	@PostMapping("resisterNotice")
	public String resisterNotice(NoticeVO notice, RedirectAttributes rtt){
		notice.setAdmin_num("1");
		notice.setNotice_writer("관리자 이상엽");
		service.resisterNotice(notice);
		return "redirect:listNotice";
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



	/* 리뷰게시판 리스트에서 삭제 버튼 눌렀을시 삭제 된거 제외후 다시 리뷰게시판에 뿌려주는 부분 */
	@GetMapping("deleteReview")
	public String deleteReview(@RequestParam("review_num") String review_num) {
		if(service.deleteReview(review_num) == 1){
			log.info("리뷰게시판 삭제완료");
		}
		
		return "redirect:listReview";
	}

	
	/*리뷰게시판 리스트에서 제목눌렀을때 리뷰 디테일 페이지로 이동하게끔*/
	@GetMapping("detailReview")
	public String detailReview(@RequestParam("review_num") String review_num, Model model){
		model.addAttribute("detailReview", service.detailReview(review_num));
		return "module/admin/adminReviewDetail";
	}
	
	
	/* 등록된 회원에 대한 리스트들을 보여준다. */
	@GetMapping("listAccount")
	public String management(Model model) {
		model.addAttribute("account", service.listAccount());

		return "module/admin/adminManagement";
	}

	/* 회원정보삭제 버튼 눌렀을시 기존의 삭제 여부가 N-> Y로 바뀌게 하는 부분*/
	@GetMapping("deleteAccount")
	public String deletemanagement(@RequestParam("account_num") String account_num) {
		service.deleteAccount(account_num);
		return "redirect:listAccount";
	}
	

	/* 예를들어 회원관리 리스트에서 아이디를 눌렀을시 회원정보에 대한 디테일이 나오게끔 */
	@GetMapping("accountDetail")
	public String managementDetail(@RequestParam("account_num") String account_num, Model model) {
		model.addAttribute("accountDetail", service.detailAccount(account_num));
		return "module/admin/adminManagementDetail";
	}
	
	

}
