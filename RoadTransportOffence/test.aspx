<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="RoadTransportOffence.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
     <link rel="shortcut icon" href="../assets/dist/img/logo_CoatofArm.png" type="image/x-icon">
    <style type="text/css">
        .wizard {
    margin: 20px auto;
    background: #fff;
}

    .wizard .nav-tabs {
        position: relative;
        margin: 40px auto;
        margin-bottom: 0;
        border-bottom-color: #e0e0e0;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

.connecting-line {
    height: 2px;
    background: #e0e0e0;
    position: absolute;
    width: 80%;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 50%;
    z-index: 1;
}

.wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
    color: #555555;
    cursor: default;
    border: 0;
    border-bottom-color: transparent;
}

span.round-tab {
    width: 70px;
    height: 70px;
    line-height: 70px;
    display: inline-block;
    border-radius: 100px;
    background: #fff;
    border: 2px solid #e0e0e0;
    z-index: 2;
    position: absolute;
    left: 0;
    text-align: center;
    font-size: 25px;
}
span.round-tab i{
    color:#555555;
}
.wizard li.active span.round-tab {
    background: #fff;
    border: 2px solid #5bc0de;
    
}
.wizard li.active span.round-tab i{
    color: #5bc0de;
}

span.round-tab:hover {
    color: #333;
    border: 2px solid #333;
}

.wizard .nav-tabs > li {
    width: 25%;
}

.wizard li:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 0;
    margin: 0 auto;
    bottom: 0px;
    border: 5px solid transparent;
    border-bottom-color: #5bc0de;
    transition: 0.1s ease-in-out;
}

.wizard li.active:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 1;
    margin: 0 auto;
    bottom: 0px;
    border: 10px solid transparent;
    border-bottom-color: #5bc0de;
}

.wizard .nav-tabs > li a {
    width: 70px;
    height: 70px;
    margin: 20px auto;
    border-radius: 100%;
    padding: 0;
}

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

.wizard .tab-pane {
    position: relative;
    padding-top: 50px;
}

.wizard h3 {
    margin-top: 0;
}
.step1 .row {
    margin-bottom:10px;
}
.step_21 {
    border :1px solid #eee;
    border-radius:5px;
    padding:10px;
}
.step33 {
    border:1px solid #ccc;
    border-radius:5px;
    padding-left:10px;
    margin-bottom:10px;
}
.dropselectsec {
    width: 97%;
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    outline: none;
    font-weight: normal;
}
.dropselectsec1 {
    width: 74%;
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    outline: none;
    font-weight: normal;
}
.mar_ned {
    margin-bottom:10px;
}
.space {
    margin-top:10px;
}
.wdth {
    width:25%;
}
.birthdrop {
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    width: 16%;
    outline: 0;
    font-weight: normal;
}


/* according menu */
#accordion-container {
    font-size:13px
}
.accordion-header {
    font-size:13px;
	background:#ebebeb;
	margin:5px 0 0;
	padding:7px 20px;
	cursor:pointer;
	color:#fff;
	font-weight:400;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px
}
.unselect_img{
	width:18px;
	-webkit-user-select: none;  
	-moz-user-select: none;     
	-ms-user-select: none;      
	user-select: none; 
}
.active-header {
	-moz-border-radius:5px 5px 0 0;
	-webkit-border-radius:5px 5px 0 0;
	border-radius:5px 5px 0 0;
	background:#F53B27;
}
.active-header:after {
	content:"\f068";
	font-family:'FontAwesome';
	float:right;
	margin:5px;
	font-weight:400
}
.inactive-header {
	background:#333;
}
.inactive-header:after {
	content:"\f067";
	font-family:'FontAwesome';
	float:right;
	margin:4px 5px;
	font-weight:400
}
.accordion-content {
	display:none;
	padding:20px;
	background:#fff;
	border:1px solid #ccc;
	border-top:0;
	-moz-border-radius:0 0 5px 5px;
	-webkit-border-radius:0 0 5px 5px;
	border-radius:0 0 5px 5px
}
.accordion-content a{
	text-decoration:none;
	color:#333;
}
.accordion-content td{
	border-bottom:1px solid #dcdcdc;
}



