<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="cseclubs.Results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">
function deleteConfirm(resultid) {
         var result = confirm('Do you want to delete ' + resultid + ' ?');
         if (result) {
             return true;
         }
         else {
             return false;
         }
     }
</script>

<div id="page-wrapper">
            <div class="container-fluid" style="min-height: 80%; height: 80%;">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="Home.aspx">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i>Results Details
                            </li>
                        </ol>
                    </div>
                      <div class="col-md-12">
                        
                       
                        <div class="col-md-12" style="padding-bottom: 20px; text-align:right"> <a class="btn btn-default btn-success" href="AddResult.aspx">+Add Result</a> </div>
                        
                    </div>
                   <div >
 <form id="form1" runat="server">
<div >
<asp:GridView ID="gridView" DataKeyNames="Result_Id" runat="server"
        AutoGenerateColumns="False" ShowFooter="True" HeaderStyle-Font-Bold="true"
        onrowcancelingedit="gridView_RowCancelingEdit"
        onrowdeleting="gridView_RowDeleting"
        onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating"
        
        OnRowDataBound="gridView_RowDataBound" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" ForeColor="Black" 
        onselectedindexchanged="gridView_SelectedIndexChanged" Width="948px">
<Columns>
<%--<asp:TemplateField HeaderText="Result Id" ItemStyle-CssClass="CustomerId col-md-1">
    <ItemTemplate>
        <asp:Label ID="txtstorid" runat="server" Text='<%#Eval("Result_Id") %>'/>
    </ItemTemplate>
    
    
    <FooterStyle HorizontalAlign="Center" />
    <HeaderStyle HorizontalAlign="Center" />
    <ItemStyle HorizontalAlign="Center" />
    
    
</asp:TemplateField>--%>
<asp:TemplateField HeaderText="Event Name" >
      <ItemTemplate>
         <asp:Label ID="lblc" runat="server" Text='<%#Eval("Event_Name") %>'/>
     </ItemTemplate>
     
     
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Club Name">
      <ItemTemplate>
         <asp:Label ID="lbla" runat="server" Text='<%#Eval("Club_Name") %>'/>
         
     </ItemTemplate>
     
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Student Id" >
      <ItemTemplate>
         <asp:Label ID="lbls" runat="server" Text='<%#Eval("Student_Id") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txts" width="150px"  runat="server" Text='<%#Eval("Student_Id") %>'/>
          <asp:RegularExpressionValidator ID="validate1" runat="server" ErrorMessage="Enter correct Event"
  ControlToValidate="txts" ValidationExpression="^[0-9]*$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>
     
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Student Name" >
      <ItemTemplate>
         <asp:Label ID="lbln" runat="server" Text='<%#Eval("Student_Name") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtn" width="150px"  runat="server" Text='<%#Eval("Student_Name") %>'/>
          <asp:RegularExpressionValidator ID="validate2" runat="server" ErrorMessage="Enter correct Event"
  ControlToValidate="txtn" ValidationExpression="^[A-Za-z ]*$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>
     
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Student Branch" >
      <ItemTemplate>
         <asp:Label ID="lblname" runat="server" Text='<%#Eval("Student_Branch") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtname" width="150px"  runat="server" Text='<%#Eval("Student_Branch") %>'/>
          <asp:RegularExpressionValidator ID="validate3" runat="server" ErrorMessage="Enter correct Event"
  ControlToValidate="txtname" ValidationExpression="^[A-Za-z]*$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>
     
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
<asp:TemplateField HeaderText="Event Date" >
      <ItemTemplate>
         <asp:Label ID="lblda" runat="server" Text='<%#Eval("fDate") %>'/>
     </ItemTemplate>
     <%--<EditItemTemplate>
         <asp:TextBox ID="txtdate" width="150px"  runat="server" Text='<%#Eval("fDate") %>'/>
     </EditItemTemplate>--%>
     
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 
 <asp:TemplateField  >
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
        <!-- /#page-wrapper -->



</asp:Content>
