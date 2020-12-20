<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RoadTransportOffence.Dashboard.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
<%--    <script type="text/javascript" src="https://www.google.com/jsapi"></script>  --%>
     <script src="../assets/jsapi" type="text/javascript"></script>     
    <script src="../assets/jquery-1.8.2.js" type="text/javascript"></script>
   <script type="text/javascript">
       google.load('visualization', '1', { packages: ['corechart'] });
        // google.load('visualization', '1.1', { 'packages': ['bar'] });
   </script>  

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

            for (var i = 0; i < dataValues.length; i++) {
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

     
    <!---- end -->

		<!--- charts -->
		<div class="row">
             <div class="col-12 col-lg-6 col-xl-6">
          <div class="card">
            <div class="card-header">Top Offences</div>
            <div class="card-body">
              <div class="chart-container-6">
                  
             
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
         
          </div>
        </div>
        
      </div><!--End Row-->

    



        </div>
      </div>



   


  
    
</asp:Content>
  

     