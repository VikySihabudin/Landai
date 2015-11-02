<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MPForm.master" AutoEventWireup="true" CodeFile="MasterIdentitasForm.aspx.cs" Inherits="Pages_MasterIdentitasForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <input type="hidden" id="hidMode" value="0" />
<br /><br /><br /><br />
<h1>Master Identitas</h1>
	
	<hr class="style-four">
    
    
	<form role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Nomor Identitas</label>
            <div class="col-lg-3"><asp:TextBox ID="txtNoIdentitas" class="form-control input-lg" runat="server"></asp:TextBox></div>			
            <label for="nama" class="control-label col-md-3">Tanda Identitas yang Berlaku</label>
            <div class="col-lg-3">
            <asp:DropDownList ID="ddIdentitas" runat="server" class="form-control input-lg"></asp:DropDownList>
            </div>
        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Nama</label>
            <div class="col-md-5"><asp:TextBox ID="txtNama" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Jenis Kelamin</label>
			<div class="col-lg-5">
                <asp:DropDownList ID="DDJenisKelamin" runat="server" class="form-control input-lg"></asp:DropDownList>
                <%--<asp:RadioButtonList ID="DDJenisKelamin" runat="server" RepeatDirection="Horizontal" Font-Size="Medium" ></asp:RadioButtonList>--%>
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Tempat Tanggal Lahir</label>
            <div class="col-sm-2"><asp:TextBox ID="txtTempatLahir" class="form-control input-lg" runat="server"></asp:TextBox></div>
			<div class="col-sm-2"><asp:TextBox ID="txtTglLahir"  runat="server" type="text" class="form-control input-lg" ></asp:TextBox></div>
	
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Pekerjaan</label>
			<div class="col-lg-5">
                <asp:DropDownList ID="ddPekerjaan" runat="server" class="form-control input-lg"></asp:DropDownList>
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Nomor Induk Pegawai</label>
            <div class="col-md-5"><asp:TextBox ID="txtNoIndukPegawai" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Alamat</label>
			<div class="col-lg-5">
				<asp:TextBox id="txtAlamat" TextMode="multiline" class="form-control input-lg" Columns="15" Rows="3" runat="server" />
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Nomor Handphone</label>
            <div class="col-md-5"><asp:TextBox ID="txtNoHandphone" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>
		
		<hr>
		<h4>Data Pernikahan :</h4>
		<br />
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Status</label>
			<div class="col-lg-5">
                <%--<asp:RadioButtonList ID="DDStatus" runat="server" RepeatDirection="Horizontal" Font-Size="Medium"></asp:RadioButtonList>--%>
                <asp:DropDownList ID="DDStatus" runat="server" class="form-control input-lg"></asp:DropDownList>
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Nama Pasangan</label>
            <div class="col-md-5"><asp:TextBox ID="txtNamaPasangan" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Tempat Tanggal Lahir</label>
            <div class="col-sm-2"><asp:TextBox ID="txtTempatLahirPasangan" class="form-control input-lg" runat="server"></asp:TextBox></div>
			<div class="col-sm-2"> <asp:TextBox ID="txtTglLahirPasangan" runat="server" type="text" class="form-control input-lg" ></asp:TextBox></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-lg-2">Tahun Menikah</label>
            <div class="col-md-5"><asp:TextBox ID="txtTahunMenikah" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>


        <hr>
		<h4>Data Anak :</h4>
		<br />

        <div class="form-group">
            <div class="col-md-5">
                <input type="button" onclick="PopupTbhAnk()" id="Button1" value="Tambah" class="btn btn-info btn-lg" />
                
            </div>
        </div>
        

        <div class="form-group">
            <div class="col-md-5">
                
                
                <div id="gridAnak" style=" width:800px; height:130px; background-color:white; border: 1px solid #A4BED4"></div>
            </div>
        </div>

        <hr>
		<h4>Data Ayah Kandung :</h4>
		<br />

        <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Nama</label>
            <div class="col-md-5"><asp:TextBox ID="txtNamaAyah" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Tanggal Lahir</label>
            <div class="col-md-5"><asp:TextBox ID="txtTglLahirAyah"  runat="server" class="form-control input-lg"></asp:TextBox></div>
        </div>

         <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Pekerjaan</label>
            <div class="col-md-5"><asp:TextBox ID="txtPekerjaanAyah" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Alamat</label>
            <div class="col-md-5"><asp:TextBox id="txtAlamatAyah" TextMode="multiline" class="form-control input-lg" Columns="15" Rows="3" runat="server" /></div>
        </div>

        <hr>
		<h4>Data Ibu Kandung :</h4>
		<br />

        <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Nama</label>
            <div class="col-md-5"><asp:TextBox ID="txtNamaIbu" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Tanggal Lahir</label>
            <div class="col-md-5"><asp:TextBox ID="txtTglLahirIbu" runat="server" class="form-control input-lg"></asp:TextBox></div>
        </div>

         <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Pekerjaan</label>
            <div class="col-md-5"><asp:TextBox ID="txtPekerjaanIbu" class="form-control input-lg" runat="server"></asp:TextBox></div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-lg-2">Alamat</label>
            <div class="col-md-5"><asp:TextBox id="txtAlamatIbu" TextMode="multiline" class="form-control input-lg" Columns="15" Rows="3" runat="server" /></div>
        </div>

        <hr>
		<h4>Data Saudara Kandung :</h4>
		<br />

        <div class="form-group">
            <div class="col-md-5">
                <input type="button" onclick="PopupTbhSdr()" id="btnAddSaudara" class="btn btn-lg btn-info" value="Tambah" />
               
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-5">
                
                <div id="gridSaudara" style=" width:800px; height:130px; background-color:white; border: 1px solid #A4BED4"></div>
         
            </div>
        </div>

        <br />
        <hr>

        <div class="form-group">
            <div class="col-md-10">
                <center>
                    <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                    <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
                </center>
            </div>
        </div>
