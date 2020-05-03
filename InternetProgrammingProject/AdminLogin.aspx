<%@ Page Title="" Language="C#" MasterPageFile="~/NotAuthenticatedMasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

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
		    <h2 class="text-center">Admin Login Now</h2>
		    <div class="login-form">
  <div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase">Username</label>
    <asp:TextBox runat="server" class="form-control" placeholder="Username" ID="txtUsername" />
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">Password</label>
    <asp:TextBox runat="server"  class="form-control" placeholder="Password" ID="txtPassword" TextMode="Password" />
  </div>
  
  
    <div class="form-check">
        <div class="text-center">
        <asp:Button runat="server" class="btn btn-login btn-primary" Text="Admin Login" ID="btnLogin" OnClick="btnLogin_Click" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InternetProgrammingProjectConnectionString2 %>" SelectCommand="SELECT * FROM [Admin]"></asp:SqlDataSource>
       </div>
    </div>
</div>
  </div>
    </div>
    </div>
</section>

</asp:Content>

