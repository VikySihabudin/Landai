<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageBootstrap.master" AutoEventWireup="true" CodeFile="AcceptBerkas.aspx.cs" Inherits="Pages_AcceptBerkas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<div class="container"> 
 <h2>Accept Berkas</h2>	
	<table border="0" class="table" style="width:500px;">
    <tr>
        <th>Diserahkan Dari</th>
        <th>:</th>
        <th><asp:TextBox id="txtNoPL" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>                
    </tr>
    </table>

    <table border="0" class="table" style="width:900px;">
        <thead>
            
                

                <tr>                
                    <th colspan="3"><div id="gridpraregistrasi" style=" width:1130px; height:500px; background-color:white; border: 1px solid #A4BED4"></th>            
                </tr>
	<table border="0" class="table" style="width:900px;">
        </thead>
   </table>
</div>


<script type="text/javascript">

    //    function listpraregistrasi(id) {

    //        var s = ""
    //			+ "rnd=" + Math.random() * 4
    //			+ "&sm=L"
    //            + "&param1=L"
    //            + "&param2=21345278"
    //			+ "";
    //        listpraregistrasi.clearAll();
    //        listpraregistrasi.loadXML(localURL + "?" + s);
    //    }


    listpraregistrasi();
    listpraregistrasi.loadXML("../xml/KirimBerkas.xml");
    function listpraregistrasi() {
        listpraregistrasi = new dhtmlXGridObject('gridpraregistrasi');
        listpraregistrasi.setImagePath("../JavaScript/codebase/imgs/");
        listpraregistrasi.setHeader("No Registrasi,Nama,Nomor Identitas,No HP,Desa,Kec,Kab,Signature");
        listpraregistrasi.setInitWidths("125,125,125,125,125,125,125,125");
        listpraregistrasi.setColAlign("left,left,left,left,left,left,left,left,left,left,left");
        listpraregistrasi.setColTypes("ro,ro,ro,ro,ro,ro,ro,link");
        listpraregistrasi.init();
        listpraregistrasi.setSkin("dhx_skyblue");
        listpraregistrasi.setPagingSkin("bricks");
        listpraregistrasi.setColSorting("str,str,str,str,str,str,str,str");
    }
</script>
</asp:Content>

