<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EventsUpdate.aspx.cs" Inherits="cseclubs.EventsUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
    function deleteConfirm(eveid) {
        var result = confirm('Do you want to delete ' + eveid + ' ?');
        if (result) {
            return true;
        }
        else {
            return false;
        }
    }
     

   


</script>

<div id="page-wrapper" dir="ltr" 
    style="background-position: center; background-image: none; background-repeat: repeat; background-attachment: fixed;">
            <div class="container-fluid" style="min-height: 100%; height: 100%;">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li>
                                <a href="Home.aspx">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i>Event Details
                            </li>
                            <li></li>
                        </ol>
                    </div>
                   
                    
       <div >
    <form id="form1" runat="server">
<div>
                   
                    
                    <div class="col-md-12">
                        
                       
                        <div class="col-md-12" style="padding-bottom: 20px; text-align:right"> <a class="btn btn-default btn-success" href="AddEvent1.aspx">+Add Event</a> </div>
                        
                    </div>
<asp:GridView ID="gridView" DataKeyNames="Event_Id" runat="server"
        AutoGenerateColumns="False" ShowFooter="True" HeaderStyle-Font-Bold="true"
        onrowcancelingedit="gridView_RowCancelingEdit"
        onrowdeleting="gridView_RowDeleting"
        onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating"
        
        OnRowDataBound="gridView_RowDataBound" Height="247px" Width="975px" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" 
        onselectedindexchanged="gridView_SelectedIndexChanged">
<Columns>
<%--<asp:TemplateField HeaderText="Event Id">
    <ItemTemplate>
        <asp:Label ID="txtstorid" runat="server" Text='<%#Eval("Event_Id") %>'/>
    </ItemTemplate>
    <FooterStyle HorizontalAlign="Center" />
    <HeaderStyle HorizontalAlign="Center" />
    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>--%>
 <asp:TemplateField HeaderText="Event Name">
      <ItemTemplate>
         <asp:Label ID="lblname" runat="server" Text='<%#Eval("Event_Name") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtname" width="150px"  runat="server" Text='<%#Eval("Event_Name") %>'/>
         <asp:RegularExpressionValidator ID="validate1" runat="server" ErrorMessage="Enter Event in Bold"
  ControlToValidate="txtname" ValidationExpression="^[A-Z0-9 ]*$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>
    
      <FooterStyle HorizontalAlign="Center" />
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
    
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Club Name">
     <ItemTemplate>
         <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("Club_Name") %>'/>
     </ItemTemplate>
    <%-- <EditItemTemplate>
         <asp:TextBox ID="txtaddress" width="150px"  runat="server" Text='<%#Eval("Club_Name") %>'/>
     </EditItemTemplate>
   --%>
     <FooterStyle HorizontalAlign="Center" />
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
   
 </asp:TemplateField>
  <asp:TemplateField HeaderText="Event Date">
       <ItemTemplate>
         <asp:Label ID="lblcity" runat="server" Text='<%#Eval("fDate") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtcity" width="150px"   runat="server" Text='<%#Eval("fDate") %>'/>
          <asp:RegularExpressionValidator ID="validate2" runat="server" ErrorMessage="invalid Entry"
  ControlToValidate="txtcity" ValidationExpression="^\d{2}\/\d{2}\/\d{4}$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>
    
       <FooterStyle HorizontalAlign="Center" />
       <HeaderStyle HorizontalAlign="Center" />
       <ItemStyle HorizontalAlign="Center" />
    
 </asp:TemplateField>
   <asp:TemplateField HeaderText="Registration Date">
     <ItemTemplate>
         <asp:Label ID="lblstate" runat="server" Text='<%#Eval("RegistrationDate") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtstate" width="150px"  runat="server" Text='<%#Eval("RegistrationDate") %>'/>
          <asp:RegularExpressionValidator ID="validate3" runat="server" ErrorMessage="invalid Entry"
  ControlToValidate="txtstate" ValidationExpression="^\d{2}\/\d{2}\/\d{4}$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>
    
       <FooterStyle HorizontalAlign="Center" />
       <HeaderStyle HorizontalAlign="Center" />
       <ItemStyle HorizontalAlign="Center" />
    
 </asp:TemplateField>
<asp:TemplateField>
    <EditItemTemplate>
        <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update"  Text="Update"  />
        <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel"  Text="Cancel" />
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit"  Text="Edit"  />
        <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete"  />
    </ItemTemplate>
  
     <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 </Columns>
    <FooterStyle BackColor="#CCCCCC" />

<HeaderStyle Font-Bold="True" BackColor="Black" ForeColor="White"></HeaderStyle>
    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
    <RowStyle BackColor="White" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#808080" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
    </div>
<div >
<br />&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblmsg" runat="server"></asp:Label>
</div>
    </form>

</div>
 </div>
           
            </div>
 </div>

</asp:Content>
