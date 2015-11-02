<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="MasterIdentitasList.aspx.cs" Inherits="Pages_MasterIdentitasList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<br /><br /><br /><br />
<div class="container">
<h2>List Master Identitas</h2>  
<hr />

        <div class="form-group">
            <div class="col-sm-2">
                <asp:DropDownList ID="idprg" runat="server" class="form-control">
                    <asp:ListItem>Today</asp:ListItem>
                    <asp:ListItem>Weekly</asp:ListItem>
                    <asp:ListItem>Monthly</asp:ListItem>
			        <asp:ListItem>Range</asp:ListItem>
                </asp:DropDownList>
            </div>  


			<div class="col-lg-10" align="right">
                <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-lg" onclick="refresh()" />
                <input type="button" onclick="tambah()" id="btnTambah" value="Tambah" class="btn btn-info btn-lg" />

            </div>
        </div>

        <div class="form-group"> 
            <div class="col-lg-12">
                <div id="gridMasterIdentitas" style="width:100%; height:20em; background-color:white; border: 1px solid #A4BED4"></div>
               <table> <tr> <td id="pageMasterIdentitas"></td> </tr> </table>        
            </div>
        </div>
            
</div>
<script type="text/javascript">

    var localURL = "MasterIdentitasList.aspx";
    var newURL = "MasterIdentitasForm.aspx?param1=I";

    listMasterIdentitas();
    SearchlistMasterIdentitas();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
        //window.location.replace(url);
        window.open(url);

    }

    function SearchlistMasterIdentitas(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            //+ "&param2=PRAREG001"
			+ "";
        listMasterIdentitas.clearAll();
        listMasterIdentitas.loadXML(localURL + "?" + s);
    }

    
    //listpraregistrasi.loadXML("../xml/1_PraRegistrasi.xml");
    function listMasterIdentitas() {
        listMasterIdentitas = new dhtmlXGridObject('gridMasterIdentitas');
        listMasterIdentitas.setImagePath("../JavaScript/codebase/imgs/");
        listMasterIdentitas.setHeader("No,No Identitas,Nama,Jenis Kelamin,Tempat Lahir,Tanggal Lahir,Status,Action,#cspan,#cspan,#cspan");
        listMasterIdentitas.setInitWidths("50,188,188,150,120,120,150,62,62,62");
        listMasterIdentitas.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listMasterIdentitas.setColTypes("ro,ro,ro,ro,ro,ro,ro,link,link,link");
        listMasterIdentitas.init();
        listMasterIdentitas.setSkin("dhx_skyblue");
        listMasterIdentitas.setPagingSkin("toolbar","dhx_skyblue");
        listMasterIdentitas.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listMasterIdentitas.attachHeader(",#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listMasterIdentitas.enablePaging(true, 20, 10, "pageMasterIdentitas", true);
    }

    function refresh() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
        //+ "&param2=PRAREG001"
			+ "";
        listMasterIdentitas.clearAll();
        listMasterIdentitas.loadXML(localURL + "?" + s);
    }

</script>


</asp:Content>

