<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Clubs.aspx.cs" Inherits="cseclubs.Clubs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>--%>
 <script type="text/javascript">
     function deleteConfirm(clubid) {
         var result = confirm('Do you want to delete ' + clubid + ' ?');
         if (result) {
             return true;
         }
         else {
             return false;
         }
     }
</script>

<div id="page-wrapper" style="background-image: none">
            <div class="container-fluid" style="min-height: 80%; height: 80%;">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="Home.aspx">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i>Clubs Details
                            </li>
                        </ol>
                    </div>
                   <div>
 <form id="form1" runat="server">
<div>

<asp:GridView ID="gridView" DataKeyNames="Club_Id" runat="server"
        AutoGenerateColumns="False" ShowFooter="True" HeaderStyle-Font-Bold="true"
        onrowcancelingedit="gridView_RowCancelingEdit"
        onrowdeleting="gridView_RowDeleting"
        onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating"
        onrowcommand="gridView_RowCommand"
        OnRowDataBound="gridView_RowDataBound" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" ForeColor="Black" 
        onselectedindexchanged="gridView_SelectedIndexChanged" Width="860px" CssClass="footable" >
<Columns>
<%--<asp:TemplateField HeaderText="Club Id">
    <ItemTemplate>
        <asp:Label ID="txtstorid" runat="server" Text='<%#Eval("Club_Id") %>'/>
    </ItemTemplate>
    
    
    <FooterStyle HorizontalAlign="Center" />
    <HeaderStyle HorizontalAlign="Center" />
    <ItemStyle HorizontalAlign="Center" />
    
    
</asp:TemplateField>--%>
 <asp:TemplateField HeaderText="Club Name">
      <ItemTemplate>
         <asp:Label ID="lblname" runat="server" Text='<%#Eval("Club_Name") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtname" width="150px"  runat="server" Text='<%#Eval("Club_Name") %>'/>
          <asp:RegularExpressionValidator ID="validate1" runat="server" ErrorMessage="Enter Valid Club Name in Bold"
  ControlToValidate="txtname" ValidationExpression="^[A-Z& ]*$" >
         </asp:RegularExpressionValidator>
     </EditItemTemplate>

     <FooterTemplate>
         <asp:TextBox ID="inname"  width="150px" runat="server"/>
         <asp:RequiredFieldValidator ID="vname" runat="server" ControlToValidate="inname" Text="Enter Club Name in Bold" ValidationExpression="^[A-Z& ]*$"  ValidationGroup="validaiton"/>
     </FooterTemplate>
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
    <FooterTemplate>
        <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New Club" ValidationGroup="validaiton" />
    </FooterTemplate>
     <FooterStyle HorizontalAlign="Center" />
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
