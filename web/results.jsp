<%--
    Document    : results
    Author      : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salary Info.</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    
    <%
        int hoursWorked=Integer.parseInt(request.getParameter("hoursWorked"));
        double hourlyPay=Double.parseDouble(request.getParameter("hourlyPay"));
        double preTaxDeduct=Double.parseDouble(request.getParameter("preTaxDeduct"));
        double postTaxDeduct=Double.parseDouble(request.getParameter("postTaxDeduct"));
        int otHours=0;
        int regularHours=0;
        double otPay=0;
        double otPayRate=0;
        double regularPay=0;
        double grossPay=0;
        if (hoursWorked>40)
         {
            regularHours = 40;
            otHours = (hoursWorked-40);
            otPayRate = (hourlyPay*1.5);
            otPay = (otHours*otPayRate);
            regularPay = (regularHours*hourlyPay);
            grossPay = (regularPay+otPay);
         }
        else
        {   
            regularHours=hoursWorked;
            otHours=0;
            grossPay=(regularHours*hourlyPay);
        }
        double preTaxPay= grossPay-preTaxDeduct;
        double taxAmount;
            if (grossPay<500)
                taxAmount= (.18*preTaxPay);
            else
                taxAmount= (.22*preTaxPay);
        double postTaxPay= preTaxPay-taxAmount;
        double netPay= postTaxPay-postTaxDeduct;
        %>
    <body>
        <h1>Salary Information</h1>        
        <table>
                <tr><td>Total Hours Worked:</td><td><input type="text" name="hoursWorked" value="<%=hoursWorked%>" disabled="disabled"></td></tr>
                <tr><td>Hourly Rate:</td><td><input type="text" name="hourlyPay" value="<%=hourlyPay%>" disabled="disabled"></td></tr>
                <tr><td># Hours Overtime:</td><td><input type="text" name="otHours" value="<%=otHours%>" disabled="disabled"></td></tr>
                <tr><td>Overtime Hourly Rate:</td><td><input type="text" name="otPayRate" value="<%=otPayRate%>" disabled="disabled"></td></tr>
                <tr><td>Gross Pay:</td><td><input type="text" name="grossPay" value="<%=grossPay%>" disabled="disabled"></td></tr>
                <tr><td>Pre-tax Deduct:</td><td><input type="text" name="preTaxDeduct" value="<%=preTaxDeduct%>" disabled="disabled"></td></tr>
                <tr><td>Pre-tax Pay:</td><td><input type="text" name="preTaxPay" value="<%=preTaxPay%>" disabled="disabled"></td></tr>
                <tr><td>Tax Amount:</td><td><input type="text" name="taxAmount" value="<%=taxAmount%>" disabled="disabled"></td></tr>
                <tr><td>Post-tax Pay:</td><td><input type="text" name="postTaxPay" value="<%=postTaxPay%>" disabled="disabled"></td></tr>
                <tr><td>Post-tax Deduct:</td><td><input type="text" name="postTaxDeduct" value="<%=postTaxDeduct%>" disabled="disabled"></td></tr>
                <tr><td>Net Pay:</td><td><input type="text" name="netPay" value="<%=netPay%>"></td></tr>
        </table>
                    <a href="http://msci3300-s1606.cloudapp.net:8800/HW3/"/> Back to Calculator </a>
    </body>
</html>
