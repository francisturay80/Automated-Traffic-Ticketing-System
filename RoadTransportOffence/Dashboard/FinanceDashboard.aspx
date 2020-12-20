<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Finance.Master" AutoEventWireup="true" CodeBehind="FinanceDashboard.aspx.cs" Inherits="RoadTransportOffence.Dashboard.FinanceDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
<%--    <script type="text/javascript" src="https://www.google.com/jsapi"></script>  --%>
     <script src="../assets/jsapi" type="text/javascript"></script>     
    <script src="../assets/jquery-1.8.2.js" type="text/javascript"></script>
   <script type="text/javascript">
       google.load('visualization', '1', { packages: ['corechart'] });
        // google.load('visualization', '1.1', { 'packages': ['bar'] });
   </script>  

    <%--// CHAT TO USERS BY SEX--%>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Default.aspx/GetChartData',
                data: '{}',
                success:
                    function (response) {
                        drawchart(response.d);
                    },

                error: function () {
                    alert("Error loading data!");
                }
            });
        })
        function drawchart(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'NominationCode');
            data.addColumn('number', 'Total');
            //   data.addColumn('string', 'Total amount2');

            for (var i = 0; i < dataValues.length; i++) {
                // data.addRows([dataValues[i].Year, dataValues[i].Total], dataValues[i].Year);
                data.addRow([dataValues[i].DATE, dataValues[i].Total]);
            }

            new google.visualization.PieChart(document.getElementById('chart')).
                draw(data, { title: "Top Offences" });
        }

    </script>

       



    
  



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    




    <div class="clearfix"></div>
	
  <div class="content-wrapper">
    <div class="container-fluid">

       <!--Start Dashboard Content-->

     <div class="row mt-3">
       <div class="col-12 col-lg-6 col-xl-3">
         <div class="card gradient-deepblue">
           <div class="card-body">
               <asp:Repeater ID="rptSystemAdmin" runat="server">
                   <ItemTemplate>
              <h5 class="text-white mb-0"><%#Eval("TOTAL")%>  <span class="float-right"><i class="zmdi zmdi-accounts"></i></span></h5>
                       </ItemTemplate>
                   </asp:Repeater>
                <div class="progress my-3" style="height:3px;">
                   <div class="progress-bar" style="width:55%"></div>
                </div>
              <p class="mb-0 text-white small-font">Total Admin Users </p>
            </div>
         </div> 
       </div>
       <div class="col-12 col-lg-6 col-xl-3">
         <div class="card gradient-orange">
           <div class="card-body">
               <asp:Repeater ID="RptOffenceList" runat="server">
                   <ItemTemplate>
              <h5 class="text-white mb-0"><%#Eval("TOTAL")%><span class="float-right"><i class="fa fa-archive"></i></span></h5>
                       </ItemTemplate>
                   </asp:Repeater>
                <div class="progress my-3" style="height:3px;">
                   <div class="progress-bar" style="width:55%"></div>
                </div>
              <p class="mb-0 text-white small-font">Total Offence Listed </p>
            </div>
         </div>
       </div>
       <div class="col-12 col-lg-6 col-xl-3">
         <div class="card gradient-ohhappiness">
            <div class="card-body">
                 <asp:Repeater ID="RptVehicle" runat="server">
                   <ItemTemplate>
              <h5 class="text-white mb-0"><%#Eval("TOTAL")%> <span class="float-right"><i class="fa fa-truck text-white"></i></span></h5>
                       </ItemTemplate>
                     </asp:Repeater>
                <div class="progress my-3" style="height:3px;">
                   <div class="progress-bar" style="width:55%"></div>
                </div>
              <p class="mb-0 text-white small-font">Total Vehicle Registered </p>
            </div>
         </div>
       </div>
       <div class="col-12 col-lg-6 col-xl-3">
         <div class="card gradient-ibiza">
            <div class="card-body">
                <asp:Repeater ID="RptOfficers" runat="server">
                   <ItemTemplate>
              <h5 class="text-white mb-0"><%#Eval("TOTAL")%> <span class="float-right"><i class="fa fa-user-circle"></i></span></h5>
                       </ItemTemplate>
                     </asp:Repeater>
                <div class="progress my-3" style="height:3px;">
                   <div class="progress-bar" style="width:55%"></div>
                </div>
              <p class="mb-0 text-white small-font">Total Wardens </p>
            </div>
         </div>
       </div>
     </div><!--End Row-->



        <!---- contents 2 -->

      <%--<h6 class="text-uppercase">Progress Cards</h6>
       <hr>
	
		<div class="row">
			 <div class="col-12 col-md-6 col-lg-3 col-xl-3">
			 <div class="card rounded-0">
			<div class="card-body">
			  <div class="media align-items-center">
			  <div class="media-body">
				<h5 class="mb-0">7543</h5>
				<p class="mb-0">Total Patients</p>
			  </div>
			  <div class="w-icon"><i class="zmdi zmdi-face text-primary"></i></div>
			  </div>
			  <div class="progress-wrapper mt-3">
				  <div class="progress mb-0" style="height: 5px;">
				  <div class="progress-bar gradient-primary" role="progressbar" style="width: 45%"></div>
				</div>
			 </div>
			</div>
			</div>
		 </div>
		 <div class="col-12 col-md-6 col-lg-3 col-xl-3">
			 <div class="card rounded-0">
			<div class="card-body">
			  <div class="media align-items-center">
			  <div class="media-body">
				<h5 class="mb-0">$8967</h5>
				<p class="mb-0">Admitted Patients</p>
			  </div>
			  <div class="w-icon"><i class="zmdi zmdi-accounts-alt text-info"></i></div>
			  </div>
			  <div class="progress-wrapper mt-3">
				  <div class="progress mb-0" style="height: 5px;">
				  <div class="progress-bar gradient-info" role="progressbar" style="width: 55%"></div>
				</div>
			 </div>
			</div>
			</div>
		 </div>
		 <div class="col-12 col-md-6 col-lg-3 col-xl-3">
			 <div class="card rounded-0">
			<div class="card-body">
			  <div class="media align-items-center">
			  <div class="media-body">
				<h5 class="mb-0">$8,569</h5>
				<p class="mb-0">Treatment Costs</p>
			  </div>
			  <div class="w-icon"><i class="zmdi zmdi-balance-wallet text-danger"></i></div>
			  </div>
			  <div class="progress-wrapper mt-3">
				  <div class="progress mb-0" style="height: 5px;">
				  <div class="progress-bar gradient-danger" role="progressbar" style="width: 65%"></div>
				</div>
			 </div>
			</div>
			</div>
		 </div>
		 <div class="col-12 col-md-6 col-lg-3 col-xl-3">
			 <div class="card rounded-0">
			<div class="card-body">
			  <div class="media align-items-center">
			  <div class="media-body">
				<h5 class="mb-0">689</h5>
				<p class="mb-0">Available Staff</p>
			  </div>
			  <div class="w-icon"><i class="zmdi zmdi-male-female text-success"></i></div>
			  </div>
			  <div class="progress-wrapper mt-3">
				  <div class="progress mb-0" style="height: 5px;">
				  <div class="progress-bar gradient-success" role="progressbar" style="width: 75%"></div>
				</div>
			 </div>
			</div>
			</div>
		 </div>
		</div>--%>

    <!---- end -->

		<!--- charts -->
		<div class="row">
             <div class="col-12 col-lg-6 col-xl-6">
          <div class="card">
            <div class="card-header">Top Offences</div>
            <div class="card-body">
              <div class="chart-container-6">
                  
               <%-- <canvas id="regionchart"></canvas>--%>
                <%--  <div id="chart"></div>--%>
                    <div id="chart"></div>
			  </div>
               
            </div>
          </div>
        </div>



        <div class="col-12 col-lg-6 col-xl-6">
          <div class="card">
            <div class="card-header"></div>
            <div class="card-body">
                <div class="chart-container-5">
                <div id="columnchart"></div>
			   </div>
            </div>
          <%--  <ul class="list-group list-group-flush">
              <li class="list-group-item"> : <span class="badge badge-warning float-right">325</span></li>
              <li class="list-group-item"> : <span class="badge badge-info float-right">45</span></li>
            </ul>--%>
          </div>
        </div>
        
      </div><!--End Row-->

    



        </div>
      </div>



   

<%--    <script>

        $(function () {
            "use strict";
            var ctx = document.getElementById("regionchart").getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ["Germany", "France", "Switzerland", "Australia"],
                    datasets: [{
                        backgroundColor: [
                            "#14abef",
                            "#02ba5a",
                            "#d13adf",
                            "#fba540"
                        ],
                        data: [55, 220, 40, 40],
                        borderWidth: [0, 0, 0, 0]
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                        display: true,
                        labels: {
                            fontColor: '#585757',
                            boxWidth: 10
                        }
                    }
                }
            });
        });
    </script>--%>
  
    
</asp:Content>
  

     