@media( max-width : 585px ) {

    .wizard {
        width: 90%;
        height: auto !important;
    }

    span.round-tab {
        font-size: 16px;
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard .nav-tabs > li a {
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 35%;
    }
}
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


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
                                         <asp:Label ID="Label1" runat="server" Style="color:font-weight: 700; font-size: large;"></asp:Label>

		   <div class="card-body">

             

     
    <div class="row">
    	<section>
        <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-road"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-user"></i>
                            </span>
                        </a>
                    </li>

                  

                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="fa fa-ambulance"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            <form role="form" >
                <div class="tab-content"><br />

                     <asp:Label ID="lblMsg" runat="server" Style="color:  font-weight: 700; font-size: small;"></asp:Label>

                    <div class="tab-pane active" role="tabpanel" id="step1">

                         <p align="justify"> 
                                            Please ensure you complete this form ONLY if you want to register Birth. Please <b> do not </b> complete this form just to test if it is 
                                                working. It works and the data is used for public Birth  surveillance work.<hr />
                                        </p>

                        <div class="step1">

                            <h5><strong>Step 1 - 4 (Child Info)</strong></h5>

                        <div class="row">
                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Centre Name</label>
                  <asp:TextBox ID="txtCentreName" ToolTip="Please Enter Centre Name" class="form-control" placeholder="Enter Centre Name"  ValidationGroup="vlpg43" runat="server"></asp:TextBox>
                            </div>




                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">First Name of Child</label>
              <asp:TextBox ID="txtFname" class="form-control" placeholder="Enter First Name of Child"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                            </div>



                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Middle Name of Child</label>
                <asp:TextBox ID="txtMname" class="form-control" placeholder="Enter Middle Name of Child"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                            </div>



                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Select Gender</label>
                                   <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="gender" class="form-control" runat="server" >
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Gender</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div> 





                              <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Child Nationality</label>
<div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="nationality" class="form-control" runat="server" >
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Sierra Leonean</asp:ListItem>
                                         
                                        </asp:DropDownList>
                                            </div>                            </div>




                              <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Child Nationality</label>
              <asp:TextBox ID="TextBox2" class="form-control" placeholder="Enter Last Name"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                            </div>


                              <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Last Name of Child</label>
              <asp:TextBox ID="TextBox3" class="form-control" placeholder="Enter Last Name"  ValidationGroup="vlpg43"  runat="server"></asp:TextBox>
                            </div>

                           
                        </div>

                        <div class="row">
                              
                          

 


                          
                       
                        </div>

                    </div>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-primary next-step">Next</button></li>
                        </ul>
                    </div>

                    <div class="tab-pane" role="tabpanel" id="step2">
                        <div class="step2">


                            <h5><strong>Step 2 - 4 (Bio Data)</strong></h5>
                        <hr>

                               <div class="row">
                                     <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Name</label>
                                 <asp:TextBox  class="form-control" ID="Name" Placeholder="Enter Name" runat="server"></asp:TextBox>
                                                </div>
                           


                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Eg. +232</label>
                               <asp:TextBox  class="form-control" ID="CountryCode" disabled="true"  Placeholder="+232"   runat="server"></asp:TextBox>
                            </div>

                          <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Eg. 77</label>
                                    <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList  class="form-control" runat="server" ID="MobileCode" >
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>25</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>31</asp:ListItem>
                                            <asp:ListItem>32</asp:ListItem>
                                            <asp:ListItem>33</asp:ListItem>
                                            <asp:ListItem>34</asp:ListItem>
                                            <asp:ListItem>44</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>76</asp:ListItem>
                                            <asp:ListItem>77</asp:ListItem>
                                            <asp:ListItem>78</asp:ListItem>
                                            <asp:ListItem>79</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>88</asp:ListItem>
                                            <asp:ListItem>99</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div>   

                             </div>  

                            <div class="row">

                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Mobile</label>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"     
                                        ErrorMessage="Number Only"
                                        ControlToValidate="Contact"  ForeColor="Red"   
                                        ValidationExpression="^[0-9]{0,9}$" />
                                            <div class="inpt-group">
                                                 <asp:TextBox  class="form-control" ID="Contact" pattern="(.){0,9}" maxlength="6" Placeholder="Eg. 123456" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                            <%--</div>--%>

                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Age</label>
                                 <asp:TextBox  class="form-control" ID="Age" Placeholder="Enter Age" runat="server"></asp:TextBox>
                                <%--<asp:TextBox   class="form-control" ID="Age" pattern="(.){0,4}" maxlength="4" title="(Enter exactly 0-4 digits)" onkeypress="return IsNumeric(event);" Placeholder="Enter Age" runat="server"></asp:TextBox>--%>
                            </div>

                            </div> 

                            <div class="row">

                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Gender</label>
                                    <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="Sex"  class="form-control" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div>  


                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Address</label>
                                <asp:TextBox   class="form-control" ID="Address" Height="100" TextMode="MultiLine" Placeholder="Enter Address" runat="server"></asp:TextBox>
                            </div>


                            </div>                      



                        </div>
                        <ul class="list-inline pull-right">
                            <br>
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary next-step">Next</button></li>
                        </ul>
                    </div>

                    <div class="tab-pane" role="tabpanel" id="step3">

                          <h5><strong>Step 3 - 4 (Signs and Symptoms)</strong></h5>
                        <hr>


                        <div class="row">
                               <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Do you have a fever or Does patient/deceased have a fever?</label>
                                <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="HaveFever"  class="form-control" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div>   

                         <div class="col-md-6">

                                              <label class="space" for="exampleInputEmail1">What Other signs (are you) or is he/she exhibiting?</label>
                                                <div id="mydiv"  font-family: Calibri;">
                                                <input type="checkbox" name="swimmingpool" id="swimmingpool" value="Sore Throat" />
                                               Sore Throat<br />
                                                <input type="checkbox" name="fitnesscenter" id="fitnesscenter" value="Cough" />
                                                Cough<br />
                                                <input type="checkbox" name="restaurant" id="restaurant" value="Difficiulty in Breathing" />
                                                Difficiulty in Breathing<br />
                                                <input type="checkbox" name="childrenactivities" id="childrenactivities" value="Body pain" />
                                                Body pain<br />
                                                <input type="checkbox" name="complimentarybreakfast " id="complimentarybreakfast"
                                                    value="Headaches" />
                                                Headaches<br />
                                                    <input type="checkbox" name="meetingfacilities" id="meetingfacilities" value="None of the above" />
                                                   None of the above<br />
                                                <asp:TextBox ID="OtherSigns" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                            </div>  
                        
                              

                        </div>

                        <div class="row">

                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Are there any people who you have come in contact with or the patient/deceased has come in contact with in the past 24 hrs?</label>
                                  <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="ContactedWithPeople"  class="form-control" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div>   


                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">If yes, please state how many persons?</label>
                                 <asp:TextBox  class="form-control" ID="NoContactedPeople" Placeholder="Enter Name" runat="server"></asp:TextBox>
                                <%--<asp:TextBox   class="form-control" ID="NoContactedPeople" pattern="(.){0,4}" maxlength="4" title="(Enter exactly 0-4 digits)" onkeypress="return IsNumeric(event);" Placeholder="Enter No Contacted People" runat="server"></asp:TextBox>--%>
                            </div>


                        </div>   
                        
                        <ul class="list-inline pull-right">
                            <br>
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary btn-info-full next-step">Next</button></li>
                        </ul>
                    </div>


                    <div class="tab-pane" role="tabpanel" id="complete">
                        <div class="step44">
                           <p align="justify"> 
                                         Thank for completing the form. Before final submission we advise that you go through the entire 
                                         forms again and verify records. <br />
                                         <br /><b>Note</b><br />
                                         <i>After submission form cannot be edited.</i><br /><br />
                                         Click the Submit button below to submit reported case.<br />
                                            Thanks
                                         <hr />
                                        </p>
                          
                        </div>

                        <ul class="list-inline pull-right">
                            <br>
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                        
                            <li>
                                <%--<button type="submit" class="btn btn-success">Submit</button>--%>
                                <asp:Button class="btn btn-success"  ID="BtnSubmitCase"  runat="server" Text="SUBMIT >>"  onclick="BtnSubmitCase_Click"/>


                            </li>
                        </ul>

                    </div>

                     <asp:TextBox ID="Status" Visible="False" runat="server"></asp:TextBox>
                                                   <asp:TextBox ID="txtAdminMessage" Visible="False" runat="server"></asp:TextBox>
                                                   <asp:TextBox ID="txtReceiverEmail" Visible="False" runat="server"></asp:TextBox>
                                                   <asp:TextBox ID="Telephone" Visible="False" runat="server"></asp:TextBox>
                                                   <asp:TextBox ID="Year" Visible="False" runat="server"></asp:TextBox>
                                                   <asp:TextBox ID="ApplicationDate" Visible="False" runat="server"></asp:TextBox>
                                                   <asp:TextBox ID="txtScholarshiptitle" Visible="False" runat="server"></asp:TextBox>
                                                    <asp:TextBox ID="ScholarshipTitle1" Visible="False" runat="server"></asp:TextBox>
                                                     <asp:TextBox ID="TxtEmail" Visible="False" runat="server"></asp:TextBox>
              <asp:TextBox ID="txtRegion" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
       <asp:TextBox ID="txtDistrict" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
             <asp:TextBox ID="txtChiefdom" runat="server" class="span6" Placeholder="Enter Date" Width="250px" Visible="False"></asp:TextBox>
               <asp:TextBox ID="code" Visible="False" runat="server"></asp:TextBox>

                    <div class="clearfix"></div>
                </div>
            </form>
        </div>
    </section>
   </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //Initialize tooltips
        $('.nav-tabs > li a[title]').tooltip();

        //Wizard
        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

            var $target = $(e.target);

            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });

        $(".next-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);

        });
        $(".prev-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);

        });
    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }
    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }


    //according menu

    $(document).ready(function () {
        //Add Inactive Class To All Accordion Headers
        $('.accordion-header').toggleClass('inactive-header');

        //Set The Accordion Content Width
        var contentwidth = $('.accordion-header').width();
        $('.accordion-content').css({});

        //Open The First Accordion Section When Page Loads
        $('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
        $('.accordion-content').first().slideDown().toggleClass('open-content');

        // The Accordion Effect
        $('.accordion-header').click(function () {
            if ($(this).is('.inactive-header')) {
                $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
                $(this).toggleClass('active-header').toggleClass('inactive-header');
                $(this).next().slideToggle().toggleClass('open-content');
            }

            else {
                $(this).toggleClass('active-header').toggleClass('inactive-header');
                $(this).next().slideToggle().toggleClass('open-content');
            }
        });

        return false;
    });
</script>

      <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
    <script type="text/javascript">
        function updateTextArea() {

            var allVals = [];
            $('#mydiv :checked').each(function () {
                allVals.push($(this).val());
            });
            $('#OtherSigns').val(allVals)
        }
        $(function () {
            $('#mydiv input').click(updateTextArea);
            updateTextArea();
        });


        </script>


</asp:Content>
