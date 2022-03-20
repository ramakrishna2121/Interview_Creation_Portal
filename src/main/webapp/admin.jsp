
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.DateFormat" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    select {
        width: 100px;
        margin: 20px;
    }
    select:focus {
        min-width: 150px;
        width: auto;
    }
    input {
    width:150px;
    margin: 20px;
    }
    input:focus {
        min-width: 150px;
        width: auto;
    }
</style>
</head>
<body>
<form style="margin:100px 300px 500px 500px;width:500px;">
  

 <script> add();</script>
  <br>
  <br>
  <label for="daySelect">Participant Name:</label>
  <select id="daySelect" name="day">
  
</select>
  <script>
  
  function add(element,key){
	  var select = document.getElementById("daySelect");
  	select.options[select.options.length] = new Option(element,key);
  	select.style.width="200px";
  }
  <% try{
	  
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_website","root","rama2121");
	    Statement st=con.createStatement();
	    String query="select * from participants";
	    ResultSet rs=st.executeQuery(query);
	    while(rs.next()){
	    	
	    	String key=String.valueOf(rs.getString(1));
	    	String name=String.valueOf(rs.getString(1))+" "+String.valueOf(rs.getString(2));
	    	
	    	%>
	    	name="<%=name%>";
	    	key="<%=key%>";
	    	add(name,name);
	    	
	    	<% 
	     	
	     }
	    
	    	
	    

	    }catch(Exception e){
	    	
	%>      
	    	
	        alert(Integer.toString(conf));
	    
	  
	        
	<% 
	    } %>
	    
 
  
  </script>
  <br>
  <br>
  <label for="date">Date:</label>
  <input type="date" id="date" name="date">
  <br>
  <br>
  <label for="appt">Select a start time:</label>
  <input type="time" id="appt" name="interview-start">
       <br>
  <br>
  <label for="appt1">Select a end time:</label>
  <input type="time" id="appt1" name="interview-end">
       
       <br>
       <br>
  <input type="submit" value="Submit" name="Submit">
  
  
  
  </form>
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
 DateFormat cdate = new SimpleDateFormat("yyyy-MM-dd");
 Date date1 = new Date();
 String d1=cdate.format(date1);
 String[] arrOfddate = d1.split("-",5);
 int []  arrOfcdate = new int [arrOfddate.length];
 for(int i=0; i<arrOfddate.length; i++) 
 {
	 arrOfcdate[i] = Integer.parseInt(arrOfddate[i]);
 }
