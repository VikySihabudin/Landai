﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpbootstrap.master" AutoEventWireup="true" CodeFile="PembayaranAssign.aspx.cs" Inherits="Pages_PembayaranAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">
<h2>Assign Pembayaran</h2>  
<hr />
           
        <div class="form-group">            
            <div class="col-sm-2">
                <asp:DropDownList ID="ddteknis" runat="server" class="form-control">                   
                </asp:DropDownList>
            </div>
          
			<div class="col-lg-10" align="right">
            <div class="col-lg-2">
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
               <div class="col-lg-1">
                <asp:Button runat="server" ID="btnSaves" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages/PembayaranList.aspx"/>
              </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
             <div id="gridPembayaran" style=" width:100%; height:100%;background-color:white; border: 1px solid #A4BED4"></div>
             <div id="pagePembayaran"></div>  
            </div>
            </div>
        </div>
</div>
<link href="../CSS/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">


    var localURL = "PembayaranAssign.aspx";
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

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

    listPembayaran();
    SearchlistPembayaran();


    function SearchlistPembayaran(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=" + ddprg.value
            + "&param4=" 
            + "&param5=" 
			+ "";
        listPembayaran.clearAll();
        listPembayaran.loadXML(localURL + "?" + s);
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
            listPembayaran.clearAll();
            listPembayaran.loadXML(localURL + "?" + s);
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
        listPembayaran.clearAll();
        listPembayaran.loadXML(localURL + "?" + s);
        //alert(s);
    }

    //    listPembayaran.loadXML("../xml/1_Pembayaran.xml");
    function listPembayaran() {
        listPembayaran = new dhtmlXGridObject('gridPembayaran');
        listPembayaran.setImagePath("../JavaScript/codebase/imgs/");
        listPembayaran.setHeader("No,No Pembayaran,No Registrasi,No Pid,Assignee,Status,Action,No PID,No Negosiasi,No Visums,No Pemberkasan");
        listPembayaran.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listPembayaran.setInitWidths("40,205,205,205,205,205,80,0,0,0,0");
        listPembayaran.setColAlign("left,left,left,left,left,leftleft,left,left,left,left");
        listPembayaran.setColTypes("ro,ro,ro,ro,ro,ro,ch,ro,ro,ro,ro");
        listPembayaran.attachEvent("onCheckbox", doOnCheck);
        listPembayaran.init();
        listPembayaran.setSkin("dhx_skyblue");
      
        listPembayaran.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
        listPembayaran.enablePaging(true, 15, 5, "pagePembayaran", true);
        listPembayaran.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {
//        alert(listPembayaran.cells(rowId, 0).getValue());
        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPembayaran.cells(rowId, 1).getValue() //No Pembayaran
        + "&param4=" + listPembayaran.cells(rowId, 2).getValue() // No Registrasi
        + "&param5=" + listPembayaran.cells(rowId, 7).getValue() // No Pid
        + "&param6=" + listPembayaran.cells(rowId, 8).getValue() // No Negosiasi
        + "&param7=" + listPembayaran.cells(rowId, 9).getValue() // No Visums
        + "&param8=" + listPembayaran.cells(rowId, 10).getValue() // No Pemberkasan
        + "&param21=" 
        + "";


            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPembayaran.cells(rowId, 1).getValue() //No Pembayaran
        + "&param4=" + listPembayaran.cells(rowId, 2).getValue() // No Registrasi
        + "&param5=" + listPembayaran.cells(rowId, 7).getValue() // No Pid
        + "&param6=" + listPembayaran.cells(rowId, 8).getValue() // No Negosiasi
        + "&param7=" + listPembayaran.cells(rowId, 9).getValue() // No Visums
        + "&param8=" + listPembayaran.cells(rowId, 10).getValue() // No Pemberkasan
        + "&param21=" + ddteknis.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistPembayaran();
    }
</script>


</asp:Content>

