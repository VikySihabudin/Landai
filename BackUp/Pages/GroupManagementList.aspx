﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpbootstrap.master" AutoEventWireup="true" CodeFile="GroupManagementList.aspx.cs" Inherits="Pages_GroupManagementList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">

<h2>Group Management</h2>  

<hr />

<div class="form-group"> 
     <div class="col-lg-12" style=" width:100%; height:100%;">
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

            <div class="col-lg-1">

            <%if (GroupManagementAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
                <input type="button" id="Button1" value="Tambah" class="btn btn-md btn-success" onclick="tambah()"/>
            <%}%>

            </div>
    </div>
</div> 

    <div class="form-group"> 
        <div class="col-lg-12" style=" width:100%; height:400px;">
            <div id="gridGroupManagement" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>

         <div id="pageGroup"></div>      

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

    var localURL = "GroupManagementList.aspx";
    var localURLForm = "GroupManagementForm.aspx";
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    listGroupManagement();
    SearchlistlistGroupManagement();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, localURLForm);
        //window.location.replace(url);
        window.open(url);

    }

    function openForm() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=select"
			+ "&param1=I"
			+ "&param2="
			+ "";
        //alert(s);
        dhtmlxAjax.post(localURLForm, s);
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
            listGroupManagement.clearAll();
            listGroupManagement.loadXML(localURL + "?" + s);
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
        listGroupManagement.clearAll();
        listGroupManagement.loadXML(localURL + "?" + s);
        //alert(s);
    }

    function SearchlistlistGroupManagement(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
        // + "&param2=2"
			+ "";
        listGroupManagement.clearAll();
        listGroupManagement.loadXML(localURL + "?" + s);
    }

    // listPengecekanLapangan.loadXML("../xml/1_PengecekanLapangan.xml");
    function listGroupManagement() {
        listGroupManagement = new dhtmlXGridObject('gridGroupManagement');
        listGroupManagement.setImagePath("../JavaScript/codebase/imgs/");
        listGroupManagement.setHeader("No,1, Group Name,Group Lanjut,Group Except,Action,#cspan,#cspan");
        listGroupManagement.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listGroupManagement.setInitWidths("50,0,280,280,280,62,62,62");
        listGroupManagement.setColAlign("center,left,left,left,left,center,center,center");
        listGroupManagement.setColTypes("ro,ro,ro,ro,ro,link,link,link");
        listGroupManagement.init();
        listGroupManagement.setSkin("dhx_skyblue");

        listGroupManagement.setColSorting("str,str,str,str,str,str,str,str");
        listGroupManagement.enablePaging(true, 15, 5, "pageGroup", true);
        listGroupManagement.setPagingSkin("bricks");
    }

























</script>


</asp:Content>

