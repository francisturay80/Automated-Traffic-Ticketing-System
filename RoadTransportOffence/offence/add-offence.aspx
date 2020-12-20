<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add-offence.aspx.cs" Inherits="RoadTransportOffence.offence.add_offence" %>
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
		    <h4 class="page-title">Offence</h4>
		    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javaScript:void();">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="javaScript:void();">Add Offence</a></li>
            <li class="breadcrumb-item active" aria-current="page">Manage Offence</li>
         </ol>
	   </div>
	
     </div>
    <!-- End Breadcrumb-->


	  <div class="row">
	   <div class="col col-lg-12 col-xl-12">
	    <div class="card">
	     <div class="card-header text-uppercase">Add Offence     </div>
                                         <asp:Label ID="lblMsg" runat="server" Style="color:font-weight: 700; font-size: large;"></asp:Label>

		   <div class="card-body">

                <div class="row">

              
                <div class="col-sm-4 form-group">
                                             <asp:Label ID="Label2" runat="server" Font-Size="12px"  Text="Offence Code"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ValidationGroup="vlpg43"   ControlToValidate="offenceCode" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>                     
                    <asp:TextBox ID="offenceCode" placeholder="Offence Code" ToolTip="Please Enter Offence Code" class="form-control"  ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                          </div>

                    <div class="col-sm-4 form-group">  
                    <asp:Label ID="Label3" runat="server" Font-Size="12px"  Text="Offence Title"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="vlpg43"  ControlToValidate="offenceTitle" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="offenceTitle" placeholder="Offence Title" class="form-control" ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                         </div>
                   
                  


                     <div class="col-sm-4 form-group">
                         </div>

                     <div class="col-sm-4 form-group">
                          <asp:LinkButton ID="btnSubmit" class="btn btn-labeled btn-success m-b-5" runat="server" OnClick="btnSubmit_Click" > 
                      <span class="btn-label"><i class="fa fa-paper-plane"></i></span>ADD OFFENCE</asp:LinkButton>


                    </div>



</div>
            </div>
            </div>
          </div>
         </div>
    

</asp:Content>