</form>

    <div id="dialog" title="Anak Kandung" style="font-size:small;">
        <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
            <tr>
                <td colspan="2" style="padding-left: 15px;"> </td>
            </tr>
            <tr>
                <td style="font-size:small">Nama Anak </td>
                <td>
                    <asp:TextBox ID="PopuptxtNamaAnak" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size:small">Tanggal lahir </td>
                <td>
                    <asp:TextBox ID="PopupTglLhrAnak"  runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size:small">Pekerjaan </td>
                <td><asp:DropDownList ID="PopupddPkrjAnak" CssClass="form-control" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style="font-size:small">Alamat </td>
                <td>
                    <asp:TextBox id="PopuptxtAlmtAnak" TextMode="multiline" CssClass="form-control" Columns="15" Rows="3" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="PopupbtnSaveAnak" value="Save" runat="server" class="btn btn-lg btn-default" onclick="SavePopupSaveAnak()" />
                </td>
            </tr>
        </table> 
    </div>

    <div id="dialog2" title="Saudara Kandung" style="font-size:small;">
        <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
            <tr>
                <td colspan="2" style="padding-left: 15px;"> </td>
            </tr>
            <tr>
                <td style="font-size:small">Nama Saudara </td>
                <td>
                    <asp:TextBox ID="PopuptxtNamaSaudara" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size:small">Tanggal lahir </td>
                <td>
                    <asp:TextBox ID="PopupTglLhrSaudara" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size:small">Pekerjaan </td>
                <td><asp:DropDownList ID="PopupddPkrjSaudara" runat="server" CssClass="form-control"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style="font-size:small">Alamat </td>
                <td>
                    <asp:TextBox id="PopuptxtAlmtSaudara" TextMode="multiline" CssClass="form-control" Columns="15" Rows="3" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="PopupbtnSaveSaudara" value="Save" runat="server" class="btn btn-lg btn-default" onclick="SavePopupSaveSaudara()" />
                </td>
            </tr>
        </table>
    </div>

    <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
    <script src="../JavaScript/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <link rel="Stylesheet" type="text/css" href="../css/jquery-ui-1.10.3.custom.css" />

