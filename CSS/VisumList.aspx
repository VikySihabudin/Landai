<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="VisumList.aspx.cs" Inherits="Pages_VisumList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">
<h2>List Visum</h2>  
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

             <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages/VisumAssign.aspx"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridVisum" style="width:100%; height:100%;; background-color:white; border: 1px solid #A4BED4"></div>
                <div class="pagination" id="pageVisums"></div>
            </div>
            </div>
        </div>
</div>

<link href="../CSS/page.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript">

    var localURL = "VisumList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    ListVisum();
    SearchListVisum();

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

    function SearchListVisum(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=1"
            + "&param4="
            + "&param5="
			+ "";
        ListVisum.clearAll();
        ListVisum.loadXML(localURL + "?" + s);
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
            ListVisum.clearAll();
            ListVisum.loadXML(localURL + "?" + s);
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
        ListVisum.clearAll();
        ListVisum.loadXML(localURL + "?" + s);
        //alert(s);
    }
//    ListVisum.loadXML("../xml/1_Negosiasi.xml");
    function ListVisum() {
        ListVisum = new dhtmlXGridObject('gridVisum');
        ListVisum.setImagePath("../JavaScript/codebase/imgs/");
        ListVisum.setHeader("No,No Visum,No Registrasi,PID,Assigne,Status,Action,#cspan,#cspan");
        ListVisum.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,");
        ListVisum.setInitWidths("40,188,188,188,188,188,40,40,40");
        ListVisum.setColAlign("left,left,left,left,left,left,left,left,left");
        ListVisum.setColTypes("ro,ro,ro,ro,ro,ro,link,link,link");
        ListVisum.init();
        ListVisum.setSkin("dhx_skyblue");
        ListVisum.setPagingSkin("bricks");
        ListVisum.setColSorting("str,str,str,str,str,str,str,str,str");
        ListVisum.enablePaging(true, 20, 10, "pageVisums", true);
    }

</script>

</asp:Content>

