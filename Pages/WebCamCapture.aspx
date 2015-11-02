<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MPForm.master" AutoEventWireup="true" CodeFile="WebCamCapture.aspx.cs" Inherits="Pages_WebCamCapture" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<style type="text/css">

	            #profile_pic_wrapper

	            {

	                position: relative;

	                border: #ccc solid 1px;

	                width: 120px;

	                height: 120px;

	                border: none;

	            }

	                #profile_pic_wrapper a

	                {

	                    position: absolute;

	                    display: none;

	                    top: 30;

	                    right: 0;

	                    margin-top: -30px;

	                    line-height: 20px;

	                    padding: 5px;

	                    color: #fff;

	                    background-color: #333;

	                    width: 110px;

	                    text-decoration: underline;

	                    text-align: center;

	                    z-index: 100;

	                    text-decoration: none;

	                    font-family: Arial;

	                    font-size: 10px;

	                }

	 

	                #profile_pic_wrapper:hover a

	                {

	                    position: absolute;

	                    margin: 90px 0px 0px 0px;

	                    display: block;

	                    text-decoration: none;

	                    font-family: Arial;

	                    font-size: 10px;

	                }

	 

	                    #profile_pic_wrapper:hover a:hover

	                    {

	                        text-decoration: none;

	                        font-family: Arial;

	                        font-size: 10px;

	                    }

	 

	            .profile_pic

	 

	            {

	                width: 120px;

	                height: 120px;

	            }

	 

	        </style>

	        <title>Web capture</title>

	     
	     

	 


	 

	<div id="profile_pic_wrapper" style="float: left; padding-left: 35px;">
	 

	<asp:image height="1200" id="img" runat="server" style="float: left;" width="1200">

      <%--  <asp:LinkButton runat="server">LinkButton</asp:LinkButton>--%>

            <%--<asp:TemplateField>
            <asp:linkbutton id="Linkbutton1" onclick="Linkbutton1_Click" runat="server">Change Photo</asp:linkbutton>
            </asp:TemplateField>--%>

	

	 

	</asp:image></div>



</asp:Content>
