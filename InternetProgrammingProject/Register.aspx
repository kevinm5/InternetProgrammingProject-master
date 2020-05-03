<%@ Page Title="" Language="C#" MasterPageFile="~/NotAuthenticatedMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.login-block{
float:left;
width:100%;
padding : 50px 0;
}

.container{background:#D3D3D3; border-radius: 10px; width: 40%; height: 40%;}
.login-sec{padding: 50px 30px; position:relative;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #0069c0;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#6ec6ff; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #0069c0; color:#fff; font-weight:600;}
</style>
<section class="login-block">
    <div class="container">
	<div class="row ">
		<div class="col login-sec">
		    <h2 class="text-center">Register Now</h2>
		    <div class="login-form">
  <div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase">Username</label>
    <asp:TextBox runat="server" class="form-control" placeholder="Username" ID="txtUsername" EnableTheming="True" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" visible="false" runat="server" ControlToValidate="txtUsername" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="registrationValidate">*Field Required</asp:RequiredFieldValidator>
    <asp:Label ID="lblName" runat="server" ForeColor="#CC0000" Text="*Username must be unique"></asp:Label>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Password</label>
    <asp:TextBox runat="server" class="form-control" placeholder="Password" ID="txtPassword" TextMode="Password" />
    <asp:RequiredFieldValidator visible="false" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*Field Required" ForeColor="#CC0000" ValidationGroup="registrationValidate"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator visible="false" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="*Password must be at least 8 characters in length, no more than 15 characters, and include at least one upper and lowercase letter. and one number" ForeColor="#CC0000" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>  
  </div>

  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Repeat Password</label>
    <asp:TextBox runat="server" class="form-control" placeholder="Repeat password" ID="txtRepeatPassword" TextMode="Password" />
    <asp:RequiredFieldValidator visible="false" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRepeatPassword" ErrorMessage="*Field Required" ForeColor="#CC0000" ValidationGroup="registrationValidate"></asp:RequiredFieldValidator>
    <asp:CompareValidator visible="false" ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRepeatPassword" ErrorMessage="*Passwords must match" ForeColor="#CC0000"></asp:CompareValidator>  
  </div>
  
    <div class="form-check">
        <div class="text-center">
        <asp:Button runat="server" class="btn btn-login btn-primary" Text="Register" ID="btnRegister" OnClick="btnRegister_Click" CausesValidation="False" ValidationGroup="registrationValidate" />
                    <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InternetProgrammingProjectConnectionString2 %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
        </div>
    </div>
</div>
  </div>
    </div>
    </div>
</section>

</asp:Content>