//current dates and time
 int cdate1,cmonth,cyear,chour,cmin;
 cdate1=arrOfcdate[2];
 cmonth=arrOfcdate[1];
 cyear=arrOfcdate[0];
 chour=arrOfctime[0];
 cmin=arrOfctime[1];
 
 if (request.getParameter("Submit")!=null)
 {
	 String x,id,pname,starttime,endtime;
	 x=request.getParameter("day");
	 String date=request.getParameter("date");
	 x=String.valueOf(x);
	 String[] y=x.split("\\s+");
	 id=y[0];
	 pname=y[1];
	 starttime=request.getParameter("interview-start");
	 endtime=request.getParameter("interview-end");
	 String[] arrOfidate = date.split("-",5);
     int []  arrOfidate1 = new int [arrOfidate.length];
     for(int i=0; i<arrOfidate.length; i++) 
     {
    	 arrOfidate1[i] = Integer.parseInt(arrOfidate[i]);
     }
     String[] arrOfistime = starttime.split(":",2);
     int []  arrOfistime1 = new int [arrOfistime.length];
     for(int i=0; i<arrOfistime.length; i++) 
     {
    	 arrOfistime1[i] = Integer.parseInt(arrOfistime[i]);
     }
     String[] arrOfietime = endtime.split(":",2);
     int []  arrOfietime1 = new int [arrOfietime.length];
     for(int i=0; i<arrOfietime.length; i++) 
     {
    	 arrOfietime1[i] = Integer.parseInt(arrOfietime[i]);
     }
     //input dates and times
     int idate1,imonth,iyear,ishour,ismin,iehour,iemin;
     idate1=arrOfidate1[2];
     imonth=arrOfidate1[1];
     iyear=arrOfidate1[0];
     ishour=arrOfistime1[0];
     ismin=arrOfistime1[1];
     iehour=arrOfietime1[0];
     iemin=arrOfietime1[1];
	 //System.out.println(id+" "+pname+" "+date+" "+starttime+" "+endtime);
	 if(idate1<cdate1 && imonth<cmonth && iyear<cyear || iyear<cyear || idate1<cdate1 && imonth<cmonth && iyear==cyear || idate1<cdate1 && imonth==cmonth && iyear==cyear || idate1<=cdate1 && imonth<cmonth && iyear==cyear )
	 {
		 %>
		 <script>alert("The date you have mentioned has been completed");</script>
		 <% 
	 }
	 else if(idate1==cdate1 && imonth==cmonth && iyear==cyear && (ishour<chour || ishour<=chour && ismin<=cmin  ) ){
		 
		 %>
		 <script>alert("The time selected is unavailable ");</script>
		 <% 
		 
	 }
	 else if(ishour>=iehour || ishour==iehour && ismin>=iemin ){
		 %>
		 <script>alert("Time duration is negative. ");</script>
		 <% 
	 }
	 else {
		 
		 System.out.println("ifelse");
		 int overlap_check=0;
		 try
		 {
			 //System.out.println("try");
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_website","root","rama2121");
			    Statement st=con.createStatement();
			    
			    String query="select * from interviewtimes";
			    ResultSet rs=st.executeQuery(query);
			    while(rs.next())
			    {
			    	System.out.println("while");
			    	if(String.valueOf(rs.getString(2)).equals(String.valueOf(pname)))
			    	{
			    		System.out.println("if");
			    	 String ddate,dstart,dend;
			    	 ddate=rs.getString(3);
			    	 dstart=rs.getString(4);
			    	 dend=rs.getString(5);
			    	 String[] arrOfDate = ddate.split("-",5);
			    	 String[] arrOfstime = dstart.split(":",2);
			    	 String[] arrOfetime = dend.split(":",2);
			    	 
			         int []  arrOfDate1 = new int [arrOfDate.length];
			         for(int i=0; i<arrOfDate.length; i++) 
			         {
			        	 arrOfDate1[i] = Integer.parseInt(arrOfDate[i]);
			         }
			         //System.out.println(arrOfDate1[1]);
			         int []  arrOfstime1 = new int [arrOfstime.length];
			         for(int i=0; i<arrOfstime.length; i++) 
			         {
			        	 arrOfstime1[i] = Integer.parseInt(arrOfstime[i]);
			         }
			         int []  arrOfetime1 = new int [arrOfetime.length];
			         for(int i=0; i<arrOfetime.length; i++) 
			         {
			        	 arrOfetime1[i] = Integer.parseInt(arrOfetime[i]);
			         }
			         //System.out.println(arrOfstime1[0]);
			         //System.out.println(arrOfetime1[0]);
			    	//}
			         
			         //System.out.println(arrOfcdate[0]+" "+arrOfcdate[1]+" "+arrOfcdate[2]);
			         		         //input dates and times
			         
			       
			         //database dates and times of input user
			         int ddate1,dmonth,dyear,dshour,dsmin,dehour,demin;
			         ddate1=arrOfDate1[2];
			         dmonth=arrOfDate1[1];
			         dyear=arrOfDate1[0];
			         dshour=arrOfstime1[0];
			         dsmin=arrOfstime1[1];
			         dehour=arrOfetime1[0];
			         demin=arrOfetime1[1];
			         //System.out.println("hello");
			         if(idate1==ddate1 && imonth==dmonth && iyear==dyear )
			         {
			        	 LocalTime startA = LocalTime.of( ishour , ismin );
			        	 LocalTime stopA = LocalTime.of( iehour , iemin );

			        	 LocalTime startB = LocalTime.of( dshour , dsmin );
			        	 LocalTime stop2B = LocalTime.of( dehour , demin );
			         		
			        	 Boolean validA = ( ! startA.isAfter( stopA ) ) ;
			        	 Boolean validB = ( ! startB.isAfter( stop2B ) ) ;
			        	 System.out.println(validA+" "+validB);
			        	 if(validA==true && validB==true)
			        	 {
			        		 Boolean overlaps = ( 
			        				    ( startA.isBefore( stop2B ) ) 
			        				    && 
			        				    ( stopA.isAfter( startB ) ) 
			        				) ;
			      
			        		 //System.out.println(overlaps);
			        		 
			        		 if(overlaps)
			        		 {
			        			 overlap_check=1;
			        			 %>
			        			 <script>alert("There is another interview in this time.")</script>
			        			 <%
			        		 }
			        		 
			        		 
			        	 }
			        	 
			    }
			         
			         
			    
			    }	
			    	
			     }
			    if(overlap_check==0)
		    	{
        			 System.out.println("else ");
        			 try{
        				    Class.forName("com.mysql.cj.jdbc.Driver");
        				    Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_website","root","rama2121");
        				    Statement st1=con1.createStatement();
        				    String s="SELECT COUNT(*) FROM INTERVIEWTIMES";
        				    ResultSet rs1=st1.executeQuery(s);
        				    System.out.println("hi");
        				    while(rs1.next()){
        				    	int i=Integer.parseInt(rs1.getString(1));
        				    	System.out.println(i);
        				    	st1.executeUpdate("insert into interviewtimes(id,pname,dates,starttime,endtime,Ino)values('"+id+"','"+pname+"','"+date+"','"+starttime+"','"+endtime+"','"+(i+1)+"')");
        				    }
        				    
        				    	
        				    }
        				    catch(Exception e){
        				    	
        				%>      
        				    	<script>
        				        alert(Integer.toString(conf));
        				    
        				  
        				        </script>
        				<% 
        				    }
        		 }    	
		 }
			    catch(Exception e){
			    	
			%>      
			    	<script>
			        alert(Integer.toString(conf));
			    
			  
			        </script>
			<% 
			    }
	 }
	 
 }
 		
	 %>
 
</body>
</html>