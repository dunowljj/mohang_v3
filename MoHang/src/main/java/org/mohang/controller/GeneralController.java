/*package org.mohang.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mohang.action.ActionForward;
import mohang.action.general.GeneralAction;
import mohang.action.general.InformationUpdateFormAction;
import mohang.action.general.LikeListAction;
import mohang.action.general.LikeListEmptyAction;
import mohang.action.general.ModalPrAction;
import mohang.action.general.ModalPrAction2;
import mohang.action.general.ReserveFormAction;
import mohang.action.general.ReserveListAction;
import mohang.action.general.ReviewListAction;
import mohang.action.general.TicketDetailAction;

@WebServlet("/general/*")
public class GeneralController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GeneralController() {
        super();
    }

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = requestURI.substring(contextPath.length() + 9); 
		System.out.println(command);
		GeneralAction action = null; 
		ActionForward forward = null; 
		
		if(command.equals("informationUpdateForm.do")) {
    		action = new InformationUpdateFormAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("reserveForm.do")) {
    		action = new ReserveFormAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("reserveList.do")) {
    		action = new ReserveListAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("likeList.do")) {
    		action = new LikeListAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("likeListEmpty.do")) {
    		action = new LikeListEmptyAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("reviewList.do")) {
    		action = new ReviewListAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("modal.do")) {
    		action = new ModalPrAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("modal2.do")) {
    		action = new ModalPrAction2();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("ticketDetail.do")) {
    		action = new TicketDetailAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath()); 
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
*/