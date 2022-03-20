<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%> 
<%@page import="java.util.*"%>  
<%@page import = "java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.DateFormat" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.time.LocalTime" %>
    
<!DOCTYPE html>
<html>
<head >
<link rel="stylesheet"
		href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.input-icons i {
			position: absolute;
		}

		.input-icons {
			width: 100%;
			margin-bottom: 5px;
			
		}

		.icon {
			padding: 10px;
			min-width: 40px;
		}

		.input-field {
			
		/*	padding:10px;  */
			text-align:left;
			 width: 100%;
  font-size: 20px;
  padding: 12px 20px 12px 45px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
		}
	</style><meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

#myInput {
  
  width: 100%;
  font-size: 16px;
  padding: 14px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
  
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>

  
</script>
</head>
<body style="background:url('banner.jpg');" >
  
<center><h1><font style="font-size:50px">Upcoming Interviews</font></h1></center>




<table id="myTable">
  <tr class="header">
    <th style="width:8%;">Id</th>
    <th style="width:14%;">Name</th>
    <th style="width:10%;">Date</th>
    <th style="width:14%;">Start Time</th>
    <th style="width:10%;">End Time</th>
    <th style="width:10%;">Update Data</th>
    

  </tr>
 
    <%
    DateFormat dateFormat = new SimpleDateFormat("HH:mm");
	 Date ctime = new Date();
	 //System.out.println(dateFormat.format(ctime));
	 String d=dateFormat.format(ctime);
	 String[] arrOfdtime = d.split(":",2);
	 int []  arrOfctime = new int [arrOfdtime.length];
	 for(int i=0; i<arrOfdtime.length; i++) 
	 {
		 arrOfctime[i] = Integer.parseInt(arrOfdtime[i]);
	 }
	 int chour,cmin;
	 chour=arrOfctime[0];
	 cmin=arrOfctime[1];
	 
    if(true) {
    try {
		
    	String nk=request.getParameter("id");	 
    	 Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_website","root","rama2121");
         Statement st=con.createStatement();
         String qry="select * from interviewtimes";
         ResultSet rs=st.executeQuery(qry);
       
         while(rs.next()){
        	 String dend=rs.getString(5);
        	 String[] arrOfetime = dend.split(":",2);
        	 
        	 int []  arrOfetime1 = new int [arrOfetime.length];
	         for(int i=0; i<arrOfetime.length; i++) 
	         {
	        	 arrOfetime1[i] = Integer.parseInt(arrOfetime[i]);
	         }
	         int ehour,emin;
	         ehour=arrOfetime1[0];
	         emin=arrOfetime1[1];
	         DateFormat cdate = new SimpleDateFormat("yyyy-MM-dd");
	         Date date1 = new Date();
	         String d1=cdate.format(date1);
	         String[] arrOfddate = d1.split("-",5);
	         int []  arrOfcdate = new int [arrOfddate.length];
	         for(int i=0; i<arrOfddate.length; i++) 
	         {
	        	 arrOfcdate[i] = Integer.parseInt(arrOfddate[i]);
	         }
			int cyear,cmon,cdate1;
			cyear=arrOfcdate[0];
			cmon=arrOfcdate[1];
			cdate1=arrOfcdate[2];
			String ddate=rs.getString(3);
			String[] arrOfDate = ddate.split("-",5);
			int []  arrOfDate1 = new int [arrOfDate.length];
	         for(int i=0; i<arrOfDate.length; i++) 
	         {
	        	 arrOfDate1[i] = Integer.parseInt(arrOfDate[i]);
	         }
	         int dyear,dmon,ddate1;
	         dyear=arrOfDate1[0];
	         dmon=arrOfDate1[1];
	         ddate1=arrOfDate1[2];
	         if((ehour>=chour && emin>=cmin && dyear>=cyear && dmon>=cmon && ddate1>=cdate1) || (dyear>=cyear && dmon>=cmon && ddate1>cdate1) ){
	        	 
	         
         	out.println("<tr>");
         	out.println("<td>");
         	out.println(rs.getString(1));
         	out.println("</td>");
         	out.println("<td>");
         	out.println(rs.getString(2));
         	out.println("</td>");
         	out.println("<td>");
         	out.println(rs.getString(3));
        	out.println("</td>");
        	out.println("<td>");
         	out.println(rs.getString(4));
        	out.println("</td>");
        	out.println("<td>");
         	out.println(rs.getString(5));
         	
         	//HttpSession s=request.getSession();
         	//s.setAttribute("in",rs.getString("id"));

         	%>
         	</td>
         	<td><a href="update.jsp?id=<%=rs.getString("Ino")%>">Update</a></td>
         	<% 
         	out.println("</td>");
         	out.println("</tr>");
         	
	         }
         	}
         	
         
         out.println("</table>");
    }
    
         catch(Exception e){
         
             out.println(e);
         }
    }
    
                    
     
        %>
</table>



</body>
</html>