<script type="text/javascript">

    var localURL = "MasterIdentitasForm.aspx";
    var newUrl = "MasterIdentitasList.aspx";

    var txtNoIdentitas = document.getElementById("<%= txtNoIdentitas.ClientID %>");
    var txtNama = document.getElementById("<%= txtNama.ClientID %>");
    var ddIdentitas = document.getElementById("<%= ddIdentitas.ClientID %>");
    var DDJenisKelamin = document.getElementById("<%= DDJenisKelamin.ClientID %>");
    var txtTempatLahir = document.getElementById("<%= txtTempatLahir.ClientID %>");
    var txtTglLahir = document.getElementById("<%= txtTglLahir.ClientID %>");
    var ddPekerjaan = document.getElementById("<%= ddPekerjaan.ClientID %>");
    var txtNoIndukPegawai = document.getElementById("<%= txtNoIndukPegawai.ClientID %>");

    var txtAlamat = document.getElementById("<%= txtAlamat.ClientID %>");
    var txtNoHandphone = document.getElementById("<%= txtNoHandphone.ClientID %>");
    var DDStatus = document.getElementById("<%= DDStatus.ClientID %>");
    var txtNamaPasangan = document.getElementById("<%= txtNamaPasangan.ClientID %>");
    var txtTempatLahirPasangan = document.getElementById("<%= txtTempatLahirPasangan.ClientID %>");
    var txtTglLahirPasangan = document.getElementById("<%= txtTglLahirPasangan.ClientID %>");
    var txtTahunMenikah = document.getElementById("<%= txtTahunMenikah.ClientID %>");
    var txtNamaAyah = document.getElementById("<%= txtNamaAyah.ClientID %>");
    var txtTglLahirAyah = document.getElementById("<%= txtTglLahirAyah.ClientID %>");
    var txtPekerjaanAyah = document.getElementById("<%= txtPekerjaanAyah.ClientID %>");
    var txtAlamatAyah = document.getElementById("<%= txtAlamatAyah.ClientID %>");
    var txtNamaIbu = document.getElementById("<%= txtNamaIbu.ClientID %>");
    var txtTglLahirIbu = document.getElementById("<%= txtTglLahirIbu.ClientID %>");
    var txtPekerjaanIbu = document.getElementById("<%= txtPekerjaanIbu.ClientID %>");
    var txtAlamatIbu = document.getElementById("<%= txtAlamatIbu.ClientID %>");

    var PopuptxtNamaAnak = document.getElementById("<%= PopuptxtNamaAnak.ClientID %>");
    var PopupTglLhrAnak = document.getElementById("<%= PopupTglLhrAnak.ClientID %>");
    var PopupddPkrjAnak = document.getElementById("<%= PopupddPkrjAnak.ClientID %>");
    var PopuptxtAlmtAnak = document.getElementById("<%= PopuptxtAlmtAnak.ClientID %>");
    var PopuptxtNamaSaudara = document.getElementById("<%= PopuptxtNamaSaudara.ClientID %>");
    var PopupTglLhrSaudara = document.getElementById("<%= PopupTglLhrSaudara.ClientID %>");
    var PopupddPkrjSaudara = document.getElementById("<%= PopupddPkrjSaudara.ClientID %>");
    var PopuptxtAlmtSaudara = document.getElementById("<%= PopuptxtAlmtSaudara.ClientID %>");

    var PopupTglLhrAnak = document.getElementById("<%= PopupTglLhrAnak.ClientID %>");

    var btnSave = document.getElementById("btnSave");
    var btnDelete = document.getElementById("btnDelete");
    var btnCancel = document.getElementById("btnCancel");
    var hidMode = document.getElementById('hidMode');

    var Button1 = document.getElementById("Button1");
    var btnAddSaudara = document.getElementById("btnAddSaudara");
    
    listAnak();

    listSaudara();

    terimaURL();


    tanggal();

    $(function () {
        $("#dialog").dialog
        ({
            autoOpen: false,
            width: 300,
            height: 400,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialog").dialog("close");
        });
    });

    $(function () {
        $("#dialog2").dialog
        ({
            autoOpen: false,
            width: 300,
            height: 400,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialog2").dialog("close");
        });
    });

    function PopupTbhAnk() {
        if (txtNoIdentitas.value == '') {
            alert('No Identitas Harus diisi');
        } else {
            $("#dialog").dialog("open");
        }
    }

    function PopupTbhSdr() {
        if (txtNoIdentitas.value == '') {
            alert('No Identitas Harus diisi');
        } else {
            $("#dialog2").dialog("open");
        }
    }

    function SearchlistAnak(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SA"
            + "&param1=SA"
            + "&param2=" + txtNoIdentitas.value
			+ "";
        listAnak.clearAll();
        listAnak.loadXML(localURL + "?" + s);
    }

    function SearchlistSaudara(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SS"
            + "&param1=SS"
            + "&param2=" + txtNoIdentitas.value
			+ "";
        listSaudara.clearAll();
        listSaudara.loadXML(localURL + "?" + s);
    }


    function listAnak() {
        listAnak = new dhtmlXGridObject('gridAnak');
        listAnak.setImagePath("../JavaScript/codebase/imgs/");
        listAnak.setHeader("No,Nama Anak Kandung,Tanggal Lahir,Pekerjaan,Alamat,Action,#cspan,#cspan,#cspan");
        listAnak.setInitWidths("40,200,100,100,100,62,62,62");
        listAnak.setColAlign("left,left,left,left,left,left,left,left");
        listAnak.setColTypes("ro,ro,ro,ro,ro,link,link,link");
        listAnak.init();
        listAnak.setSkin("dhx_skyblue");
        listAnak.setPagingSkin("bricks");
        listAnak.setColSorting("str,str,str,str,str,str,str,str");
    }

    function listSaudara() {
        listSaudara = new dhtmlXGridObject('gridSaudara');
        listSaudara.setImagePath("../JavaScript/codebase/imgs/");
        listSaudara.setHeader("No,Nama Saudara Kandung,Tanggal Lahir,Pekerjaan,Alamat,Action,#cspan,#cspan,#cspan");
        listSaudara.setInitWidths("40,200,100,100,100,62,62,62");
        listSaudara.setColAlign("left,left,left,left,left,left,left,left");
        listSaudara.setColTypes("ro,ro,ro,ro,ro,link,link,link");
        listSaudara.init();
        listSaudara.setSkin("dhx_skyblue");
        listSaudara.setPagingSkin("bricks");
        listSaudara.setColSorting("str,str,str,str,str,str,str,str");
    }

    function SavePopupSaveAnak() {
       
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=IA"
                  + "&param1=I"
                  + "&param2=" + txtNoIdentitas.value
        //+ "&param3=" + txtNoIdentitas.value
                  + "&param4=" + PopuptxtNamaAnak.value
                  + "&param5=" + PopupTglLhrAnak.value
                  + "&param6=" + PopupddPkrjAnak.value
                  + "&param7=" + PopuptxtAlmtAnak.value
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data Anak Berhasil Disimpan")
        SearchlistAnak();
        $("#dialog").dialog("close");
    }

    function SavePopupSaveSaudara() {
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=IS"
                  + "&param1=I"
                  + "&param2=" + txtNoIdentitas.value
        //+ "&param3=" + txtNoIdentitas.value
                  + "&param4=" + PopuptxtNamaSaudara.value
                  + "&param5=" + PopupTglLhrSaudara.value
                  + "&param6=" + PopupddPkrjSaudara.value
                  + "&param7=" + PopuptxtAlmtSaudara.value
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data Saudara Berhasil Disimpan")
        SearchlistSaudara();
        $("#dialog2").dialog("close");
    }



    function terimaURL() {
        var url = window.location.toString();

        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        if (params != 'param1=I') {
            // pisahkan parameter URL ke associative array
            var params = '&' + params;
            //            alert(params);
            splitparam(params);
        } else {
            hidMode.value = 'I';
        }

    }

    function splitparam(loader) {

        var a = loader;
        //lockPraregistrasi();
        if (a != '0') {
            var b = new Array();
            b = a.split('&');
            //alert(b[2]);
        }

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=select"
			+ "&param1=F"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, bindFormMasterIdentitas);

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SA"
            + "&param1=SA"
            + "&param2=" + b[3].replace("param2=", "")
			+ "";
        listAnak.clearAll();
        listAnak.loadXML(localURL + "?" + s);

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SS"
            + "&param1=SS"
            + "&param2=" + b[3].replace("param2=", "")
			+ "";
        listSaudara.clearAll();
        listSaudara.loadXML(localURL + "?" + s);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'F') {
            //lockPraregistrasi();
            lockMidentView();

        }

        else if (x == 'D') {
            lockMidentDelete();
            
            btnSave.value = 'Delete';
            hidMode.value = 'D';        
            btnSave.id = 'btnDelete';
        }
        else if (x == 'E') {
            btnSave.value = 'Save';
            hidMode.value = 'E';

        }

    }

    function bindFormMasterIdentitas(loader) {
        var a = loader.xmlDoc.responseText;
        //lockPraregistrasi();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            //alert(b[2]);
            txtNoIdentitas.value = b[0];
            ddIdentitas.value = b[1];
            txtNama.value = b[2];
            DDJenisKelamin.value = b[3];
            txtTempatLahir.value = b[4];
            txtTglLahir.value = b[5];
            ddPekerjaan.value = b[6];
            txtNoIndukPegawai.value = b[7];
            txtAlamat.value = b[8];
            txtNoHandphone.value = b[9];
            DDStatus.value = b[10];
            txtNamaPasangan.value = b[11];
            txtTempatLahirPasangan.value = b[12];
            txtTglLahirPasangan.value = b[13];
            txtTahunMenikah.value = b[14];
            txtNamaAyah.value = b[15];
            txtTglLahirAyah.value = b[16];
            txtPekerjaanAyah.value = b[17];
            txtAlamatAyah.value = b[18];
            txtNamaIbu.value = b[19];
            txtTglLahirIbu.value = b[20];
            txtPekerjaanIbu.value = b[21];
            txtAlamatIbu.value = b[22];

        }
    }

    function btnClick(objBtn) {

        //alert(objBtn.value);

        switch (objBtn.value) {

            case "Insert":
                Insert(hidMode.value);
//                window.location.replace(newUrl);
                close();

                //alert(objBtn.value);

                break;

            case "Save":
                //                alert(hidMode.value);
                if (txtNoIdentitas.value == '') {
                    alert('No Identitas Harus diisi');
                } else {
                    Edit(hidMode.value);
                    //                    window.location.replace(newUrl);
                }
                break;

            case "Delete":
                //                alert(objBtn.id);
                if (objBtn.id == 'btnDelete') {
                    if (confirm("Hapus Data Ini?"))
                        Delete(hidMode.value);
//                        window.location.replace(newUrl);
                }
                close();
                break;

            case "Cancel":
                //                window.location.replace(newUrl);
                close();
                break;

            default:
                break;
        }
    }

    function Delete(tipe) {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=Delete"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoIdentitas.value
                + "&param3=" + ddIdentitas.value
                + "&param4=" + txtNama.value
                + "&param5=" + DDJenisKelamin.value
                + "&param6=" + txtTempatLahir.value
                + "&param7=" + txtTglLahir.value
                + "&param8=" + ddPekerjaan.value
                + "&param9=" + txtNoIndukPegawai.value
                + "&param10=" + txtAlamat.value
                + "&param11=" + txtNoHandphone.value
                + "&param12=" + DDStatus.value
                + "&param13=" + txtNamaPasangan.value
                + "&param14=" + txtTempatLahirPasangan.value
                + "&param15=" + txtTglLahirPasangan.value
                + "&param16=" + txtTahunMenikah.value
                + "&param17=" + txtNamaAyah.value
                + "&param18=" + txtTglLahirAyah.value
                + "&param19=" + txtPekerjaanAyah.value
                + "&param20=" + txtAlamatAyah.value
                + "&param21=" + txtNamaIbu.value
                + "&param22=" + txtTglLahirIbu.value
                + "&param23=" + txtPekerjaanIbu.value
                + "&param24=" + txtAlamatIbu.value
			    + "";

        dhtmlxAjax.post(localURL, s, outputResponse);

    }

    function Hapus(sm, param1, param2, param3) {
        var r = confirm("Delete?");
        if (r == true) {
            var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=" + sm
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param3=" + param3
                    + "";
            dhtmlxAjax.post(localURL, s);
            SearchlistAnak();
            SearchlistSaudara();
        }
    }

    function EditDetil(sm, param1, param2, param3) {

        var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=" + sm
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param3=" + param3
                    + "";
        dhtmlxAjax.post(localURL, s);

    }

    function View(sm, param1, param2, param3) {
        
        var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=" + sm
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param3=" + param3
                    + "";
        dhtmlxAjax.post(localURL, s);

        //alert(s);
    }


    function Insert(tipe) {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=Insert"
			+ "&param1=I"
			+ "&param2=" + txtNoIdentitas.value
            + "&param3=" + ddIdentitas.value
            + "&param4=" + txtNama.value
            + "&param5=" + DDJenisKelamin.value
            + "&param6=" + txtTempatLahir.value
            + "&param7=" + txtTglLahir.value
            + "&param8=" + ddPekerjaan.value
            + "&param9=" + txtNoIndukPegawai.value
            + "&param10=" + txtAlamat.value
            + "&param11=" + txtNoHandphone.value
            + "&param12=" + DDStatus.value
            + "&param13=" + txtNamaPasangan.value
            + "&param14=" + txtTempatLahirPasangan.value
            + "&param15=" + txtTglLahirPasangan.value
            + "&param16=" + txtTahunMenikah.value
            + "&param17=" + txtNamaAyah.value
            + "&param18=" + txtTglLahirAyah.value
            + "&param19=" + txtPekerjaanAyah.value
            + "&param20=" + txtAlamatAyah.value
            + "&param21=" + txtNamaIbu.value
            + "&param22=" + txtTglLahirIbu.value
            + "&param23=" + txtPekerjaanIbu.value
            + "&param24=" + txtAlamatIbu.value
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function Edit(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=Save"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoIdentitas.value
                + "&param3=" + ddIdentitas.value
                + "&param4=" + txtNama.value
                + "&param5=" + DDJenisKelamin.value
                + "&param6=" + txtTempatLahir.value
                + "&param7=" + txtTglLahir.value
                + "&param8=" + ddPekerjaan.value
                + "&param9=" + txtNoIndukPegawai.value
                + "&param10=" + txtAlamat.value
                + "&param11=" + txtNoHandphone.value
                + "&param12=" + DDStatus.value
                + "&param13=" + txtNamaPasangan.value
                + "&param14=" + txtTempatLahirPasangan.value
                + "&param15=" + txtTglLahirPasangan.value
                + "&param16=" + txtTahunMenikah.value
                + "&param17=" + txtNamaAyah.value
                + "&param18=" + txtTglLahirAyah.value
                + "&param19=" + txtPekerjaanAyah.value
                + "&param20=" + txtAlamatAyah.value
                + "&param21=" + txtNamaIbu.value
                + "&param22=" + txtTglLahirIbu.value
                + "&param23=" + txtPekerjaanIbu.value
                + "&param24=" + txtAlamatIbu.value


        dhtmlxAjax.post(localURL, s, outputResponse);

    }

    function outputResponse(loader) {

        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "I":
                alert("Data Berhasil di Simpan");
//                window.location.replace(newUrl);
                close();
                break;
            case "E":
                alert("Data Berhasil di Edit");
//                window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil di Delete");
//                window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Master Identitas Tidak Dapat Dihapus");
//                window.location.replace(newUrl);
                break;
            case "nodelete":
                alert("Data Master Identitas Tidak Dapat Di Edit");
//                window.location.replace(newUrl);
                break;
            case "gagal":
                alert("Data Master Identitas Gagal Disimpan");
//                window.location.replace(newUrl);
                break;
            default:
                break;
        }

    }

    function lockMidentView() {
        txtNoIdentitas.disabled = true;
        txtNama.disabled = true;
        ddIdentitas.disabled = true;
        DDJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtNoIndukPegawai.disabled = true;

        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        DDStatus.disabled = true;
        txtNamaPasangan.disabled = true;
        txtTempatLahirPasangan.disabled = true;
        txtTglLahirPasangan.disabled = true;
        txtTahunMenikah.disabled = true;
        txtNamaAyah.disabled = true;
        txtTglLahirAyah.disabled = true;
        txtPekerjaanAyah.disabled = true;
        txtAlamatAyah.disabled = true;
        txtNamaIbu.disabled = true;
        txtTglLahirIbu.disabled = true;
        txtPekerjaanIbu.disabled = true;
        txtAlamatIbu.disabled = true;

        PopuptxtNamaAnak.disabled = true;
        PopupTglLhrAnak.disabled = true;
        PopupddPkrjAnak.disabled = true;
        PopuptxtAlmtAnak.disabled = true;
        PopuptxtNamaSaudara.disabled = true;
        PopupTglLhrSaudara.disabled = true;
        PopupddPkrjSaudara.disabled = true;
        PopuptxtAlmtSaudara.disabled = true;

        PopupTglLhrAnak.disabled = true;

        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('Button1').style.visibility = 'hidden';
        document.getElementById('btnAddSaudara').style.visibility = 'hidden';

    }

    function lockMidentDelete() {
        txtNoIdentitas.disabled = true;
        txtNama.disabled = true;
        ddIdentitas.disabled = true;
        DDJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtNoIndukPegawai.disabled = true;

        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        DDStatus.disabled = true;
        txtNamaPasangan.disabled = true;
        txtTempatLahirPasangan.disabled = true;
        txtTglLahirPasangan.disabled = true;
        txtTahunMenikah.disabled = true;
        txtNamaAyah.disabled = true;
        txtTglLahirAyah.disabled = true;
        txtPekerjaanAyah.disabled = true;
        txtAlamatAyah.disabled = true;
        txtNamaIbu.disabled = true;
        txtTglLahirIbu.disabled = true;
        txtPekerjaanIbu.disabled = true;
        txtAlamatIbu.disabled = true;

        PopuptxtNamaAnak.disabled = true;
        PopupTglLhrAnak.disabled = true;
        PopupddPkrjAnak.disabled = true;
        PopuptxtAlmtAnak.disabled = true;
        PopuptxtNamaSaudara.disabled = true;
        PopupTglLhrSaudara.disabled = true;
        PopupddPkrjSaudara.disabled = true;
        PopuptxtAlmtSaudara.disabled = true;

        PopupTglLhrAnak.disabled = true;

        document.getElementById('Button1').style.visibility = 'hidden';
        document.getElementById('btnAddSaudara').style.visibility = 'hidden';

    }

    function tanggal() {


        $(function txtDateAwal() {
            $("[id$=txtTglLahir]").datepicker({
                dateFormat: "yy-mm-dd",
                buttonImageOnly: true,
                changeYear: true,
                changeMonth: true,
                yearRange: "1900:2100"
            });
        });

        $(function txtTglLahirPasangan() {
            $("[id$=txtTglLahirPasangan]").datepicker({
                dateFormat: "yy-mm-dd",
                buttonImageOnly: true,
                changeYear: true,
                changeMonth: true,
                yearRange: "1900:2100"
            });
        });


        $(function txtTglLahirAyah() {
            $("[id$=txtTglLahirAyah]").datepicker({
                dateFormat: "yy-mm-dd",
                buttonImageOnly: true,
                changeYear: true,
                changeMonth: true,
                yearRange: "1900:2100"
            });
        });




        $(function txtTglLahirIbu() {
            $("[id$=txtTglLahirIbu]").datepicker({
                dateFormat: "yy-mm-dd",
                buttonImageOnly: true,
                changeYear: true,
                changeMonth: true,
                yearRange: "1900:2100"
            });
        });


        $(function PopupTglLhrAnak() {
            $("[id$=PopupTglLhrAnak]").datepicker({
                dateFormat: "yy-mm-dd",
                buttonImageOnly: true,
                changeYear: true,
                changeMonth: true,
                yearRange: "1900:2100"
            });
        });


        $(function PopupTglLhrSaudara() {
            $("[id$=PopupTglLhrSaudara]").datepicker({
                dateFormat: "yy-mm-dd",
                buttonImageOnly: true,
                changeYear: true,
                changeMonth: true,
                yearRange: "1900:2100"
            });
        });

    }

</script>


</asp:Content>
