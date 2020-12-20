<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manage-fine.aspx.cs" Inherits="RoadTransportOffence.Fine.manage_fine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
		    <h4 class="page-title">Manage Fine</h4>
		    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javaScript:void();">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="javaScript:void();">Add Fine</a></li>
            <li class="breadcrumb-item active" aria-current="page">Manage Fine</li>
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




                 <div class="panel-body">

        <div class="panel panel-default" > 
         
                <div class="panel-body">

                    <asp:TextBox ID="txtsearch"   ToolTip="Search by : RefNumber, Module Name etc" 
                        Placeholder="Search" runat="server" AutoPostBack="True" >
                       </asp:TextBox>

                       <span class="input-group-btn">
                     <asp:LinkButton ID="btnSearch" class="btn btn-primary" runat="server" OnClick="btnSearch_Click" > <span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                       </span>


                          <asp:DropDownList        ID="ddlpagesize" runat="server"  AutoPostBack="True" 
                                onselectedindexchanged="ddlpagesize_SelectedIndexChanged"> 
                                <asp:ListItem Selected="True" Value="100">100</asp:ListItem>     
                                <asp:ListItem Value="250">250</asp:ListItem>
                                <asp:ListItem Value="500">500</asp:ListItem>
                                <asp:ListItem Value="1000">1000</asp:ListItem> 
                                <asp:ListItem Value="5000">5000</asp:ListItem>
                                </asp:DropDownList> records per page  
                     <p>

                     </p>
                          
                    <asp:Label ID="lbtotalRow" runat="server" Text=""></asp:Label><hr />
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="450px">
                         <div id="wrapper"> 
                        <asp:GridView ID="grdItemList" runat="server"  ForeColor="Black" 
                            class="table table-striped" HeaderStyle-CssClass="text-white text-uppercase" 
                            HeaderStyle-BackColor="#6167CA" HeaderStyle-ForeColor="White"  Font-Size="13px" AllowPaging="True" 
                              onpageindexchanging="grdItemList_PageIndexChanging"    >
                          <Columns>
                              <asp:TemplateField HeaderText="Action" HeaderStyle-Width="180px">
                                    <ItemTemplate>                                     
                                      <asp:LinkButton       ID="LinkEdit"       runat="server"  ForeColor="Red"  Font-Size="15px"   ToolTip="Edit" class="fa fa-edit"  OnClick="LinkEdit_Click" />  
                                      <asp:LinkButton     ID="btnDelete"      runat="server" ForeColor="Red"   Font-Size="15px"   ToolTip="Delete" class="fa fa-times"  OnClick="LinkItemsDelete_Click"  />
                                       
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" />
                              </asp:TemplateField>        
                              </Columns>                              
                                    <PagerSettings      FirstPageText="First" LastPageText="Last" 
                                    Mode="NumericFirstLast" NextPageText="Next" PageButtonCount="10" PreviousPageText="Previous" />                                 
                                    <PagerStyle Font-Bold="true" Font-Size="Large"    HorizontalAlign="Center"   />                    
                                              
                        </asp:GridView>
                              </div> 
                    </asp:Panel>
                </div>
         </div>
</div>


<%--<<<<<<<<<<<<<<<<<<<<< --------------- Edit Item Popup -------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--%>
        <asp:Button ID="btnShowPopup" runat="server" style="display:none" />         
        <cc1:ModalPopupExtender ID="MpeEditItemShow" runat="server" TargetControlID="btnShowPopup" 
        PopupControlID="pnlpopupEditItemView"  CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>



<asp:UpdatePanel ID="UpdatePanelImageUpload" runat="server"  UpdateMode="Conditional">
            <ContentTemplate> 

