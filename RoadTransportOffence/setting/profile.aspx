<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="RoadTransportOffence.setting.profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
		    <h4 class="page-title">Profile Management</h4>
		    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javaScript:void();">Manage Profile</a></li>
           
         </ol>
	   </div>
	
     </div>
    <!-- End Breadcrumb-->


	  <div class="row">
	   <div class="col col-lg-12 col-xl-12">
	    <div class="card">
	     <div class="card-header text-uppercase">Update Profile     </div>
       <asp:Label ID="lblmsg" runat="server" Style="color:font-weight: 700; font-size: large;"></asp:Label>

		   <div class="card-body">
                <div class="row">
                    

                   
<%--                                         <asp:Label ID="lblmsg" runat="server"></asp:Label>--%>
                    <asp:Label runat="server" ID="lblUID" Visible="false"></asp:Label>

                                             
                                              <div class="col-sm-4 form-group">
                                                   <label for="txtFname">First Name</label>
                                                    <asp:TextBox ID="txtFname" ToolTip="Please Enter User Name" class="form-control" placeholder="Enter First Name"  ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                                </div>

                                               <div class="col-sm-4 form-group">
                                                      <label>Last Name</label>
                                                    <asp:TextBox ID="txtLName" class="form-control" placeholder="Enter Last Name"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                                                </div>

                                                <div class="col-sm-4 form-group">
                                                    <label>Telephone</label>
                                                     <asp:TextBox ID="txtPhone" class="form-control" placeholder="Enter Telephone"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                                                </div>


                                                <div class="col-sm-4 form-group">
                                                        <label>Email</label>               
                                            <asp:TextBox ID="txtEmailaddr" class="form-control" placeholder="Enter Email"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                                               
                                                </div>

                                                <div class="col-sm-4 form-group">
                                                    <label>Department</label>
                                                      <asp:TextBox ID="txtDept"   class="form-control" placeholder="Enter Department"  ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                                </div>

                                                
                                               

                                                 <div class="col-sm-4 form-group">
                                                    <label>Date of Birth</label>
                                                      <asp:TextBox ID="txtDOB" class="form-control"  Text="1993-12-19" ToolTip="YYYY-MM-DD"   ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                                    <asp:CalendarExtender ID="CalendarExtender2"  TargetControlID="txtDOB" runat="server" ></asp:CalendarExtender>
                                                </div>

                                                
                                                <div class="col-sm-4 form-group">
                                                    <label>User Role</label>
                                                       <asp:TextBox ID="txtRole" class="form-control" placeholder="User Role"  disabled="true" ValidationGroup="vlpg43" runat="server"></asp:TextBox> 
                                                    
                                                </div>


                                                <div class="col-sm-4 form-group">
                                                   <label>Address</label>
                                                       <asp:TextBox ID="txtAddress"     placeholder="User Address" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>  
                                                    
                                                </div>

                                          
                                            

                                            
                                            <div class="col-sm-4 form-group">
                          
                        <asp:UpdatePanel ID="UpdatePanelImageUpload" runat="server"  UpdateMode="Conditional">
                            <ContentTemplate>                                
                                 <p> <asp:FileUpload  ID="FUpimg"    class="btn btn-primary btn-sm"  runat="server"   />  </p><br />
                       <asp:Image ID="imgUser" class="img-thumbnail" Width="120" Height="120" runat="server" />

                          
                        </ContentTemplate>   
                             <Triggers> <asp:PostBackTrigger   ControlID="btnSubmit"/></Triggers> 
                        </asp:UpdatePanel>
                                                </div>
                                           
                                             <div class="col-sm-4 form-group">
                                                 <asp:LinkButton ID="btnSubmit" class="btn btn-labeled btn-success m-b-5" runat="server" OnClick="btnSubmit_Click" > 
                      <span class="btn-label"><i class="fa fa-edit"></i></span>Update Profile </asp:LinkButton><br />
                                          </div>  
                     <asp:TextBox ID="TextBox1" runat="server" class="span6" Placeholder="Enter txtRole" Width="250px" Visible="False"></asp:TextBox>
      <asp:TextBox ID="Event" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtUsername" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>                                                                                          
                    

                                          
                                     </div>
                             </div>















                </div>
               </div>
            </div>
           </div>
          </div>
      
    
</asp:Content>
