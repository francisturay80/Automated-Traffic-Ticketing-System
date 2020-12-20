<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Adduser.aspx.cs" Inherits="RoadTransportOffence.Users.Adduser" %>
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
                    <asp:Label ID="Label5" runat="server" Font-Size="12px"  Text="Email Address"></asp:Label> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="txtEmailaddr" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                             
                    <asp:TextBox ID="txtEmailaddr" placeholder="Enter Valid Email" class="form-control" ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                             </div>

                            <div class="col-sm-4 form-group">
                    <asp:Label ID="Label10" runat="server" Font-Size="12px" Text="Department"></asp:Label>
                    <asp:TextBox ID="txtDept"   placeholder="Department" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                 </div>

                            

                            <div class="col-sm-4 form-group">   
                     <asp:Label ID="Label13" runat="server" Font-Size="12px" Text="Date of Birth"></asp:Label>
                        <asp:TextBox ID="txtDOB" placeholder="User Date of Birth" Text="1993-12-19" ToolTip="YYYY-MM-DD"  TextMode="Date" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>

                                 </div>
             

                                <div class="col-sm-4 form-group">
                       <asp:Label ID="Label14" runat="server" Font-Size="12px" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress"     placeholder="User Address" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>  
                                     </div>  
                                            
                                            

                                    

                        <div class="col-sm-4 form-group">
                        <asp:Label ID="Label11" runat="server" Font-Size="12px" Text="User ID"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ValidationGroup="vlpg43"   ControlToValidate="txtUserID" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                            
                        <asp:TextBox ID="txtUserID" placeholder="UserName" ToolTip="User Id for login Please omit space" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                             </div>

                                             <div class="col-sm-4 form-group">
                            <asp:Label ID="Label7" runat="server" Font-Size="12px" Text="Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ValidationGroup="vlpg43"   ControlToValidate="txtPassword" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                            
                        <asp:TextBox ID="txtPassword" placeholder="Password" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                             </div>
                                            
                                             <div class="col-sm-4 form-group">
                        <asp:Label ID="Label9" runat="server" Font-Size="12px" Text="Comfirm Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="txtPassword" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                     
                        <asp:TextBox ID="txtComfirmPassword" placeholder="Confirm Password" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                        </div> 
                                            
                                            

                      
                        <div class="col-sm-4 form-group">
                       <asp:Label ID="Label15" runat="server" Font-Size="12px"   Text="Select Role"></asp:Label> 
                        <asp:RequiredFieldValidator Font-Size="11px"   ValidationGroup="vlpg43" ForeColor="Red" ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRole" ErrorMessage="Please Select Role"></asp:RequiredFieldValidator>   
                        <asp:DropDownList ID="txtRole" class="form-control" runat="server" OnSelectedIndexChanged="txtRole_SelectedIndexChanged">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Accountant</asp:ListItem>
                        <asp:ListItem>Officer</asp:ListItem>
                        </asp:DropDownList>
                                         </div>
        
                      
                    <br />
                             <div class="col-sm-4 form-group">   
                        <asp:UpdatePanel ID="UpdatePanelImageUpload" runat="server"  UpdateMode="Conditional">
                            <ContentTemplate>                                
                                <asp:FileUpload ID="FUpimg"   class="btn btn-warning btn-xs"  runat="server"  Width="320px" />
                               
                            </ContentTemplate>   
<%--                             <Triggers> <asp:PostBackTrigger   ControlID="btnSubmit"/></Triggers>      --%>
                        </asp:UpdatePanel> 
                                 </div>

                    <div class="col-sm-4 form-group">
                          <asp:LinkButton ID="btnSubmit" class="btn btn-labeled btn-success m-b-5" runat="server" OnClick="btnSubmit_Click" > 
                      <span class="btn-label"><i class="fa fa-paper-plane"></i></span>ADD USER</asp:LinkButton>




                    </div>
                       <br /> 
                        
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="vlpg43" ForeColor="Red" 
                        runat="server" ErrorMessage="Please Enter valid Email address"  
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="txtEmailaddr"></asp:RegularExpressionValidator><br />
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
