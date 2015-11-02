﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="NegosiasiAssign.aspx.cs" Inherits="Pages_NegosiasiAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">
<h2>Assign Negosiasi</h2>  
<hr />

        <div class="form-group">            
            <div class="col-sm-2">
                <asp:DropDownList ID="ddteknis" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
			<div class="col-lg-10" align="right">
                <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
                </asp:DropDownList>
                </div>
               <label for="nama" class="control-label col-md-2">Date Awal</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" />
                </div>
                <label for="nama" class="control-label col-md-2">Date Akhir</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" />
                </div>
                <div class="col-lg-1">
                 <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-sm" onclick="refresh()" />
                 </div>


                <asp:Button runat="server" ID="btnSave" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages/NegosiasiList.aspx"/>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridNegosiasi" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNegosiasi"></div> 
            </div>
            </div>
        </div>
</div>

<link href="../CSS/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    var localURL = "NegosiasiAssign.aspx";
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");

    listNegosiasi();
    SearchlistNegosiasi();

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

    function SearchlistNegosiasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=" + ddprg.value
            + "&param4="
            + "&param5="
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
    }

    function refresh() {
        if ((txtDateAkhir.value == 0) || (txtDateAwal.value == 0))
        { alert('Date Awal Dan Akhir Date Akhir Tidak Boleh Kosong') }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
			+ "";
            listNegosiasi.clearAll();
            listNegosiasi.loadXML(localURL + "?" + s);
            //alert(s);
        }
    }

    function handleClick() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=" + ddprg.value
            + "&param4="
            + "&param5="
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
        //alert(s);
    }


    //    listNegosiasi.loadXML("../xml/1_Negosiasi.xml");
    function listNegosiasi() {
        listNegosiasi = new dhtmlXGridObject('gridNegosiasi');
        listNegosiasi.setImagePath("../JavaScript/codebase/imgs/");
        listNegosiasi.setHeader("No,No Negosiasi,No Registrasi,PID,Status,Assigne,Action");
        listNegosiasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listNegosiasi.setInitWidths("40,200,200,200,200,200,94");
        listNegosiasi.setColAlign("left,left,left,left,left,left,left");
        listNegosiasi.setColTypes("ro,ro,ro,ro,ro,ro,ch");
        listNegosiasi.attachEvent("onCheckbox", doOnCheck);
        listNegosiasi.init();
        listNegosiasi.setSkin("dhx_skyblue");
        
        listNegosiasi.setColSorting("str,str,str,str,str,str");
        listNegosiasi.enablePaging(true, 15, 5, "pageNegosiasi", true);
        listNegosiasi.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listNegosiasi.cells(rowId, 1).getValue()
        + "&param4=" + listNegosiasi.cells(rowId, 2).getValue()
        + "&param5=" + listNegosiasi.cells(rowId, 3).getValue()
        + "&param11="
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listNegosiasi.cells(rowId, 1).getValue()
        + "&param4=" + listNegosiasi.cells(rowId, 2).getValue()
        + "&param5=" + listNegosiasi.cells(rowId, 3).getValue()
        + "&param11=" + ddteknis.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistNegosiasi();
    }
</script>

</asp:Content>

