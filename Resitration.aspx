<%@ Page Title="" Language="C#" MasterPageFile="~/site2.Master" AutoEventWireup="true" CodeBehind="Resitration.aspx.cs" Inherits="cseclubs.Resitration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>

      $(document).ready(function () {
          $("#submitRecord").on('click', function (e) {

              $('#siderror').hide();
              $('#snameerror').hide();
              $('#sbrancherror').hide();
              $('#semailerror').hide();
              //$('#prooferror').hide();
              e.preventDefault();
              verification = {};

              if (RegExp('^[0-9]{12}$').test($("#sid").val())) {
               
                  verification.name = true;
              }
              else {
                  $("#siderror").show();

              }
              if (RegExp('^[A-Za-z" "]+$').test($("#sname").val())) {
                  verification.sname = true;
              }
              else {
                  $("#snameerror").show();

              }

              if (RegExp('^[A-Za-z]+$').test($("#sbranch").val())) {
                  verification.sbranch = true;
              }
              else {
                  $("#sbrancherror").show();

              }

              if (RegExp('^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$').test($("#semail").val())) {
                  verification.semail = true;
              }
              else {
                  $("#semailerror").show();
              }

              if (verification.name && verification.sname && verification.sbranch) {
                  var name = $('#<%=EventsList.ClientID%>').val();
                  var Cname = $('#<%=clubname.ClientID%>').val();
                  var date = $('#<%=datelist.ClientID%>').val();
                  alert(name);

                  $.ajax({
                      type: "POST",
                      url: "Resitration.aspx/AddData",
                      data: JSON.stringify({ RDate: date, ename: name, Sname: $("#sname").val(), Sid: $("#sid").val(), Sbranch: $("#sbranch").val(), Semail: $("#semail").val(), cname: Cname }),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: OnSuccess,
                      error: OnErrorCall
                  });





                  function OnSuccess(response) {
                      console.log(response);
                      var result = response.d;

                      $("#msg").html("Details added successfully :)").css("color", "green");
                      $("#sname").val("");
                      $("#EventsList").val("Select value");
                      $("#sid").val("");
                      $("#cname").val("");

                      $("#sbranch").val("");
                      $("#semail").val("");

                  } //$("#proof").val("");



                  function OnErrorCall(response) {
                      $("#msg").html("Error occurs  :(  Please check the all values or event date exceeds ").css("color", "red");
                  }
              }
              else {
                  $("#msg").html("Please fill all required details").css("color", "red");
              }
          });

      });



      function submitRecord_onclick() {

      }

  </script>
<div id="page-wrapper">

        <div class="container-fluid" style="min-height: 100%; height: 100%;">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="UserHome.aspx">Home</a>
                        </li>
                        <li>
                            <i class="fa fa-dashboard"></i><a href="UserEvents.aspx">Current Events</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-edit"></i>Add Registration
                            </li>
                    </ol>
                </div>
            </div>

            
                       <form id="form1"  runat="server">

                <div class="row">
                    <div class="col-lg-4">

                        
                       <div> <asp:Label ID="racha" runat="server" ></asp:Label></div>
                       <div>
                            <label>Event Name</label>
                            <asp:DropDownList ID="EventsList" runat="server" AutoPostBack="true" Height="29px" Width="186px" onselectedindexchanged="eventsearch_SelectedIndexChanged" EnableViewState="true">
                                <asp:ListItem Selected="True" Text="Select event club"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="form-group">
                            <label>Student Name</label>
                            <input class="form-control" placeholder="Enter First Name" id="sname">
                            <label id="fnameerror" style="color: red; display: none">Not a valid Name</label>
                        </div>
                         <div class="form-group">
                            <label>Student Id</label>
                            <input class="form-control" placeholder="Enter 12 digit Id"  id="sid">
                            <label id="Label1" style="color: red; display: none">Not a valid Name</label>
                           <%-- <input type="text" class="form-control" name="phone" ng-model="sid" required />--%>
                        </div>
                         <div class="form-group">
                            <label>Student Branch</label>
                            <input class="form-control" placeholder="Enter Branch" id="sbranch">
                            <label id="Label2" style="color: red; display: none">Not a valid Name</label>
                        </div>
                         <div class="form-group">
                            <label>Student Email</label>
                            <input class="form-control" placeholder="Enter Email" id="semail">
                            <label id="Label3" style="color: red; display: none">Not a valid Name</label>
                        </div>
                       
                        <div class="form-group">
                            <label>Club Name</label>
                            <asp:TextBox ID="clubname" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                          
                        </div>
                         <div class="form-group">
                            <label>Last Date</label>
                            <asp:TextBox ID="datelist" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                          
                        </div>
                         <br />

                        
                        
                   
                       

                       
                        
                       
                       

                        
                        <div class="center-block">

                            <%--<button type="submit" class="btn btn-default" id="submitRecord"></button>--%>
                            <input type="button" class="btn btn-default btn-success" id="submitRecord" value="submit" onclick="return submitRecord_onclick()">
                            <%--                          <button type="reset" class="btn btn-default">Reset Button</button>--%>


                           <label id="msg" ></label> 
                        </div>


                    </div>







                </div>
                <!-- /#page-wrapper -->
            </form>
         

        </div>
        <!-- /#wrapper -->

    </div>


</asp:Content>
