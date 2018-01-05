
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddEvent1.aspx.cs" Inherits="cseclubs.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
      $(document).ready(function () {

          $("#datepicker").datepicker({
              dateFormat: 'mm/dd/yy',
              changeMonth: true,
              changeYear: true,
              //yearRange: '-100y:c+nn',
              maxDate: '+5y'
              
          });

          $("#regispicker").datepicker({
              dateFormat: 'mm/dd/yy',
              changeMonth: true,
              changeYear: true,
              // yearRange: '-100y:c+nn',
              maxDate: '+5y'
          });
          $("#submitRecord").on('click', function (e) {

              $('#enameerror').hide();
              $('#cnameerror').hide();
              $("#dateinfo").hide();
              //$('#prooferror').hide();
              e.preventDefault();

              verification = {};
              if (RegExp('^[A-Z0-9" "]+$').test($("#ename").val())) {
                  verification.name = true;
              }
              else {
                  $("#nameerror").show();

              }


              if ($("#datepicker").val() && $("#regispicker").val()) {
                  verification.date = true;
              }
              else {
                  $("#dateinfo").html("Please select date ").css('color', 'red');
              }



              if (verification.date && verification.name) {

                  var name = $('#<%=ClubsList.ClientID%>').val();
                  alert(name);
                  $.ajax({
                      type: "POST",
                      url: "AddEvent1.aspx/AddData",
                      data: JSON.stringify({ ename: $("#ename").val(), cname: name, edate: $("#datepicker").val(), rdate: $("#regispicker").val() }),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: OnSuccess,
                      error: OnErrorCall
                  });




                  function OnSuccess(response) {
                      console.log(response);
                      var result = response.d;

                      $("#msg").html("New record addded successfully  :)").css("color", "green");

                      $("#ename").val("");
                      $("#ClubsList").val("Select value");

                      $("#datepicker").val("");
                      $("#regispicker").val("");
                      //$("#proof").val("");

                  }

                  function OnErrorCall(response) {
                      $("#msg").html("Error occurs  :(  EVENT NAME IS ALREADY PRSENT").css("color", "red");
                  }
              }
              else {
                  $("#msg").html("Please fill all required details or check all values").css("color", "red");
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
                            <i class="fa fa-dashboard"></i><a href="EventsUpdate.aspx">Events Details</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-edit"></i>Add Event Details
                            </li>
                    </ol>
                </div>
            </div>

            
            <form id="form1"  runat="server">

                <div class="row">
                    <div class="col-lg-4">

                        
                       <div> <asp:Label ID="racha" runat="server" ></asp:Label></div>
                        <div>
                            <label>Club Name</label>
                            <asp:DropDownList ID="ClubsList" runat="server" AutoPostBack="true" Height="29px" Width="186px"  EnableViewState="true">
                                <asp:ListItem Selected="True" Text="Select event club"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                         <br />
                        <div class="form-group">
                            <label>Event Name</label>&nbsp;
                            <label id="fnameerror" style="color: red; display: none">Not a valid Name</label><input class="form-control" placeholder="Enter First Name" id="ename">
                              <p>Enter in Bold characters
                             </p>
                        </div>
                       

                        
                        <div>
                            <p>Date of Event :&nbsp;&nbsp;&nbsp; <input type="text" placeholder="Pick the Date" id="datepicker" /></p>
                        </div>

                      <div>
                            <p>Last Date for registration :<input type="text" placeholder="Pick the Date" id="regispicker" /></p>
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
