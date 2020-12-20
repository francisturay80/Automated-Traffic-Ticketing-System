<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/master.Master" AutoEventWireup="true" CodeBehind="create-ticket.aspx.cs" Inherits="RoadTransportOffence.Mobile.create_ticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <asp:HiddenField ID="HiddenFieldBid" runat="server" />
    <asp:HiddenField ID="HiddenFieldBtnType" runat="server" />

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <div class="content-wrapper">
       <div class="content">
                <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                   
                                        <div class="row">

                                             <div class="col-sm-12 form-group">
                                                  <h4><b>ADD OFFENCE</b></h4><hr />
                          <asp:Label ID="lblMsg" runat="server" Style="color:  font-weight: 700; font-size: small;"></asp:Label>
                                          </div>

                                             <div class="col-sm-4 form-group">
                                          <asp:TextBox ID="TicketNo" placeholder="Ticket Number" ToolTip="Ticket No" class="form-control"  runat="server"></asp:TextBox>
                        </div>



                                    <div class="col-sm-4 form-group">
                                                      <asp:DropDownList ID="offence" class="form-control" runat="server">
                                                          <asp:ListItem>Select</asp:ListItem>
                                                          </asp:DropDownList>
                        </div>
                                           
                                        <div class="col-sm-4 form-group">
                                          <asp:TextBox ID="vehno" placeholder="Vehicle Number" ToolTip="Please Enter VehicleNo" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-sm-4 form-group">
           
                            <asp:TextBox ID="licenceNo" placeholder="Enter Liscence No" class="form-control" ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                        </div>




                       

                         

                       



                             <div class="col-sm-4 form-group">   
                        <asp:UpdatePanel ID="UpdatePanelImageUpload" runat="server"  UpdateMode="Conditional">
                            <ContentTemplate>                                
                                <%--<asp:FileUpload ID="FUpimg"   class="btn btn-warning btn-xs"  runat="server"  Width="320px" /> <br /> <br />--%>
                                 <asp:LinkButton ID="btnSubmit" class="btn btn-labeled btn-success m-b-5" runat="server" OnClick="btnSubmit_Click" > 
                      <span class="btn-label"><i class="fa fa-paper-plane"></i></span> ADD OFFENCE</asp:LinkButton>
                            </ContentTemplate>   
                             <Triggers> <asp:PostBackTrigger   ControlID="btnSubmit"/></Triggers>      
                        </asp:UpdatePanel> 
                       <br /> 
                        
                       <br />
      <asp:TextBox ID="txtRole2" runat="server" class="span6" Placeholder="Enter txtRole" Width="250px" Visible="False"></asp:TextBox>
       <asp:TextBox ID="Event" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
                     </div>

                                             <asp:TextBox ID="smsNumber" runat="server" class="span6" Placeholder="Enter Username" Width="250px" Visible="False"></asp:TextBox>  
        <asp:TextBox ID="txtMessage" runat="server" class="span6" Placeholder="Enter Username" Width="250px" Visible="False"></asp:TextBox>  
        <asp:TextBox ID="texSender" runat="server"  class="input-block-level" placeholder="Enter Sender Name here..."    Visible="False" ></asp:TextBox>
        <asp:TextBox ID="texApi" runat="server" class="input-block-level" placeholder="Enter SMS Title here..."   Visible="False" ></asp:TextBox>
        <asp:TextBox ID="txtMobile" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txtRole" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txtID" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txtStatus" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
        <asp:TextBox ID="phone" placeholder="phone" class="form-control" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="name" placeholder="owner Name" class="form-control" runat="server" Visible="False"></asp:TextBox>
       <asp:TextBox ID="amount" placeholder="fine" class="form-control" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="wname" placeholder="warden name" class="form-control" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="lblid" placeholder="warden name" class="form-control" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="date" placeholder="warden name" class="form-control" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="lbldate" placeholder="warden name" class="form-control" runat="server" Visible="False"></asp:TextBox>



                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
           </div>
     
    
       </div>
    

</asp:Content>
