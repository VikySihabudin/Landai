<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mpBootstrap.master" CodeFile="Upload.aspx.cs" Inherits="Pages_Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>

<input type="hidden" id="IDRefPic" style="width:250px;" readonly="readonly" value="" runat="server" />
<asp:HiddenField ID="namaFile" runat="server" />


<table>
            <tr>
                <td style="width:250px; height:150px;"  valign="top" >
                    <iframe id="FramePic" width="330" frameborder="1" runat="server"></iframe>
                </td>
            </tr>
            <tr>
                <td>Keterangan Foto: <asp:TextBox ID="txtuploadKeteranganPic" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <div>
                    <asp:Label runat="server" ID="myThrobber" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif"/></asp:Label>
                        <asp:AjaxFileUpload ID="AjaxFileUploadMRS" runat="server"
                            onuploadcomplete="AjaxFileUploadMRS_UploadComplete" 
                            ThrobberID="myThrobber" 
                            MaximumNumberOfFiles="8" 
                            AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                            OnClientUploadComplete="onClientUploadCompleteMRS"
                            ViewStateMode="Inherit"/>
                    </div>
                </td>
            </tr>
        </table>


<script type="text/javascript">


    function onClientUploadCompleteMRS(sender, e) {

        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        //ReloadUPLoadPicMRS(document.getElementById('<%=IDRefPic.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value, document.getElementById('<%=txtuploadKeteranganPic.ClientID %>').value);
        alert('Data Berasil diUpload');
    }

    

</script>

</asp:Content>