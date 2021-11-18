//package org.mohang.controller;
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