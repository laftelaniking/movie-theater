<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> </title>
</head>
<body>
	<h2> bookingseat_check </h2>
	
<% 
 	//disp는 회원아이디
	String disp = "";
	disp = (String)session.getAttribute("naver");		

	String[] seats = request.getParameterValues("seat");  //자리
	String date = request.getParameter("date");           //날짜
	String mcode = request.getParameter("mcode");         //영화코드
	String price = request.getParameter("price");         //가격
	System.out.println(price);
	
	Mdate = date;
	Mcode = Integer.parseInt(mcode);
	Price = Integer.parseInt(price);
	
	String bookedSeats = String.join(",", seats);
	
	List<String> list = new ArrayList<>();
	boolean check = true;
	
/* 	for(int i = 0; i < date.length; i++){
		System.out.println(date[i]);
	} */
	
	System.out.println(mcode);
	
	if(application.getAttribute("seats") != null){
		list = (List<String>)application.getAttribute("seats");
	}
	
	for(String s : seats){
		if(list.contains(s)){
			check = false;
			break;
		}
	}
	
	if(check){
		for(int i = 0; i < seats.length; i++){
			list.add(seats[i]);
			System.out.println(seats[i]);
		}
		
		application.setAttribute("seats", list);
		response.sendRedirect("booking.jsp");
	}
	
	//System.out.println((List<String>)application.getAttribute("seats"));
	
	msg = "insert into booking values(booking_seq.nextval, ?, ?, ?, ?, ?)";
	PST = CN.prepareStatement(msg); 
		PST.setString(1, disp);
	 	PST.setInt(2, Mcode);
	 	PST.setString(3, Mdate);
	 	PST.setString(4, bookedSeats);
	 	PST.setInt(5, Price);
  
	int OK = PST.executeUpdate() ; //댓글저장처리 
	if(OK>0){System.out.println("PST명령어 moviereply댓글테이블 저장 성공\n ") ; }
	else{System.out.println("PST명령어 moviereply댓글테이블 저장 실패실패\n ") ; }
 
	
	//response.sendRedirect("movieDetail.jsp?idx="+ MRcode);
	//response.sendRedirect("./index.jsp");
	
%>
</body>
</html>