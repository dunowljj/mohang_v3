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
//import mohang.action.chat.ChatFormAction;
//
///**
// * Servlet implementation class Chatcontroller
// */
//@WebServlet("/chat/*")
//public class ChatController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public ChatController() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	public void doProcess(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String requestURI = request.getRequestURI(); 
//		String contextPath = request.getContextPath(); 
//		
//
//		String command = requestURI.substring(contextPath.length() + 6); 
//		Action action = null; 
//		ActionForward forward = null; 
//		
//		if(command.equals("ChatFormAction.do")) {
//			action = new ChatFormAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		if(forward != null) {
//			if(forward.isRedirect()) {
//				response.sendRedirect(forward.getPath()); 
//			}else {
//				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 
//				dispatcher.forward(request, response);
//			}
//		}
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		doProcess(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		doProcess(request, response);
//	}
//}
