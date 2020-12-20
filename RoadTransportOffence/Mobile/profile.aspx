<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/master.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="RoadTransportOffence.Mobile.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="content-wrapper">
       <div class="content">
                <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                   
                                        <div class="row">

                                             <div class="col-sm-12 form-group">
                                                  <h4><b>MY PROFILE</b></h4><hr />

                                                 <span class="btn-label"><i class="glyphicon glyphicon-bookmark"></i></span> Officer ID: <asp:Label ID="lblUID" runat="server" Text="0"></asp:Label>  
                                             <asp:Label ID="Label11" runat="server" Style="color:  font-weight: 700; font-size: small;"></asp:Label>
                                               &nbsp;&nbsp; 
                                             <asp:Label ID="lblmsg" runat="server" Style="color:  font-weight: 700; font-size: large;"></asp:Label>
                                                  
                                                </div>
                                           
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
                                                    <label>Designation</label>
                                                       <asp:TextBox ID="txtDesignation"  class="form-control" placeholder="Enter Designation"  ToolTip="User Designation " ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                                                   
                                                </div>

                                                 <div class="col-sm-4 form-group">
                                                    <label>Date of Birth</label>
                                                      <asp:TextBox ID="txtDOB"  class="form-control" Type="Date"  runat="server" Required="" placeholder=" DOB ?"></asp:TextBox>
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
                                                   <label>Change Profile Picture</label><br />
                                                       <asp:Image ID="imgUser" class="img-thumbnail" Width="120" Height="120" runat="server" /><br />
                                                            <asp:FileUpload  ID="FUpimg" runat="server"   />   
                                                </div>

                                             <div class="col-sm-4 form-group">

                                                     <%--<asp:Button ID="btnSubmit" runat="server" ValidationGroup="vlpg43" class="btn btn-success"   Text="Update" onclick="btnSubmit_Click" /> <br /><br />--%> 
                                                 <asp:LinkButton ID="btnSubmit" class="btn btn-labeled btn-success m-b-5" runat="server" OnClick="btnSubmit_Click" > 
                      <span class="btn-label"><i class="fa fa-edit"></i></span>UPDATE PROFILE </asp:LinkButton><br />

                                                  <asp:Label ID="Label1" Font-Size="11px" runat="server" Text=""></asp:Label> 
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="vlpg43" ForeColor="Red" 
                        runat="server" ErrorMessage="Wrong Email Format"  
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="txtEmailaddr"></asp:RegularExpressionValidator>  
                                            
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
     
    
       </div>


</asp:Content>

