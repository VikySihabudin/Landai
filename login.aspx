<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mplogin.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login">
		 <div class="login-main">
		 		<div class="login-top">
		 			<img src="images/adaro.png" alt="" width="100px" height="60px"/>
		 			<h1>Login <span class="anc-color"> Application</span> </h1>
                    <asp:TextBox ID="txtusername"  runat="server" required=""></asp:TextBox>
                    <asp:TextBox ID="txtpassword" TextMode="Password" type="password"  runat="server" Text="password" required=""></asp:TextBox>
		 			<div class="login-bottom">
			 		  <div class="login-para">
			 			<p><asp:HyperLink ID="HyperLink1" runat="server">Forgot Password</asp:HyperLink></p>
			 		 </div>
			 			<div class="clear"> </div>
		 			</div>
                    <asp:Button ID="btnSubmit" Text="Sign In" type="submit" runat="server" OnClick="btnSubmit_Click" />		 			
		 		</div>
		 	</div>
    </div>
</asp:Content>

