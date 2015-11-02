<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="PraRegistrasiList.aspx.cs" Inherits="Pages_PraRegistrasiList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">

<h2>List Pra Registrasi</h2>  
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
                <input type="button" onclick="tambah()" id="btnTambah" value="Tambah" class="btn btn-info btn-md" />
            </div>
    </div>
</div>    
     
    <div class="form-group"> 
        <div class="col-lg-12" style=" width:100%; height:400px;">
            <div id="gridpraregistrasi" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>

         <div class="pagination" id="pagePraregistrasi"></div>      

        </div>
    </div>
</div>

   <link href="../CSS/page.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

    var localURL = "PraRegistrasiList.aspx";
    var localURLForm = "PraRegistrasiForm.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listpraregistrasi();
    Searchlistpraregistrasi();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, localURLForm);
        //window.location.replace(url);
        window.open(url);

    }

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
    function Searchlistpraregistrasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=1"
            + "&param4="
            + "&param5="
			+ "";
        listpraregistrasi.clearAll();
        listpraregistrasi.loadXML(localURL + "?" + s);
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
            listpraregistrasi.clearAll();
            listpraregistrasi.loadXML(localURL + "?" + s);
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
        listpraregistrasi.clearAll();
        listpraregistrasi.loadXML(localURL + "?" + s);
        //alert(s);
    }

    
    //listpraregistrasi.loadXML("../xml/1_PraRegistrasi.xml");
    function listpraregistrasi() {
        listpraregistrasi = new dhtmlXGridObject('gridpraregistrasi');
        listpraregistrasi.setImagePath("../JavaScript/codebase/imgs/");
        listpraregistrasi.setHeader("No,No Pra Registrasi,No Identitas,Nama,Kabupaten,Kecamatan,Desa,Action,#cspan,#cspan");
        listpraregistrasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,");
        listpraregistrasi.setInitWidths("40,160,160,160,160,160,160,45,45,45");
        listpraregistrasi.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listpraregistrasi.setColTypes("ro,ro,ro,ro,ro,ro,ro,link,link,link");
        listpraregistrasi.init();
        listpraregistrasi.setSkin("dhx_skyblue");
        listpraregistrasi.setPagingSkin("toolbar","dhx_skyblue");
        listpraregistrasi.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listpraregistrasi.enablePaging(true, 20, 10, "pagePraregistrasi", true);
      
    }

</script>


</asp:Content>

