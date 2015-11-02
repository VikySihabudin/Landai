<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="RegistrasiList.aspx.cs" Inherits="Pages_RegistrasiList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<br /><br /><br /><br />
<div class="container">
<h2>List Registrasi</h2>  
<hr />

        <div class="form-group">            
            <div class="col-sm-2">
            <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
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
                   <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-lg" onclick="refresh()" />
                 </div>
                <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages/RegistrasiAssign.aspx"/>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridRegistrasi" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div class="pagination" id="pageRegistrasi"></div>   
            </div>
            </div>
        </div>

</div>
    <link href="../CSS/page.css" rel="stylesheet" type="text/css" />
    <script src="../Css/bootstrap/js/1.6/jquery.min.js" type="text/javascript"></script>
    <link href="../Css/bootstrap/js/1.8/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Css/bootstrap/js/1.8/jquery-ui.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var localURL = "RegistrasiList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listRegistrasi();
    SearchlistRegistrasi();

    $(function txtDateAwal() {
        $("[id$=txtDateAwal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDateAkhir() {
        $("[id$=txtDateAkhir]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });


    function SearchlistRegistrasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=1"
            + "&param4="
            + "&param5="
			+ "";
        listRegistrasi.clearAll();
        listRegistrasi.loadXML(localURL + "?" + s);
    }

    function refresh() {
        if ((txtDateAkhir.value == 0) || (txtDateAwal.value == 0))
        { alert('Date Awal Dan Akhir Date Akhir Tidak Boleh Kosong') }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
			+ "";
            listRegistrasi.clearAll();
            listRegistrasi.loadXML(localURL + "?" + s);
            //alert(s);
        }
    }

    function handleClick() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + ddprg.value
            + "&param4="
            + "&param5="
			+ "";
        listRegistrasi.clearAll();
        listRegistrasi.loadXML(localURL + "?" + s);
        //alert(s);
    }

 // listRegistrasi.loadXML("../xml/1_Registrasi.xml");
    function listRegistrasi() {
        listRegistrasi = new dhtmlXGridObject('gridRegistrasi');
        listRegistrasi.setImagePath("../JavaScript/codebase/imgs/");
        listRegistrasi.setHeader("No,No Pra Registrasi,No Registrasi,No Pengecekan Lapangan,Assignee,Status,Action,#cspan,#cspan");
        listRegistrasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,");
        listRegistrasi.setInitWidths("50,150,160,260,140,130,76,76,76");
        listRegistrasi.setColAlign("left,left,left,left,left,left,left,left,left");
        listRegistrasi.setColTypes("ro,ro,ro,ro,ro,ro,link,link,link");
        listRegistrasi.init();
        listRegistrasi.setSkin("dhx_skyblue");
        listRegistrasi.setPagingSkin("bricks");
        listRegistrasi.setColSorting("str,str,str,str,str,str,str,str,str");
        listRegistrasi.enablePaging(true, 20, 10, "pageRegistrasi", true);
    }

</script>

</asp:Content>

