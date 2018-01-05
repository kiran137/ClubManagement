<%@ Page Title="" Language="C#" MasterPageFile="~/site2.Master" AutoEventWireup="true" CodeBehind="UserEvents.aspx.cs" Inherits="cseclubs.UserEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<div style="background-image: url('Styles/images.jpg'); background-color: #00FF00;">
<div id="page-wrapper">
            <div class="container-fluid" style="min-height: 80%; height: 80%;">
                <div class="row">
                    <div >
                        <form id="form1" runat="server">
                        <div style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: normal; font-style: normal; font-variant: normal; color: #000000; line-height: normal;">

                            <div>
                                <p style="margin: 10px; padding: 10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CURRENT EVENTS </p>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<asp:GridView ID="gridView" DataKeyNames="Event_Name" runat="server"
        AutoGenerateColumns="False" ShowFooter="True" HeaderStyle-Font-Bold="true"
      
        
        BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" CellPadding="4" 
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
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    STUDENTS CAN ENROLL INTO ANY EVENT BY BELOW LINK 
 <div class="col-md-12">
                        
                       
                        <div class="col-md-12" 
                            
                            style="padding-bottom: 20px; text-align:right; top: 20px; left: 0px; height: 44px; width: 533px;"> <a class="btn btn-default btn-success" href="resitration.aspx">Registration</a> </div>
                        
                    </div>
</div>
<br />

    </form>
                        
            </div>       
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->
</div>


</asp:Content>
