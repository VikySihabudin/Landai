<%@ Page Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="PengecekanLapanganList.aspx.cs" Inherits="Pages_PengecekanLapanganList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">
<h2>List Pengecekan Lapangan</h2>  
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

                <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages/PengecekanLapanganAssign.aspx" />
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridPengecekanLapangan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div class="pagination" id="pagePengecekanLapangan"> </div>
            </div>
            </div>
        </div>
</div>
<link href="../CSS/page.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript">

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

    var localURL = "PengecekanLapanganList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listPengecekanLapangan();
    SearchlistPengecekanLapangan();

    function SearchlistPengecekanLapangan(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=1"
            + "&param4="
            + "&param5="
			+ "";
        listPengecekanLapangan.clearAll();
        listPengecekanLapangan.loadXML(localURL + "?" + s);
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
            listPengecekanLapangan.clearAll();
            listPengecekanLapangan.loadXML(localURL + "?" + s);
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
        listPengecekanLapangan.clearAll();
        listPengecekanLapangan.loadXML(localURL + "?" + s);
        //alert(s);
    }

   // listPengecekanLapangan.loadXML("../xml/1_PengecekanLapangan.xml");
    function listPengecekanLapangan() {
        listPengecekanLapangan = new dhtmlXGridObject('gridPengecekanLapangan');
        listPengecekanLapangan.setImagePath("../JavaScript/codebase/imgs/");
        listPengecekanLapangan.setHeader("No,No Pengecekan,No Pra Registrasi,Nama,Desa,Status,Action,#cspan,#cspan");
        listPengecekanLapangan.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,");
        listPengecekanLapangan.setInitWidths("50,170,170,170,170,170,67,67,67");
        listPengecekanLapangan.setColAlign("left,left,left,left,left,left,left,left");
        listPengecekanLapangan.setColTypes("ro,ro,ro,ro,ro,ro,link,link,link");
        listPengecekanLapangan.init();
        listPengecekanLapangan.setSkin("dhx_skyblue");
        listPengecekanLapangan.setPagingSkin("bricks");
        listPengecekanLapangan.setColSorting("str,str,str,str,str,str,str,str,str");
        listPengecekanLapangan.enablePaging(true, 20, 10, "pagePengecekanLapangan", true);
    }

</script>

</asp:Content>
