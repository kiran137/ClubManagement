<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Results_History.aspx.cs" Inherits="cseclubs.Results_History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                                <i class="fa fa-edit"></i>Results History
                            </li>
                        </ol>
                    </div>
                     
                     
 
                   <div >
 <form id="form1" runat="server">
<div>
 <div >
                      <asp:DropDownList ID = "clubsearch" runat="server" AutoPostBack="True" 
                          onselectedindexchanged="clubsearch_SelectedIndexChanged"  >
                  </asp:DropDownList>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />


                   </div>
<asp:GridView ID="gridView" DataKeyNames="Event_Name" runat="server"
        AutoGenerateColumns="False" ShowFooter="True" HeaderStyle-Font-Bold="true"
      
        
        BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" ForeColor="Black" 
        Width="966px">
<Columns>

<asp:TemplateField HeaderText="Event Name">
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
 <asp:TemplateField HeaderText="Student Id">
      <ItemTemplate>
         <asp:Label ID="lblsid" runat="server" Text='<%#Eval("Student_Id") %>'/>
     </ItemTemplate>
    
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
  <asp:TemplateField HeaderText="Student Name">
      <ItemTemplate>
         <asp:Label ID="lblsname" runat="server" Text='<%#Eval("Student_Name") %>'/>
     </ItemTemplate>
    
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
  <asp:TemplateField HeaderText="Student Branch">
      <ItemTemplate>
         <asp:Label ID="lblsbranch" runat="server" Text='<%#Eval("Student_Branch") %>'/>
     </ItemTemplate>
    
      <HeaderStyle HorizontalAlign="Center" />
      <ItemStyle HorizontalAlign="Center" />
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Event Date">
      <ItemTemplate>
         <asp:Label ID="lbls" runat="server" Text='<%#Eval("fDate") %>'/>
     </ItemTemplate>
    
      <HeaderStyle HorizontalAlign="Center" />
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
<br />

    </form>
                        
            </div>       
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->


</asp:Content>
