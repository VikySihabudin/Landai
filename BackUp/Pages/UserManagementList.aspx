<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="UserManagementList.aspx.cs" Inherits="Pages_UserManagementList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">
<h2>List User Management</h2>  
<hr />

        <div class="form-group">            
            <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
           
			<div class="col-lg-10" align="right">
            <label for="nama" class="control-label col-md-2">Date Awal</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" />
                </div>
                <label for="nama" class="control-label col-md-2">Date Akhir</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" />
                </div>
                <div class="col-lg-1">
                 <asp:Button runat="server" ID="Button1" Text="Refresh" class="btn btn-info btn-lg"  />
                 </div>

            <%if (UserManagementAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
             <asp:Button runat="server" ID="btnTambah" Text="Tambah" class="btn btn-lg btn-success" PostBackUrl="~/Pages/UserManagementForm.aspx"/>
            <%}%>

            </div>
        </div>

      <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridUserManagement" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageUser"></div>   
            </div>
            </div>
        </div>

<script type="text/javascript">

    var localURL = "UserManagementList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    $(function txtDateAwal() {
        $("[id$=txtDateAwal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2999"
        });
    });

    $(function txtDateAkhir() {
        $("[id$=txtDateAkhir]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2999"
        });
    });


    ListUserManagement();
    SearchListUserManagement();

    function SearchListUserManagement(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
        // + "&param2=12345"
			+ "";
        ListUserManagement.clearAll();
        ListUserManagement.loadXML(localURL + "?" + s);
    }


    //ListUserManagement.loadXML("../xml/1_PemberkasanDua.xml");
    function ListUserManagement() {
        ListUserManagement = new dhtmlXGridObject('gridUserManagement');
        ListUserManagement.setImagePath("../JavaScript/codebase/imgs/");
        ListUserManagement.setHeader("User Id,Nama,Group,User Active,Action,#cspan,#cspan");
        ListUserManagement.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        ListUserManagement.setInitWidths("226,226,226,226,78,78,78");
        ListUserManagement.setColAlign("left,left,left,left,left,left,left");
        ListUserManagement.setColTypes("ro,ro,ro,ro,link,link,link");
        ListUserManagement.init();
        ListUserManagement.setSkin("dhx_skyblue");
        ListUserManagement.setColSorting("str,str,str,str,str,str,str");
        ListUserManagement.enablePaging(true, 15, 5, "pageUser", true);
        ListUserManagement.setPagingSkin("bricks");
    }
</script>

</asp:Content>

