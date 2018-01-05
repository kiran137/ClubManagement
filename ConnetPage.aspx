<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnetPage.aspx.cs" Inherits="cseclubs.ConnetPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clubs Management System</title>
    <style>
    body
    {
        background-image:url("events.jpg");
    }
        #Button1
        {
            width: 176px;
            margin-left: 398px;
            margin-top: 0px;
        }
        #Button2
        {
            width: 180px;
            margin-left: 210px;
            margin-top: 28px;
        }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button2_onclick() {

        }

        function Button1_onclick() {

        }

// ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <p>
        &nbsp;</p>
    <asp:Button ID="Button1" runat="server" BorderColor="#999966" 
        BorderStyle="Groove" Font-Italic="True" ForeColor="#CC0000" 
        onclick="Button1_Click" Text="Admin" />
    <asp:Button ID="Button2" runat="server" BorderColor="#999966" 
        BorderStyle="Groove" Font-Italic="True" ForeColor="Red" onclick="Button2_Click" 
        Text="User" />
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>
