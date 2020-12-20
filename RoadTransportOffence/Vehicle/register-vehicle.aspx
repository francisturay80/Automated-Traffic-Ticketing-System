<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="register-vehicle.aspx.cs" Inherits="RoadTransportOffence.Vehicle.register_vehicle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>




    <div class="clearfix"></div>
	
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumb-->
     <div class="row pt-2 pb-2">
        <div class="col-sm-9">
		    <h4 class="page-title">Vehicle</h4>
		    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javaScript:void();">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="javaScript:void();">Add Vehicle</a></li>
            <li class="breadcrumb-item active" aria-current="page">Manage Vehicle</li>
         </ol>
	   </div>
	
     </div>
    <!-- End Breadcrumb-->


	  <div class="row">
	   <div class="col col-lg-12 col-xl-12">
	    <div class="card">
	     <div class="card-header text-uppercase">Add Vehicle     </div>
                                         <asp:Label ID="lblMsg" runat="server" Style="color:font-weight: 700; font-size: large;"></asp:Label>

		   <div class="card-body">
			

                <div class="row">

              
                <div class="col-sm-4 form-group">
                                             <asp:Label ID="Label2" runat="server" Font-Size="12px"  Text="First Name"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ValidationGroup="vlpg43"   ControlToValidate="txtFname" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                     
                    <asp:TextBox ID="txtFname" placeholder="First Name" ToolTip="Please Enter User Name" class="form-control"  ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                          </div>

                    <div class="col-sm-4 form-group">  
                    <asp:Label ID="Label3" runat="server" Font-Size="12px"  Text="Last Name"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="txtLname" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLName" placeholder="Last Name" class="form-control" ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                         </div>

                      <div class="col-sm-4 form-group">
                       <asp:Label ID="Label24" runat="server" Font-Size="12px"   Text="Mobile Code"></asp:Label>
                        <asp:DropDownList ID="MobileCode" class="form-control" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>23225</asp:ListItem>
                            <asp:ListItem>23230</asp:ListItem>
                            <asp:ListItem>23231</asp:ListItem>
                            <asp:ListItem>23232</asp:ListItem>
                            <asp:ListItem>23233</asp:ListItem>
                            <asp:ListItem>23234</asp:ListItem>
                            <asp:ListItem>23244</asp:ListItem>
                            <asp:ListItem>23275</asp:ListItem>
                            <asp:ListItem>23276</asp:ListItem>
                            <asp:ListItem>23277</asp:ListItem>
                            <asp:ListItem>23278</asp:ListItem>
                            <asp:ListItem>23279</asp:ListItem>
                            <asp:ListItem>23280</asp:ListItem>
                            <asp:ListItem>23288</asp:ListItem>
                            <asp:ListItem>23299</asp:ListItem>
                        </asp:DropDownList>
                               <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator17" runat="server" ErrorMessage="* Select Mobile Code" ControlToValidate="MobileCode" Display="Dynamic" ForeColor="IndianRed" ValidationGroup="add" InitialValue="0"></asp:RequiredFieldValidator>
                             
                                         </div>


                    <div class="col-sm-4 form-group">
                    <asp:Label ID="Label4" runat="server" Font-Size="12px"  Text="Phone"></asp:Label>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="txtPhone" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>  
                    <asp:TextBox ID="txtPhone" placeholder="Phone Number" class="form-control" ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                         </div>

                        <div class="col-sm-4 form-group">
                    <asp:Label ID="Label5" runat="server" Font-Size="12px"  Text=" Address"></asp:Label> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="address" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                             
                    <asp:TextBox ID="address"  class="form-control" ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                             </div>

                      <div class="col-sm-4 form-group">
                    <asp:Label ID="Label1" runat="server" Font-Size="12px" Text="Vehicle No"></asp:Label>
                    <asp:TextBox ID="txtNo"   placeholder="Vehicle No" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                 </div>

                            <div class="col-sm-4 form-group">
                    <asp:Label ID="Label10" runat="server" Font-Size="12px" Text="Vehicle Model"></asp:Label>
                    <asp:TextBox ID="txtModel"   placeholder="Vehicle Model" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                 </div>

                            

             

                                <div class="col-sm-4 form-group">
                       <asp:Label ID="Label14" runat="server" Font-Size="12px" Text="Vehicle Color"></asp:Label>
                        <asp:TextBox ID="color"     placeholder="Vehicle Color" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>  
                                     </div>  
                                            
                                            

                                    

                        <div class="col-sm-4 form-group">
                        <asp:Label ID="Label11" runat="server" Font-Size="12px" Text="Capacity"></asp:Label>
                        <asp:TextBox ID="capacity" placeholder="Capacity" ToolTip="User Id for login Please omit space" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                             </div>

                       
                       
        
                   
                             

                    <div class="col-sm-4 form-group">
                          <asp:LinkButton ID="btnSubmit" class="btn btn-labeled btn-success m-b-5" runat="server" OnClick="btnSubmit_Click" > 
                      <span class="btn-label"><i class="fa fa-paper-plane"></i></span>Register Vehicle</asp:LinkButton>




                    </div>
                       <br /> 
                        
                      <br />
                   <%--<asp:TextBox ID="txtRole" runat="server" class="span6" Placeholder="Enter txtRole" Width="250px" Visible="False"></asp:TextBox>--%>
      <asp:TextBox ID="txtRole2" runat="server" class="span6" Placeholder="Enter txtRole" Width="250px" Visible="False"></asp:TextBox>
       <asp:TextBox ID="Event" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
       <asp:TextBox ID="txtID" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
                           <asp:TextBox ID="name" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
                           <asp:TextBox ID="phone" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>


                  </div>


		   </div>
		</div>
	   </div>
</asp:Content>