<asp:Panel ID="pnlpopupEditItemView"  class="panel panel-primary" runat="server" BackColor="White" style="display:none"  > 
      <div class="panel-heading" style="text-align:left"> 
          <asp:Label ID="lblItemID" runat="server" Text="Label"></asp:Label>:     
            <asp:Label ID="lblitemName" runat="server" Text="Label"></asp:Label>                             
        </div>


               
    <div class="panel-body" style="text-align:left"> 
         <asp:Panel ID="Panel2" runat="server" ScrollBars="Vertical" Height="400px">        
               
               <asp:Label ID="lblmessage" ForeColor="Red" runat="server" Font-Size="11px" Text=""></asp:Label> 
              <br />
                        <div class="col-lg-12">
                   <asp:Label ID="Label1" class="btn btn-success" Font-Size="16px" runat="server" Text="MANAGE FINE INFORMATION"></asp:Label> 
                    <label><asp:Label ID="Label2" runat="server" Style="color:  font-weight: 700; font-size: large;"></asp:Label></label>  
                    <hr />
                    </div>

                    <div class="col-lg-6">

                          <asp:Label ID="Label6" runat="server" Text="Offence Title"></asp:Label><br />
            <asp:TextBox ID="title" class="form-control" ForeColor="Black" runat="server"></asp:TextBox>
            <p></p> 
                    </div>
             

               
             
               <div class="col-lg-6">
                          <asp:Label ID="Label3" runat="server" Text="Amount"></asp:Label><br />
            <asp:TextBox ID="amount" class="form-control" ForeColor="Black" runat="server"></asp:TextBox>
            <p></p> 

                         <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional">
                                 <Triggers> <asp:PostBackTrigger   ControlID="btnUpdate"/></Triggers>      
                            </asp:UpdatePanel>  

            </div>

               </asp:Panel> 
        </div>
    
      <div class="panel-footer">     
     
                    <asp:LinkButton ID="btnUpdate" class="btn btn-labeled btn-success m-b-5" runat="server" AutoPostBack="True" OnClick="btnUpdate_Click" > 
                      <span class="btn-label"><i class="fa fa-edit"></i></span> UPDATE FINE INFO.</asp:LinkButton>

        <asp:LinkButton ID="btnClose" class="btn btn-labeled btn-warning m-b-5" runat="server"> 
                      <span class="btn-label"><i class="fa fa-close"></i></span> CLOSE</asp:LinkButton>   
          
        <br />

                             <asp:TextBox ID="ExportAll_Event"  placeholder="20"   class="form-control" ValidationGroup="vlpg43"  Visible="False" runat="server"></asp:TextBox>
          <asp:TextBox ID="DeleteEvent" runat="server" class="input-block-level" placeholder="Enter Subject here..."  Visible="False" ></asp:TextBox>
          <asp:TextBox ID="Event" runat="server" class="input-block-level" placeholder="Enter Subject here..."  Visible="False" ></asp:TextBox>
          <asp:TextBox ID="txtRole" runat="server" class="span6" Placeholder="Enter txtRole" Width="250px" Visible="False"></asp:TextBox>
    </div>  


    </asp:Panel>
                </ContentTemplate>
                       <Triggers> <asp:PostBackTrigger   ControlID="btnUpdate"/></Triggers>                   

                </asp:UpdatePanel>



               <%--<<<<<<<<<<<<<<<<<<<<< --------------- Inactive user  Popup -------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--%>
        <asp:Button ID="btnShowPopupDeleteItem" runat="server" style="display:none" />         
        <cc1:ModalPopupExtender ID="ModalPopupDeleteItem" runat="server" TargetControlID="btnShowPopupDeleteItem" 
        PopupControlID="pnlpopupDeleteItem"  CancelControlID="btnCloseDeleteItem" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>

<asp:Panel ID="pnlpopupDeleteItem"  class="panel panel-primary" runat="server" BackColor="White" style="display:none"  Width="300px"  DefaultButton="btnDeleteItem"> 
  <asp:Label ID="Label8" runat="server" class="label label-info" Text="Do you want to Delete this Item ?"> </asp:Label>   
  <hr /> 
   <asp:Label ID="lblCodeDeleteItem" runat="server" Text="0"></asp:Label>. 
    <asp:Label ID="lblDeleteItem_CustName" runat="server" Text="0"></asp:Label>  <br />
        <div class="panel-footer"> 
                <asp:Button ID="btnDeleteItem" class="btn btn-success btn-xs" runat="server"   Text="Yes"   onclick="btnDeleteItem_Click"  />
                <asp:Button ID="btnCloseDeleteItem" class="btn btn-danger btn-xs" runat="server" Text="No" />
        </div>
</asp:Panel>


            </div>
           </div>
          </div>






          </div>
        <</div>
      <</div>
    














</asp:Content>
