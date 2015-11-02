<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
      
  
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml" >  
<head id="Head1" runat="server">  
    <title>Ajax AsyncFileUpload - How to rename file when save in server</title>  



<link rel="STYLESHEET" type="text/css" href="js/codebase/dhtmlxtabbar.css">
<script  src="js/codebase/dhtmlxcommon.js"></script>
<script  src="js/codebase/dhtmlxtabbar.js"></script>
 
<h1 id="init_tabbar_from_script">Init tabbar from script</h1>

<div id="a_tabbar" style="width:1000px; height:390px;"/></div>


</head>  
<body>  
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id='divUpload1' style="width:100%; height:100%; padding: 5px; background-color: #f0f8ff;">
    <asp:Label runat="server" ID="myThrobber1" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif"/></asp:Label>
        <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server"
            onuploadcomplete="AjaxFileUpload1_UploadComplete" ThrobberID="myThrobber" MaximumNumberOfFiles="8" AllowedFileTypes="jpg,jpeg"/>
    </div>

    <div id='divUpload2' style="width:100%; height:100%; padding: 5px; background-color: #f0f8ff;">
    <asp:Label runat="server" ID="myThrobber2" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif"/></asp:Label>
        <asp:AjaxFileUpload ID="AjaxFileUpload2" runat="server"
            onuploadcomplete="AjaxFileUpload2_UploadComplete" ThrobberID="myThrobber" MaximumNumberOfFiles="8" AllowedFileTypes="jpg,jpeg"/>
    </div>

    <div id='divUpload3' style="width:100%; height:100%; padding: 5px; background-color: #f0f8ff;">
    <asp:Label runat="server" ID="Label1" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif"/></asp:Label>
        <asp:AjaxFileUpload ID="AjaxFileUpload3" runat="server"
            onuploadcomplete="AjaxFileUpload3_UploadComplete" ThrobberID="myThrobber" MaximumNumberOfFiles="8" AllowedFileTypes="jpg,jpeg"/>
    </div>


    </form>

<script type="text/javascript">

    tabbar = new dhtmlXTabBar("a_tabbar", "top");
    tabbar.setSkin('dhx_skyblue');
    tabbar.setImagePath("js/codebase/imgs/");
    tabbar.addTab("a1", "Tab 1-1", "200px");
    tabbar.addTab("a2", "Tab 1-2", "200px");
    tabbar.addTab("a3", "Tab 1-3", "200px");
    tabbar.setContent("a1", "divUpload1");
//    tabbar.setContent("a2", "divUpload2");
//    tabbar.setContent("a3", "divUpload3");
    tabbar.setTabActive("a1");
    tabbar.enableAutoReSize(false);
    tabbar.attachEvent("onSelect", function (id) {
                                    DoLoadValve(id);
                                    return true;
                                }
                        );


    function DoLoadValve(id) {
        switch (id) {
            case "a2":
                tabbar.setContent("a2", "divUpload2");
                break;
            case "a3":
                tabbar.setContent("a3", "divUpload3");
                break;
        }

    }

</script>

</body>  
</html>  