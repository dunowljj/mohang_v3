package org.mohang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mohang.domain.AccountVO;
import org.mohang.domain.ApproveDTO;
import org.mohang.domain.Criteria;
import org.mohang.domain.EventHallVO;
import org.mohang.domain.EventVO;
import org.mohang.domain.NoticeVO;
import org.mohang.domain.ReviewVO;
import org.mohang.domain.TicketReservationDTO;

public interface AdminMapper {
	/*반려승인리스트 조회*/
	public List<ApproveDTO> listApprove();
	
	/*회원관리리스트 조회*/
	public List<AccountVO> listAccount();
	
	/*회원관리리스트 삭제여부를 Y->N으로*/
	public int deleteAccount(String account_num);
	
	/*회원관리 리스트에서 회원아이디 눌렀을때 디테일 페이지 나오게끔*/
	public AccountVO detailAccount(String account_num);
	
	/*반려승인리스트 삭제*/
	public int deleteApprove(String ap_num);
	public int deleteEventHall(String ap_num);
	
	/*승인버튼눌렀을시 비고란 버튼만 없어지고 다시 리스트 나오게*/
	public List<ApproveDTO> listApprovebtn();
	
	/*승인반려리스트에서 글 제목 눌렀을시 디테일 페이지로 이동하게끔*/
	public EventVO detailApprove(String e_num);
	
	 /* 승인반려리스트에서 글제목 눌렀을때 디테일페이지로 이동하기 위해서 eventhall데이터도 필요하다 */
	public EventHallVO eventHallGet(String eh_num);
	
	
	/*티켓예약리스트 조회*/
	public List<TicketReservationDTO> listreservationTicket();

	/*리뷰리스트 조회*/
	public List<ReviewVO> listReview();
	
	/*공지사항리스트 조회*/
	//public List<NoticeVO> listNotice();
	
	/*페이징처리된 공지사항리스트 조회*/
	public List<NoticeVO> listNotice(Criteria cri);
	
	/*공지사항리스트수정*/
	public int updateNotice(NoticeVO notice);
	
	/*공지사항리스트 삭제 버튼 눌렀을시 삭제*/
	public int deleteNotice(String notice_num);

	/*공지사항리스트에서 제목 눌렀을때 디테일페이지로 이동하는 코드*/
	public NoticeVO detailNotice(String notice_num);
	
	/*공지사항 글쓰기에서 등록처리 과정*/
	public int resisterNotice(NoticeVO notice);
	
	/*공지사항 수정눌렀을때 수정전 폼 보여주게끔*/
	public NoticeVO updateNoticeForm(String notice_num);
	
	/*리뷰게시판 리스트 삭제*/
	public int deleteReview(String review_num);
	
	/*리뷰게시판 리스트에서 제목 눌렀을시 디테일페이지로 이동하게끔*/
	public ReviewVO detailReview(String review_num);
	
	/*티켓에약리스트 삭제*/
	public int deleteTicketReservation(String ticket_reservation_num);
	/*행사 반려*/
	public void updatestatuswait(@Param("ap_num") String ap_num,@Param("admin_num") String admin_num);

	/*행사승인버튼눌렀을시 승인완료*/
	public void updateApprovebtn(@Param("ap_num") String ap_num,@Param("admin_num") String admin_num);

	/*공지사항 페이징처리를 위한 메서드*/
	public List<NoticeVO> getNoticePaging(Criteria cri);

	/*공지사항 게시글 데이터 갯수를 갖고오는 메서드*/
	public int getNoticeTotal();
	
}
