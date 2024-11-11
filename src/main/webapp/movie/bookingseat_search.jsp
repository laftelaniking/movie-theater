<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.*"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
 <title> bookingseat_search.jsp </title>
 
 <link rel="stylesheet" href="../css/style.css">
 <link rel="stylesheet" href="../css/bookingDetail.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
 <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
  
<body>
	<header>
		<div id="login">
  	<div id="loginlink">
      <ul>
<% 	
	String disp = "";
  disp = (String)session.getAttribute("naver");
  if(disp==null || disp.equals("")){
%>	
        <li><a href="./join.jsp">회원가입</a></li>
        <li><a href="./login.jsp">로그인</a></li>
<%
  }else{
%>	
        <li><a href="#">My Page</a></li>
    		<li><a href="./logout.jsp">로그아웃</a></li>
<%
  }//if end
%>      
      </ul>
    </div>
    </div>

  <div id="headerc">
    <nav>
	    <div id="logo">
	      <a href="../index.jsp">
	        <img src="../images/OSB.png" width="120px">
	      </a>
	    </div>
      <ul id="topMenu">
        <li><a href="#" id="aaa" onMouseOver="ArrowA()" onMouseOut='this.innerHTML="영화 ▶"'>영화 ▶</a>
          <ul>
            <li><a href="./box_now.jsp" onMouseOver="ArrowA()" onMouseOut='aaa.innerHTML="영화 ▶"'>현재상영작</a></li>
            <li><a href="./box_plan.jsp" onMouseOver="ArrowA()" onMouseOut='aaa.innerHTML="영화 ▶"'>상영예정작</a></li>
          </ul>
        </li>
        <% if(disp==null || disp.equals("")){ %>
        <li><a href="#" onclick="alert('로그인 후에 이용할 수 있습니다.'); location.href='./login.jsp';">예매</a></li>
     		<% }else{ %>
    	 <li><a href="./booking.jsp">예매</a></li> 
     		<% } %>
        <li><a href="#" id="ccc" onMouseOver="ArrowC()" onMouseOut='this.innerHTML="스토어 ▶"'>스토어 ▶</a>
          <ul>
            <li><a href="./md_Drink.jsp" onMouseOver="ArrowC()" onMouseOut='bbb.innerHTML="스토어 ▶"'>음료</a></li>
            <li><a href="./md_Snack.jsp" onMouseOver="ArrowC()" onMouseOut='bbb.innerHTML="스토어 ▶"'>스낵</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div> <!-- #headerc END -->
  </header>
      <!-- 이상 공통부분(삭제x) -->    
<% 

//댓글 연결한 것처럼 db연결  예매된 좌석 
 /*  
	msg = a+b+z+c ;
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);

	while(RS.next()==true){
	 	MRrn = RS.getInt("rn"); //댓글의 순서행번호
	 	MRnum = RS.getInt("num"); //삭제및 수정작업을 위한  num필드
	 	MRwriter = RS.getString("id");   //댓글의 저자 writer
	 	MRcontent = RS.getString("content") ; //댓글의 내용 content
	 	System.out.println("성공성공"); */
	 	
	 /* 	select rownum rn, st.seat_num, sc.schedule_date 
	 	from schedule sc inner join seat st on sc.schedule_date = st.schedule_date and sc.mcode =  8800; */ 	
	 	
	 
	 	//날짜 고르는 순간 자바스크립트로 submit?
	 			/* var msg="bookingseat_search.jsp?date=" + selectedDate + "&mcode=" + mcode; */ 
	String Mdate = request.getParameter("date");
	String Mcode = request.getParameter("mcode");
	System.out.println(Mcode); 			
	System.out.println(Mdate); 			
	 			
	String a = "select * from (select rownum rn, st.seat_num, st.issue, sc.schedule_date from schedule sc inner join seat st ";
	String b = "on sc.schedule_date = st.schedule_date and sc.mcode = " + Mcode; //MRcode영화코드
	String c = ") where issue = 1";   //예약된 좌석 출력
	msg = a+b+c;
	
	System.out.println(msg);
	ST = CN.createStatement();
	RS = ST.executeQuery(msg); 	
	
	while(RS.next()==true){
		SeatNum = RS.getString("seat_num");
		Price = RS.getInt("issue"); 
		System.out.println("성공 스케줄 좌석번호");  //dao사용?
	}//while end
	
	response.sendRedirect("booking.jsp");
%>
     	
             <!-- 이하 공통부분(삭제x) -->
  <footer>
  <div id="footerc">
    <div id="bottomMenu">
      <ul>
        <li><a href="#">회사 소개</a></li>
        <li><a href="./map.jsp">오시는 길</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">법적고지
        </a></li>
      </ul>
      <div id="sns">
        <ul>
          <li><a href="#"><img src="../images/sns-1.png"></a></li>
          <li><a href="#"><img src="../images/sns-2.png"></a></li>
          <li><a href="#"><img src="../images/sns-3.png"></a></li>
        </ul>
      </div>
    </div> <!-- bottomMenu END -->
    <div id="company">
     <p>(04000)서울특별시 ***동 ***로 *** (대표전화) 123-456-7890</p>
     <p>대표이사 : ooo · 사업자등록번호 : 000-00-00000 · 통신판매업신고번호 : 2024-서울xx-0000 <u>사업자정보확인</u> </p>
     <p>호스팅사업자 : ooo · 개인정보보호 책임자 : xxx · 대표이메일 : movie@fake.com </p>
     <p>© xx ooo. All Rights Reserved </p>
    </div> <!-- company END -->
  </div> <!-- #footerc END -->
  </footer>
    
  <script src="../js/slideshow.js"></script>
</body>
</html>