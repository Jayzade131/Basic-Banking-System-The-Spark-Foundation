<%@page import="mypack.Transaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="controller.UserDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>transaction</title>
<style type="text/css">

.item {
    position: relative;
    float: left;
}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
.item h2 {
    text-align:center;
    position: absolute;
    line-height: 125px;
    width: 100%;
}

svg {
   -webkit-transform: rotate(-90deg);
    transform: rotate(-90deg);
}

.circle_animation {
  stroke-dasharray: 440; /* this value is the pixel circumference of the circle */
  stroke-dashoffset: 440;
  transition: all 1s linear;
}
</style>
</head>
<body>
<%
int snumber=Integer.parseInt(request.getParameter("snumber"));
int rnumber=Integer.parseInt(request.getParameter("rnumber"));
int amount=Integer.parseInt(request.getParameter("amount"));
Transaction t=new Transaction(snumber,rnumber,amount);
UserDao db=new UserDao();
db.add(rnumber,amount,true);
db.add(snumber, amount, false);
if(amount<=0)
{
db.insertHistory2(t);
response.sendRedirect("unsuccessful.jsp");
}
else{
db.insertHistory(t);
}
%>
<section>

<div >
<img src="online.png" class="center">

</div>

<div class="text-center">
  
 <a class="center" href="index.jsp" ><input type="button" class="btn btn-primary btn-lg btn-block" value="Back"></a>
  </div>


</section>

 
  
  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

 

</body>
</html>