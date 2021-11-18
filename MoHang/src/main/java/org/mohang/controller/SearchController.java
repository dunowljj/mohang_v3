/*package org.mohang.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mohang.action.Action;
import mohang.action.ActionForward;
import mohang.action.main.MainAction;
import mohang.action.search.EventSearchAction;
import mohang.action.search.EventSearchAction2;


@WebServlet("/search/*")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public SearchController() {
        super();
    }
    public void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath(); 
    	String command = requestURI.substring(contextPath.length()+8);
    	Action action = null; 
    	ActionForward forward = null;
    	if(command.equals("eventsearch.do")) {
    		action = new EventSearchAction();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}else if(command.equals("eventsearch2.do")) {
    		action = new EventSearchAction2();
    		try {
				forward = action.execute(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	if(forward !=null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
*/