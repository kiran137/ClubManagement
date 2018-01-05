<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddResult.aspx.cs" Inherits="cseclubs.AddResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>

      $(document).ready(function () {


          $("#submitRecord").on('click', function (e) {

              $('#siderror').hide();
              $('#snameerror').hide();
              $('#brancherror').hide();
              //$('#prooferror').hide();
              e.preventDefault();

              verification = {};
              if (RegExp('^[0-9]+$').test($("#sid").val())) {
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
                  $("#brancherror").show();

              }
              if (verification.name && verification.sname && verification.sbranch) {
                  var ename = $('#<%=DropDownList1.ClientID%>').val();
                  var name = $('#<%=ClubsList.ClientID%>').val();
                  var date = $('#<%=datepicker.ClientID%>').val();
                  alert(name);
                  alert(ename);
                  $.ajax({
                      type: "POST",
                      url: "AddResult.aspx/AddData",
                      data: JSON.stringify({ Ename: ename, cname: name, edate: date, Sid: $("#sid").val(), SName: $("#Sname").val(), Sbn: $("#Text1").val() }),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: OnSuccess,
                      error: OnErrorCall
                  });




                  function OnSuccess(response) {
                      console.log(response);
                      var result = response.d;

                      $("#msg").html("New record addded successfully  :)").css("color", "green");

                      $("#DropDownList1").val("Select value");
                      $("#ClubsList").val("");

                      $("#sid").val("");
                      $("#Sname").val("");
                      $("#Text1").val("");
                      $("#datepicker").val("");
                      //$("#proof").val("");

                  }

                  function OnErrorCall(response) {
                      $("#msg").html("Error occurs  :(  Please check the all values").css("color", "red");
                  }
              }
              else {
                  $("#msg").html("Please fill all required details and check all values").css("color", "red");
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
                            <i class="fa fa-dashboard"></i><a href="Home.aspx">Home</a>
                        </li>
                        <li>
                            <i class="fa fa-dashboard"></i><a href="Results.aspx">Results Details</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-edit"></i>Add Result Details
                            </li>
                    </ol>
                </div>
            </div>

            
            <form id="form1"  runat="server" style="background-image: none">

                <div class="row">
                    <div class="col-lg-4">

                        
                       <div> <asp:Label ID="racha" runat="server" ></asp:Label></div>
                        <div class="form-group">
                            <label>Event Name</label>
                             <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" Height="29px" Width="186px"  EnableViewState="true"  onselectedindexchanged="eventsearch_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Text="Select event club"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                         <div class="form-group">
                            <label>Club Name</label>
                            <asp:TextBox ID="ClubsList" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                          
                        </div>
                         <br />

                        <div class="form-group">
                            <label>Student Id</label>
                            <input class="form-control" placeholder="Enter Id" id="sid">
                            <label id="fnameerror" style="color: red; display: none">Not a valid id</label>

                        </div>

                      <div>
                            <div class="form-group">
                            <label>Student Name</label>
                            <input class="form-control" placeholder="Enter  Name" id="Sname">
                            <label id="Label1" style="color: red; display: none">Not a valid Name</label>
                        </div>
                        
                      <div>
                            <div class="form-group">
                            <label>Student Branch</label>
                            <input class="form-control" placeholder="Enter branch" id="Text1">
                            <label id="Label2" style="color: red; display: none">Not a valid Name</label>
                        </div>
                        <div class="form-group">
                            <label>Event Date</label>
                            <asp:TextBox ID="datepicker" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                          
                        </div>
                        </div>
                  
                       

                       
                        
                       
                       

                        
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
