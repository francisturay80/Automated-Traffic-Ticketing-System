<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="RoadTransportOffence.Users.ResetPassword" %>
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
		    <h4 class="page-title">Administration</h4>
		    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javaScript:void();">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="javaScript:void();">Add User</a></li>
            <li class="breadcrumb-item active" aria-current="page">Manage User</li>
         </ol>
	   </div>
	
     </div>
    <!-- End Breadcrumb-->


	  <div class="row">
	   <div class="col col-lg-12 col-xl-12">
	    <div class="card">
	     <div class="card-header text-uppercase">Add User     </div>
                                         <asp:Label ID="lblMsg" runat="server" Style="color:font-weight: 700; font-size: large;"></asp:Label>

		   <div class="card-body">
			

                <div class="row">




                     <div class="col-sm-12">
                                <div class="panel panel-bd lobidrag">
                                    <div class="panel panel-bd lobidrag">
                                    </div>
                                      <div class="panel-heading">
                                        <div class="btn-group"> 
                                            <a class="btn btn-success" href="#"> <i class="fa fa-grid"></i>  Please enter user details below</a>  
<%--                                             <asp:Label ID="lblmsg" runat="server" Style="color:  font-weight: 700; font-size: small;"></asp:Label></label>--%>
                                        </div>
                                    </div>

                                        
                                    <div class="panel-body">
                                        
                                        <form class="col-sm-12">
                                             <div class="col-sm-8 form-group">
                                          <asp:Label ID="Label11" runat="server" Font-Size="12px" Text="Username *"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ValidationGroup="vlpg43"   ControlToValidate="txtUsername" runat="server" ErrorMessage="Username Required"></asp:RequiredFieldValidator>                            
                        <asp:TextBox ID="txtUsername" placeholder="UserName" ToolTip="User Id for login Please omit space" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                     </div>  
                          

                                <div class="col-sm-8 form-group">
                                    <asp:Label ID="Label7" runat="server" Font-Size="12px" Text="Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ValidationGroup="vlpg43"   ControlToValidate="txtPassword" runat="server" ErrorMessage="Password Required"></asp:RequiredFieldValidator>                            
                        <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                     </div>  

                                     <div class="col-sm-8 form-group">
                        <asp:Label ID="Label9" runat="server" Font-Size="12px" Text="Comfirm Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="txtPassword" runat="server" ErrorMessage="Please Confirm Password"></asp:RequiredFieldValidator>                     
                        <asp:TextBox ID="txtComfirmPassword" TextMode="Password" placeholder="Confirm Password" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                              
                        <br />    
                        <asp:UpdatePanel ID="UpdatePanelImageUpload" runat="server"  UpdateMode="Conditional">
                            <ContentTemplate>                                
                                <%--<asp:FileUpload ID="FUpimg"   class="btn btn-warning btn-xs"  runat="server"  Width="320px" /> <br />--%> 
                                <asp:Button ID="BtnResetPass" runat="server" ValidationGroup="vlpg43" class="btn btn-primary btn-sm"   Text="Reset Password" onclick="BtnResetPass_Click" /> 
                            </ContentTemplate>   
                             <Triggers> <asp:PostBackTrigger   ControlID="BtnResetPass"/></Triggers>      
                        </asp:UpdatePanel> 
                       <br /> 
                    <asp:TextBox ID="Event" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
                     </div>  
                                                  <div class="col-sm-8 form-group">
                                                
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="vlpg43" ForeColor="Red" 
                        ErrorMessage="Don't Match Password" ControlToCompare="txtComfirmPassword" 
                        ControlToValidate="txtPassword"></asp:CompareValidator> 
                                 </div>

                                           <%--  <div class="col-sm-6 form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Title "></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red"  ControlToValidate="txtTaskTitle" runat="server" ErrorMessage="Task Title Required"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTaskTitle" class="form-control"   runat="server"></asp:TextBox>
                            </div>
                   --%>
                                         </form>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         
                    

















                    </div>
               </div>
            </div>
           </div>
          </div>
        </div>

    

</asp:Content>
