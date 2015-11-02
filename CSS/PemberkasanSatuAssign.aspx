<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpbootstrap.master" AutoEventWireup="true" CodeFile="PemberkasanSatuAssign.aspx.cs" Inherits="Pages_PemberkasanSatuAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<br /><br /><br /><br />
<div class="container">
<h2>Assign Pemberkasan</h2>  
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
                <asp:Button runat="server" ID="btnBack" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages/PemberkasanSatuList.aspx"/>
              </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridPemberkasan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div class="pagination" id="pagePemberkasan"></div>
            </div>
            </div>
        </div>

</div>
<link href="../CSS/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    var localURL = "PemberkasanSatuAssign.aspx";

    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");

    listPemberkasan();
    SearchlistPemberkasan();

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



    function SearchlistPemberkasan(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=1"
            + "&param4="
            + "&param5="
			+ "";
        listPemberkasan.clearAll();
        listPemberkasan.loadXML(localURL + "?" + s);
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
            listPemberkasan.clearAll();
            listPemberkasan.loadXML(localURL + "?" + s);
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
        listPemberkasan.clearAll();
        listPemberkasan.loadXML(localURL + "?" + s);
        //alert(s);
    }

    // listPemberkasan.loadXML("../xml/1_Pemberkasan.xml");
    function listPemberkasan() {
        listPemberkasan = new dhtmlXGridObject('gridPemberkasan');
        listPemberkasan.setImagePath("../JavaScript/codebase/imgs/");
        listPemberkasan.setHeader("No,Pemberkasan,Parce No,No Negosiasi,No Visum,Assignee,Status,Action,N");
        listPemberkasan.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listPemberkasan.setInitWidths("40,175,175,175,150,150,188,85,0");
        listPemberkasan.setColAlign("left,left,left,left,left,left,left,left");
        listPemberkasan.setColTypes("ro,ro,ro,ro,ro,ro,ro,ch,ro");
        listPemberkasan.attachEvent("onCheckbox", doOnCheck);
        listPemberkasan.init();
        listPemberkasan.setSkin("dhx_skyblue");
        listPemberkasan.setPagingSkin("bricks");
        listPemberkasan.setColSorting("str,str,str,str,str,str,str,str,str");
        listPemberkasan.enablePaging(true, 20, 10, "pagePemberkasan", true);
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPemberkasan.cells(rowId, 0).getValue()
        + "&param4=" + listPemberkasan.cells(rowId, 7).getValue()
        + "&param5=" + listPemberkasan.cells(rowId, 1).getValue()
        + "&param6=" + listPemberkasan.cells(rowId, 2).getValue()
        + "&param7=" + listPemberkasan.cells(rowId, 3).getValue()
        + "&param12="
        + "";

           //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPemberkasan.cells(rowId, 0).getValue()
        + "&param4=" + listPemberkasan.cells(rowId, 7).getValue()
        + "&param5=" + listPemberkasan.cells(rowId, 1).getValue()
        + "&param6=" + listPemberkasan.cells(rowId, 2).getValue()
        + "&param7=" + listPemberkasan.cells(rowId, 3).getValue()
        + "&param12=" + ddteknis.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistPemberkasan();
    }
</script>


</asp:Content>

