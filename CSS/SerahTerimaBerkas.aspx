<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mpBootstrap.master" AutoEventWireup="true" CodeFile="SerahTerimaBerkas.aspx.cs" Inherits="Pages_SerahTerimaBerkas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br /><br />
<input type="hidden" id="hidMode" value="I" />
<input type="hidden" id="hiIdentitas" value="1" />
<div class="container">

  <div class="panel panel-default bootstrap-admin-no-table-panel">
        <div class="panel-heading">
            <div class="text-muted bootstrap-admin-box-title"><h3>Serah Terima Berkas</h2></div>
        </div>
				<div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
					<div id="rootwizard">
						<div class="navbar">

                              <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation"><a href="#tab1" aria-controls="Kirim Berkas" role="tab" data-toggle="tab" class="active">Kirim Berkas</a></li>
                                <li role="presentation"><a href="#tab2" aria-controls="Terima Berkas" role="tab" data-toggle="tab">Terima Berkas</a></li>
                              </ul>
							
						</div>

						<div class="tab-content">

							<div class="tab-pane active" id="tab1">

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">
                                        No Registrasi
                                        </label>
                                        <div class="col-lg-3">
                                        <asp:TextBox id="txtNoRegistrasi" type="text" onkeypress="return runScript(event)" runat="server" class="form-control input-lg" placeholder= "..."  />
                                        </div>
                                        <div class="col-lg-3">
                                        <input type="button" id="BtnCari1" value="Cari"  class="btn btn-lg btn-primary" onclick="lookupIdentitas(3)" />
                                        </div>
                                     </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">Nama</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">No Identitas</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtNoIdentitas" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">Nomor HP</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtNoHP" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">Desa</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtDesa" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">Kecamatan</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtKecamatan" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">Kabupaten</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtKabupaten" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">
                                        Di Serahkan Kepada
                                        </label>
                                        <div class="col-lg-3">
                                        <asp:TextBox id="txtSerahkanKepada" type="text" onkeypress="return runScript(event)" runat="server" class="form-control input-lg" placeholder= "..."  />
                                        </div>
                                        <div class="col-lg-3">
                                        <input type="button" id="BtnCari2" value="Cari"  class="btn btn-lg btn-primary" onclick="lookupIdentitasKepada(4)" />
                                        </div>
                                     </div>
                                </div>

                        <hr />

                                <div class="form-group">
                                    <div class="col-md-6"><center>
                                        <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                                        <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" /></center>
                                    </div>
                                </div>


							</div>

							<div class="tab-pane" id="tab2">

                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="identitas" class="control-label col-lg-2">Diserahkan Dari</label>
                                        <div class="col-lg-3"><asp:TextBox id="txtDiSerahkanDari" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
                                    </div>
                                </div>

                            <div class="form-group">
                                <div class="col-lg-12">
                                <div style=" width:100%; height:300px;">
                                    <div id="gridTerimaBerkas" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                                    <div class="pagination" id="pageTerimaBerkas"> </div>
                                </div>
                                </div>
                            </div>

							</div>

						</div>
					</div>
				</div>
   </div>  
   
</div>         

