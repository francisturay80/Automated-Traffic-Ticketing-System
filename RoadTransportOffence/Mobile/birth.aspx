<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/master.Master" AutoEventWireup="true" CodeBehind="birth.aspx.cs" Inherits="RoadTransportOffence.Mobile.birth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <title>Suspected Cases</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="container">

      <script language="javascript" type="text/javascript">
          function CheckNumeric(e) {

              if (window.event) // IE 
              {
                  if ((e.keyCode < 48 || e.keyCode > 57) & e.keyCode != 8) {
                      event.returnValue = false;
                      return false;

                  }
              }
              else { // Fire Fox
                  if ((e.which < 48 || e.which > 57) & e.which != 8) {
                      e.preventDefault();
                      return false;

                  }
              }
          }

    </script>
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

            <form >
                <div class="tab-content"><br />

                     <asp:Label ID="lblMsg" runat="server" Style="color:  font-weight: 700; font-size: small;"></asp:Label>

                    <div class="tab-pane active" role="tabpanel" id="step1">

                         <p align="justify"> 
                                            Please ensure you complete this form ONLY if you suspect a case of corona virus, or if 
                                                you see a suspicious case of death. Please <b> do not </b> complete this form just to test if it is 
                                                working. It works and the data is used for public health emergency surveillance work.<hr />
                                        </p>

                        <div class="step1">

                            <h5><strong>Step 1 - 4 (Instruction)</strong></h5>

                        <div class="row">
                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Case Ref Number</label>
                                <asp:TextBox ID="CaseId" class="form-control"   Placeholder="Case Ref Number" disabled="true"  runat="server"></asp:TextBox>
                            </div>

                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Select case Type</label>
                                   <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="CaseType" class="form-control" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Suspected Corona Case</asp:ListItem>
                                            <asp:ListItem>Suspicious Death</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div> 
                        </div>

                        <div class="row">
                              
                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Select Region</label>
                                    <div class="inpt-group dropdown-select-icon"> 
                                          <asp:DropDownList ID="DLLRegion" class="form-control" Visible="True" runat="server" ValidationGroup="vlpg43"></asp:DropDownList>
                                            </div> 
                            </div> 


                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Select District</label>
                                     <div class="inpt-group dropdown-select-icon"> 
                                          <asp:DropDownList ID="DLLDistrict" class="form-control"  Visible="True" runat="server" ValidationGroup="vlpg43"></asp:DropDownList>
                                            </div> 
                            </div> 


                            <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Select Chiefdom</label>
                                    <div class="inpt-group dropdown-select-icon"> 
                                          <asp:DropDownList ID="DLLChiefdom" class="form-control"  Visible="True"  runat="server" ValidationGroup="vlpg43"></asp:DropDownList>
                                            </div> 
                            </div> 
                       
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
                              
                           <%-- <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">What Other signs (are you) or is he/she exhibiting?</label>
                               <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="OtherSigns"  class="form-control" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Cough</asp:ListItem>
                                            <asp:ListItem>Sore Throat</asp:ListItem>
                                            <asp:ListItem>Headaches</asp:ListItem>
                                            <asp:ListItem>Shortness of breath</asp:ListItem>
                                            <asp:ListItem>None of the above</asp:ListItem>
                                        </asp:DropDownList>
                                            </div> 
                            </div>  --%>

                             <div class="col-md-6">
                                <label class="space" for="exampleInputEmail1">Have you or has the patient recently travelled to any of the following countries?</label>
                                    <div class="inpt-group dropdown-select-icon"> 
                                         <asp:DropDownList ID="ContryTravel"  class="form-control" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>United States</asp:ListItem>
                    <asp:ListItem>Afghanistan</asp:ListItem>
                    <asp:ListItem>Albania</asp:ListItem>
                    <asp:ListItem>Algeria</asp:ListItem>
                    <asp:ListItem>American Samoa</asp:ListItem>
                    <asp:ListItem>Andorra</asp:ListItem>
                    <asp:ListItem>Angola</asp:ListItem>
                    <asp:ListItem>Anguilla</asp:ListItem>
                    <asp:ListItem>Antarctica</asp:ListItem>
                    <asp:ListItem>Antigua And Barbuda</asp:ListItem>
                    <asp:ListItem>Argentina</asp:ListItem>
                    <asp:ListItem>Armenia</asp:ListItem>
                    <asp:ListItem>Aruba</asp:ListItem>
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>Austria</asp:ListItem>
                    <asp:ListItem>Azerbaijan</asp:ListItem>
                    <asp:ListItem>Bahamas</asp:ListItem>
                    <asp:ListItem>Bahrain</asp:ListItem>
                    <asp:ListItem>Bangladesh</asp:ListItem>
                    <asp:ListItem>Barbados</asp:ListItem>
                    <asp:ListItem>Belarus</asp:ListItem>
                    <asp:ListItem>Belgium</asp:ListItem>
                    <asp:ListItem>Belize</asp:ListItem>
                    <asp:ListItem>Benin</asp:ListItem>
                    <asp:ListItem>Bermuda</asp:ListItem>
                    <asp:ListItem>Bhutan</asp:ListItem>
                    <asp:ListItem>Bolivia</asp:ListItem>
                    <asp:ListItem>Bosnia And Herzegowina</asp:ListItem>
                    <asp:ListItem>Botswana</asp:ListItem>
                    <asp:ListItem>Bouvet Island</asp:ListItem>
                    <asp:ListItem>Brazil</asp:ListItem>
                    <asp:ListItem>British Indian Ocean Territory</asp:ListItem>
                    <asp:ListItem>Brunei Darussalam</asp:ListItem>
                    <asp:ListItem>Bulgaria</asp:ListItem>
                    <asp:ListItem>Burkina Faso</asp:ListItem>
                    <asp:ListItem>Burundi</asp:ListItem>
                    <asp:ListItem>Cambodia</asp:ListItem>
                    <asp:ListItem>Cameroon</asp:ListItem>
                    <asp:ListItem>Canada</asp:ListItem>
                    <asp:ListItem>Cape Verde</asp:ListItem>
                    <asp:ListItem>Cayman Islands</asp:ListItem>
                    <asp:ListItem>Central African Republic</asp:ListItem>
                    <asp:ListItem>Chad</asp:ListItem>
                    <asp:ListItem>Chile</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                    <asp:ListItem>Christmas Island</asp:ListItem>
                    <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                    <asp:ListItem>Colombia</asp:ListItem>
                    <asp:ListItem>Comoros</asp:ListItem>
                    <asp:ListItem>Congo</asp:ListItem>
                    <asp:ListItem>Cook Islands</asp:ListItem>
                    <asp:ListItem>Costa Rica</asp:ListItem>
                    <asp:ListItem>Cote D'Ivoire</asp:ListItem>
                    <asp:ListItem>Croatia (Local Name: Hrvatska)</asp:ListItem>
                    <asp:ListItem>Cuba</asp:ListItem>
                    <asp:ListItem>Cyprus</asp:ListItem>
                    <asp:ListItem>Czech Republic</asp:ListItem>
                    <asp:ListItem>Denmark</asp:ListItem>
                    <asp:ListItem>Djibouti</asp:ListItem>
                    <asp:ListItem>Dominica</asp:ListItem>
                    <asp:ListItem>Dominican Republic</asp:ListItem>
                    <asp:ListItem>East Timor</asp:ListItem>
                    <asp:ListItem>Ecuador</asp:ListItem>
                    <asp:ListItem>Egypt</asp:ListItem>
                    <asp:ListItem>El Salvador</asp:ListItem>
                    <asp:ListItem>Equatorial Guinea</asp:ListItem>
                    <asp:ListItem>Eritrea</asp:ListItem>
                    <asp:ListItem>Estonia</asp:ListItem>
                    <asp:ListItem>Ethiopia</asp:ListItem>
                    <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                    <asp:ListItem>Faroe Islands</asp:ListItem>
                    <asp:ListItem>Fiji</asp:ListItem>
                    <asp:ListItem>Finland</asp:ListItem>
                    <asp:ListItem>France</asp:ListItem>
                    <asp:ListItem>French Guiana</asp:ListItem>
                    <asp:ListItem>French Polynesia</asp:ListItem>
                    <asp:ListItem>French Southern Territories</asp:ListItem>
                    <asp:ListItem>Gabon</asp:ListItem>
                    <asp:ListItem>Gambia</asp:ListItem>
                    <asp:ListItem>Georgia</asp:ListItem>
                    <asp:ListItem>Germany</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Gibraltar</asp:ListItem>
                    <asp:ListItem>Greece</asp:ListItem>
                    <asp:ListItem>Greenland</asp:ListItem>
                    <asp:ListItem>Grenada</asp:ListItem>
                    <asp:ListItem>Guadeloupe</asp:ListItem>
                    <asp:ListItem>Guam</asp:ListItem>
                    <asp:ListItem>Guatemala</asp:ListItem>
                    <asp:ListItem>Guinea</asp:ListItem>
                    <asp:ListItem>Guinea-Bissau</asp:ListItem>
                    <asp:ListItem>Guyana</asp:ListItem>
                    <asp:ListItem>Haiti</asp:ListItem>
                    <asp:ListItem>Honduras</asp:ListItem>
                    <asp:ListItem>Hong Kong</asp:ListItem>
                    <asp:ListItem>Hungary</asp:ListItem>
                    <asp:ListItem>Icel And</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>Indonesia</asp:ListItem>
                    <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                    <asp:ListItem>Iraq</asp:ListItem>
                    <asp:ListItem>Ireland</asp:ListItem>
                    <asp:ListItem>Israel</asp:ListItem>
                    <asp:ListItem>Italy</asp:ListItem>
                    <asp:ListItem>Jamaica</asp:ListItem>
                    <asp:ListItem>Japan</asp:ListItem>
                    <asp:ListItem>Jordan</asp:ListItem>
                    <asp:ListItem>Kazakhstan</asp:ListItem>
                    <asp:ListItem>Kenya</asp:ListItem>
                    <asp:ListItem>Kiribati</asp:ListItem>
                    <asp:ListItem>Korea</asp:ListItem>
                    <asp:ListItem>Kuwait</asp:ListItem>
                    <asp:ListItem>Kyrgyzstan</asp:ListItem>
                    <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                    <asp:ListItem>Latvia</asp:ListItem>
                    <asp:ListItem>Lebanon</asp:ListItem>
                    <asp:ListItem>Lesotho</asp:ListItem>
                    <asp:ListItem>Liberia</asp:ListItem>
                    <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                    <asp:ListItem>Liechtenstein</asp:ListItem>
                    <asp:ListItem>Lithuania</asp:ListItem>
                    <asp:ListItem>Luxembourg</asp:ListItem>
                    <asp:ListItem>Macau</asp:ListItem>
                    <asp:ListItem>Macedonia</asp:ListItem>
                    <asp:ListItem>Madagascar</asp:ListItem>
                    <asp:ListItem>Malawi</asp:ListItem>
                    <asp:ListItem>Malaysia</asp:ListItem>
                    <asp:ListItem>Maldives</asp:ListItem>
                    <asp:ListItem>Mali</asp:ListItem>
                    <asp:ListItem>Malta</asp:ListItem>
                    <asp:ListItem>Marshall Islands</asp:ListItem>
                    <asp:ListItem>Martinique</asp:ListItem>
                    <asp:ListItem>Mauritania</asp:ListItem>
                    <asp:ListItem>Mauritius</asp:ListItem>
                    <asp:ListItem>Mayotte</asp:ListItem>
                    <asp:ListItem>Mexico</asp:ListItem>
                    <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                    <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                    <asp:ListItem>Monaco</asp:ListItem>
                    <asp:ListItem>Mongolia</asp:ListItem>
                    <asp:ListItem>Montserrat</asp:ListItem>
                    <asp:ListItem>Morocco</asp:ListItem>
                    <asp:ListItem>Mozambique</asp:ListItem>
                    <asp:ListItem>Myanmar</asp:ListItem>
                    <asp:ListItem>Namibia</asp:ListItem>
                    <asp:ListItem>Nauru</asp:ListItem>
                    <asp:ListItem>Nepal</asp:ListItem>
                    <asp:ListItem>Netherlands</asp:ListItem>
                    <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                    <asp:ListItem>New Caledonia</asp:ListItem>
                    <asp:ListItem>New Zealand</asp:ListItem>
                    <asp:ListItem>Nicaragua</asp:ListItem>
                    <asp:ListItem>Niger</asp:ListItem>
                    <asp:ListItem>Nigeria</asp:ListItem>
                    <asp:ListItem>Niue</asp:ListItem>
                    <asp:ListItem>Norfolk Island</asp:ListItem>
                    <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                    <asp:ListItem>Norway</asp:ListItem>
                    <asp:ListItem>Oman</asp:ListItem>
                    <asp:ListItem>Pakistan</asp:ListItem>
                    <asp:ListItem>Palau</asp:ListItem>
                    <asp:ListItem>Panama</asp:ListItem>
                    <asp:ListItem>Papua New Guinea</asp:ListItem>
                    <asp:ListItem>Paraguay</asp:ListItem>
                    <asp:ListItem>Peru</asp:ListItem>
                    <asp:ListItem>Philippines</asp:ListItem>
                    <asp:ListItem>Pitcairn</asp:ListItem>
                    <asp:ListItem>Poland</asp:ListItem>
                    <asp:ListItem>Portugal</asp:ListItem>
                    <asp:ListItem>Puerto Rico</asp:ListItem>
                    <asp:ListItem>Qatar</asp:ListItem>
                    <asp:ListItem>Reunion</asp:ListItem>
                    <asp:ListItem>Romania</asp:ListItem>
                    <asp:ListItem>Russian Federation</asp:ListItem>
                    <asp:ListItem>Rwanda</asp:ListItem>
                    <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                    <asp:ListItem>Saint Lucia</asp:ListItem>
                    <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                    <asp:ListItem>Samoa</asp:ListItem>
                    <asp:ListItem>San Marino</asp:ListItem>
                    <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                    <asp:ListItem>Senegal</asp:ListItem>
                    <asp:ListItem>Seychelles</asp:ListItem>
                    <asp:ListItem>Sierra Leone</asp:ListItem>
                    <asp:ListItem>Singapore</asp:ListItem>
                    <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                    <asp:ListItem>Slovenia</asp:ListItem>
                    <asp:ListItem>Solomon Islands</asp:ListItem>
                    <asp:ListItem>Somalia</asp:ListItem>
                    <asp:ListItem>South Africa</asp:ListItem>
                    <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                    <asp:ListItem>Spain</asp:ListItem>
                    <asp:ListItem>Sri Lanka</asp:ListItem>
                    <asp:ListItem>St. Helena</asp:ListItem>
                    <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                    <asp:ListItem>Sudan</asp:ListItem>
                    <asp:ListItem>Suriname</asp:ListItem>
                    <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                    <asp:ListItem>Sw Aziland</asp:ListItem>
                    <asp:ListItem>Sweden</asp:ListItem>
                    <asp:ListItem>Switzerland</asp:ListItem>
                    <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                    <asp:ListItem>Taiwan</asp:ListItem>
                    <asp:ListItem>Tajikistan</asp:ListItem>
                    <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                    <asp:ListItem>Thailand</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                    <asp:ListItem>Tokelau</asp:ListItem>
                    <asp:ListItem>Tonga</asp:ListItem>
                    <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                    <asp:ListItem>Tunisia</asp:ListItem>
                    <asp:ListItem>Turkey</asp:ListItem>
                    <asp:ListItem>Turkmenistan</asp:ListItem>
                    <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                    <asp:ListItem>Tuvalu</asp:ListItem>
                    <asp:ListItem>Uganda</asp:ListItem>
                    <asp:ListItem>Ukraine</asp:ListItem>
                    <asp:ListItem>United Arab Emirates</asp:ListItem>
                    <asp:ListItem>United Kingdom</asp:ListItem>
                    <asp:ListItem>United States</asp:ListItem>
                    <asp:ListItem>United States Minor Is.</asp:ListItem>
                    <asp:ListItem>Uruguay</asp:ListItem>
                    <asp:ListItem>Uzbekistan</asp:ListItem>
                    <asp:ListItem>Vanuatu</asp:ListItem>
                    <asp:ListItem>Venezuela</asp:ListItem>
                    <asp:ListItem>Viet Nam</asp:ListItem>
                    <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                    <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                    <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                    <asp:ListItem>Western Sahara</asp:ListItem>
                    <asp:ListItem>Yemen</asp:ListItem>
                    <asp:ListItem>Yugoslavia</asp:ListItem>
                    <asp:ListItem>Zaire</asp:ListItem>
                    <asp:ListItem>Zambia</asp:ListItem>
                    <asp:ListItem>Zimbabwe</asp:ListItem> 
                    </asp:DropDownList>
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
<%--                                <asp:Button class="btn btn-success"  ID="BtnSubmitCase"  runat="server" Text="SUBMIT >>"  onclick="BtnSubmitCase_Click"/>--%>

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

      <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>--%>
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
