<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuDinamis.aspx.cs" MasterPageFile="~/MasterPages/MasterPageDinamis.master" Inherits="Pages_MenuDinamis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div id="MainMenu" style="background-color: #f0f8ff;">
    <table cellspacing=10>ADD MAIN MENU
        <tr>
            <td>Nama Menu : </td>
            <td><input id="txtNamaMenu" type="text" runat="server" /></td>
        </tr>
        <tr>
            <td>Menu Order : </td>
            <td><asp:DropDownList ID="ddlMenuOrder" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Group Menu : </td>
            <td><asp:DropDownList ID="ddlGroupMenu" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:CheckBox id="AktifMenu" runat="server" Checked="false" onclick="javascript:check_CheckedAktif(this)" ClientIDMode="Static" Text="Aktif" /></td>
        </tr>
        <tr>
            <td><input id="btnSimpanMenu" runat="server" type="button" value="Simpan" /></td>
        </tr>
    </table>
</div>

<div id="SubMenu" style="background-color: #f0f8ff;">
    <table cellspacing=10>ADD SUB MENU
        <tr>
            <td>Nama SubMenu : </td>
            <td><input id="txtSubMenu" type="text" runat="server" /></td>
        </tr>
        <tr>
            <td>Url : </td>
            <td><input id="txtUrl" type="text" runat="server" /></td>
        </tr>
        <tr>
            <td>SubMenu Order : </td>
            <td><asp:DropDownList ID="ddlSubMenuOrder" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Group SubMenu : </td>
            <td><asp:DropDownList ID="ddlGroupSubMenu" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:CheckBox id="AktifSubMenu" runat="server" Checked="false" onclick="javascript:check_CheckedAktif(this)" ClientIDMode="Static" Text="Aktif" /></td>
        </tr>
        <tr>
            <td><input id="btnSubMenu" runat="server" type="button" value="Simpan" /></td>
        </tr>
    </table>
    <div id="gridMenuDinamis" style=" width:780px; height: 300px; background-color:white; border: 1px solid #A4BED4"></div>
</div>


<script language="javascript" type="text/javascript">
var localURL = "SummaryAsset.aspx";

initMenuDinamis();

function initMenuDinamis()
        {
             mygridMenuDinamis = new dhtmlXGridObject('gridMenuDinamis');
             mygridMenuDinamis.setImagePath("../JavaScript/codebase/imgs/");
             mygridMenuDinamis.setHeader("No,Uraian,Jumlah dlm lap. O&M,Jumlah Data Spasial,Atribut Terisi, Persentase Spasial, Persentase Atribut");
             //mygrid.attachHeader("#rspan,#select_filter_strict,#text_filter,#rspan");
             mygridMenuDinamis.setColSorting("str,str,str,str,str,str,str");
             mygridMenuDinamis.setInitWidths("30,100,120,120,120,120,120");
             mygridMenuDinamis.setColAlign("center,left,center,center,center,center,center");
             mygridMenuDinamis.setColTypes("ro,ro,ro,ro,ro,ro,ro");
//             mygridMenuDinamis.attachEvent("onRowSelect", doOnRowSelected);
             mygridMenuDinamis.init();
             mygridMenuDinamis.setSkin("dhx_skyblue");
//             mygridMenuDinamis.enableAutoWidth(true,730,400);
//             mygridMenuDinamis.enableAutoHeight(true,600,600);
//             mygridMenuDinamis.enablePaging(true,7,7,'pagingInfo',true);
             mygridMenuDinamis.setPagingSkin("bricks");
        }


</script>
</asp:Content>