<link href="../CSS/page.css" rel="stylesheet" type="text/css" />
    
 <script type="text/javascript">

     var localURL = "SerahTerimaBerkas.aspx";
     var newUrl = "SerahTerimaBerkas.aspx";
     var newHome = "Home.aspx";
     var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
     var txtNama = document.getElementById("<%= txtNama.ClientID %>");
     var txtNoIdentitas = document.getElementById("<%= txtNoIdentitas.ClientID %>");
     var txtNoHP = document.getElementById("<%= txtNoHP.ClientID %>");
     var txtDesa = document.getElementById("<%= txtDesa.ClientID %>");
     var txtKecamatan = document.getElementById("<%= txtKecamatan.ClientID %>");
     var txtKabupaten = document.getElementById("<%= txtKabupaten.ClientID %>");
     var txtSerahkanKepada = document.getElementById("<%= txtSerahkanKepada.ClientID %>");
     var txtDiSerahkanDari = document.getElementById("<%= txtDiSerahkanDari.ClientID %>");
     var BtnCari1 = document.getElementById("BtnCari1");
     var BtnCari2 = document.getElementById("BtnCari2");
     var btnCancel = document.getElementById("btnCancel");
     var btnDelete = document.getElementById("btnDelete");
     var hiIdentitas = document.getElementById("hiIdentitas");

     lock();
     listTerimaBerkas();
     SearchlistSerahTerima();

     function SearchlistSerahTerima(id) {
         var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
//            + "&param2=1"
			+ "";
         listTerimaBerkas.clearAll();
         listTerimaBerkas.loadXML(localURL + "?" + s);
     }

     function lock() {
         txtNama.disabled = true;
         txtNoIdentitas.disabled = true;
         txtNoHP.disabled = true;
         txtDesa.disabled = true;
         txtKecamatan.disabled = true;
         txtKabupaten.disabled = true;
         txtDiSerahkanDari.disabled = true;
     }





     function listTerimaBerkas() {
         listTerimaBerkas = new dhtmlXGridObject('gridTerimaBerkas');
         listTerimaBerkas.setImagePath("../JavaScript/codebase/imgs/");
         listTerimaBerkas.setHeader("No,No Registrasi,Nama,Nomor Identitas,No Hp,Desa,Kecamatan,Kabupaten,Accept");
         listTerimaBerkas.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,");
         listTerimaBerkas.setInitWidths("50,140,140,150,140,140,140,130,100");
         listTerimaBerkas.setColAlign("left,left,left,left,left,left,left,left,left");
         listTerimaBerkas.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
         listTerimaBerkas.init();
         listTerimaBerkas.setSkin("dhx_skyblue");
         listTerimaBerkas.setPagingSkin("bricks");
         listTerimaBerkas.setColSorting("str,str,str,str,str,str,str,str,str");
         listTerimaBerkas.enablePaging(true, 20, 10, "pageTerimaBerkas", true);
     }




     function btnClick(objBtn) {

         //alert(objBtn.value);
         //alert(hidMode.value);

         switch (objBtn.value) { 

             case "Save":
                 //alert(hidMode.value);
                 Edit(hidMode.value)
                 break;
             //alert(hidMode.value);    
             case "Delete":
                 if (objBtn.id == 'btnSave') {
                     if (confirm("Hapus Data Ini?"))
                         Delete(hidMode.value);
                 }
                 break;

             case "Cancel":
                 window.location.replace(newHome);
                 break;

             default:
                 break;
         }
     }

     function Edit(tipe) {

             var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=I"
                        + "&param2="
                        + "&param3=" + txtNoRegistrasi.value
                        + "&param4=" + txtNama.value
                        + "&param5=" + txtSerahkanKepada.value
                        + "&param6="
                        + "&param7="
                        + "&param8="
                        + "&param9="

             //alert(s);
             dhtmlxAjax.post(localURL, s, outputResponse);
         }

         function outputResponse(loader) {
             //alert('out');
             var a = loader.xmlDoc.responseText;
             if (a != '') {
                 var b = new Array();
                 b = a.split('|');
             }

             //alert(b[0]+'xxxxxx');

             switch (b[0]) {
                 case "I":
                     alert("Data Berhasil Di Input");
                     window.location.replace(newUrl);
                     break;
                 case "E":
                     alert("Data Berhasil Di Edit");
                     window.location.replace(newUrl);
                     break;
                 case "D":
                     alert("Data Berhasil Di Delete");
                     window.location.replace(newUrl);
                     break;
                 case "nodelete":
                     alert("Data Master Identitas Tidak Dapat Di Hapus Karena Sudah Dilakukan digunakan");
                     window.location.replace(newUrl);
                     break;

                 case "gagal":
                     alert("Data Group Gagal Disimpan");
                     window.location.replace(newUrl);
                     break;
                 default:
                     break;
             }
         }


     var ajaxRequest;
     function getAjax() //memeriksa apakah web browser mendukun AJAX
     {
         try {
             // Opera 8.0+, Firefox, Safari
             ajaxRequest = new XMLHttpRequest();
         }
         catch (e) {
             // Internet Explorer Browsers
             try {
                 ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
             }
             catch (e) {
                 try {
                     ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
                 }
                 catch (e) {
                     // Something went wrong
                     alert("Your browser broke!");
                     return false;
                 }
             }
         }
     }

     function validasi(keyEvent) //untuk mendapatkan nilai dari inputan yang dimasukkan
     {
         keyEvent = (keyEvent) ? keyEvent : window.event;
         input = (keyEvent.target) ? keyEvent.target : keyEvent.srcElement;

         if (keyEvent.type == "keyup") {
             var targetDiv = document.getElementById("hasil");
             targetDiv.innerHTML = "<div></div>";
             if (input.value) {
                 getData("SerahTerimaBerkas.aspx?&sm=validasi&param1=" + txtNoRegistrasi.value);

             }
         }
     }

     function bukaInfo(id) //membuka link dari hasil pencarian
     {
         ajaxRequest.open("GET", "SerahTerimaBerkas.aspx??&sm=validasi&param1=" + txtNoRegistrasi.value);
         ajaxRequest.onreadystatechange =
		function () {
		    var targetDiv = document.getElementById("info");
		    targetDiv.innerHTML = ajaxRequest.responseText;
		}
         ajaxRequest.send(null);
     }

     function getData(dataSource) //menampilkan kemungkinan hasil nama barang yang diinput
     {
         getAjax();
         if (ajaxRequest) {
             ajaxRequest.open("GET", dataSource);
             ajaxRequest.onreadystatechange =
			function () {
			    if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
			        var targetDiv = document.getElementById("hasil");
			        targetDiv.innerHTML = ajaxRequest.responseText;
			    }
			}
             ajaxRequest.send(null);
         }
     }


     function runScript(e) {
         if (e.keyCode == 13) {
             var tb = document.getElementById("txtNoRegistrasi");
             //searchlistAMR();
             return false;
         }
     }

     function lookupIdentitas(jns) {
         var targets = txtNoRegistrasi.id + ',' + txtNama.id + ',' + txtNoIdentitas.id + ',' + txtNoHP.id + ',' + txtDesa.id + ',' + txtKecamatan.id + ',' + txtKabupaten.id + ',' ;
         var params = txtNoRegistrasi.value + ',';

         lookupOpen(jns, params, targets, '');
     }

     function lookupIdentitasKepada(jns) {
         var targets = txtSerahkanKepada.id + ',';
         var params = txtSerahkanKepada.value + ',';

         lookupOpen(jns, params, targets, '');
     }

</script>

</asp:Content>

