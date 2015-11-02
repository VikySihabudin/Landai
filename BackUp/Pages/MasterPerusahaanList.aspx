<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpbootstrap.master" AutoEventWireup="true" CodeFile="MasterPerusahaanList.aspx.cs" Inherits="Pages_MasterPerusahaanList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<div class="container">
<h2>Master Perusahaan</h2>  
<hr />

        <div class="form-group">            
      

			<div class="col-lg-10">

            <div class="hidden">

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


                </div>
                                
            </div>

            <div class="col-lg-2">

            <%if (MasterPerusahaanAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
                <asp:Button runat="server" ID="btnTambah" Text="Tambah" class="btn btn-lg btn-success" PostBackUrl="~/Pages/MasterPerusahaanForm.aspx" />
            <%}%>
            </div>
        </div>

       <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridMasterPerusahaan" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageMasterPerusahaan"></div>   
            </div>
            </div>
        </div>   

</div>

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

    var localURL = "MasterPerusahaanList.aspx";

    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    listMasterPerusahaan();
    SearchlistMasterPerusahaan();

    function SearchlistMasterPerusahaan(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
        // + "&param2=2"
			+ "";
        listMasterPerusahaan.clearAll();
        listMasterPerusahaan.loadXML(localURL + "?" + s);
    }

    // listPengecekanLapangan.loadXML("../xml/1_PengecekanLapangan.xml");
    function listMasterPerusahaan() {
        listMasterPerusahaan = new dhtmlXGridObject('gridMasterPerusahaan');
        listMasterPerusahaan.setImagePath("../JavaScript/codebase/imgs/");
        listMasterPerusahaan.setHeader("ID, Tanggal,Nama,Keterangan,Action,#cspan,#cspan");
        listMasterPerusahaan.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listMasterPerusahaan.setInitWidths("150,250,250,250,62,62,62");
        listMasterPerusahaan.setColAlign("left,left,left,left,center,center,center");
        listMasterPerusahaan.setColTypes("ro,ro,ro,ro,link,link,link");
        listMasterPerusahaan.init();
        listMasterPerusahaan.setSkin("dhx_skyblue");
        listMasterPerusahaan.setColSorting("str,str,str,str,str,str,str");
        listMasterPerusahaan.enablePaging(true, 15, 5, "pageMasterPerusahaan", true);
        listMasterPerusahaan.setPagingSkin("bricks");
    }


</script>



</asp:Content>

