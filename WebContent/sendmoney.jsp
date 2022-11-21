<%@page import="mypack.AllCustomer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*"%>
     <%@page import="mypack.AllCustomer.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style type="text/css">
body{
background-color:#d1d8eb;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */


/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

  }
}
</style>
<link href="assets/css/style.css" rel="stylesheet">
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="sweetalert2.all.min.js"></script>
</head>
<body>
<header>
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="index.jsp" class="w3-bar-item w3-button"><b>Home</b></a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
     <a href="allcustomertable.jsp" class="w3-bar-item w3-button">Customer List</a>
      <a href="sendmoney.jsp" class="w3-bar-item w3-button">Send Money</a>
      <a href="transactionHistrory.jsp" class="w3-bar-item w3-button">Transaction History</a>
    </div>
  </div>
</div>
<br><br>
 <%
 Class.forName("com.mysql.jdbc.Driver");
 System.out.println("Driver Registerd");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingwebsite","root","abc123");
    	
    	System.out.println("Connection successfully");
    	String id=request.getParameter("aid");
    AllCustomer cu=new AllCustomer();
    PreparedStatement ps=con.prepareStatement("select * from allcustomer where id=?");
    ps.setString(1, id);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
    	cu.setAccountno(rs.getString(4));
    	cu.setBalance(rs.getString(5));
   }
    	%>
<form action="sender.jsp" class="modal-content">
    <div class="container">
      <h1>Send Money</h1>
 
      <hr>
      <label ><b>Sender Account Number</b></label>
      <input type="text"  name="snumber" value="<%=cu.getAccountno() %>" required>

      <label for="psw"><b>Receiver Account Number</b></label>
      <input type="text"  name="rnumber" required>

      <label ><b>Amount</b></label>
      <input type="text"  name="amount" required>
      
   <br>

<div class="d-grid gap-2 col-6 mx-auto">
  <button  class="btn btn-primary" type="submit"><strong>Send</strong></button>
  
</div>
    </div>
  </form>


 
</body>
</html>