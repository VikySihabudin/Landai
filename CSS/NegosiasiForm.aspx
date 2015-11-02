<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MPForm.master" AutoEventWireup="true" CodeFile="NegosiasiForm.aspx.cs" Inherits="Pages_NegosiasiForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi"  />
<input type="hidden" id="SKGRPHAT"  />

<br /><br /><br /><br />
<div class="container">
<h2>Negosiasi</h2>
    
    <hr class="style-four">

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Negosiasi</label>
            <div class="col-md-2"><asp:TextBox id="txtNoNegosiasi" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-1">No Registrasi</label>
            <div class="col-md-2"><asp:TextBox id="txtNoRegistrasi" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-1">No PID</label>
            <div class="col-md-2"><asp:TextBox id="txtNoPID" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Negoisasi ke</label>
            <div class="col-md-2"><asp:DropDownList ID="ddNegosiasi" class="form-control input-lg" runat="server"></asp:DropDownList></div>
            <label for="identitas" class="control-label col-md-1">Tanggal Negosiasi</label>
            <div class="col-md-2">
                <%--<asp:TextBox id="txtTglNeg" type="text" runat="server" placeholder= "..."  class="form-control input-lg" />--%>
                <asp:TextBox id="txtTglNeg" type="text" runat="server" class="form-control" />
            </div>
        </div>
    </form>
    <br /><hr />

    <br /><br />

<div class="hidden"> <%--Di Hiden--%>
     <form role="form" class="form-horizontal">
     <div class="form-group">
        <label for="identitas" class="control-label col-sm-1">Objek</label>
        <div class="col-md-2"><asp:DropDownList ID="ddObjek" class="form-control input-lg" runat="server"></asp:DropDownList></div>
        <label for="identitas" class="control-label col-sm-1">Luas</label>
        <div class="col-md-2"><asp:TextBox id="txtLuas" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
        <label for="identitas" class="control-label col-sm-1">Harga Permintaan</label>
        <div class="col-md-2"><asp:TextBox id="txtHargaPermintaan" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
        <label for="identitas" class="control-label col-sm-1">Harga Penawaran</label>
        <div class="col-md-2"><asp:TextBox id="txtHargaPenawaran" type="text" runat="server" class="form-control input-lg" placeholder= "..." />
            <input type="button" id="Button1" value="Save"  class="btn btn-lg btn-success" onclick="saveDetail(this)" />
        </div>  
         <%--<div class="col-md-2"><input type="button" id="btnSavePenawaran" value="Save"  class="btn btn-lg btn-success" onclick="btnClickSavePenawaran(this)" /></div>  --%>  
      </div>
      </form>
</div>

       <div class="form-group">
       <div class="col-lg-10">
            <div style=" width:100%; height:130px;">
                <div id="gridNegosiasi" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

      <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Total Harga Permintaan</label>
            <div class="col-md-3"><asp:TextBox id="txtTHargaPermintaan" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-lg-2">Total Harga Penawaran</label>
            <div class="col-md-3"><asp:TextBox id="txtTHargaPenawaran" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LSepakat" for="identitas"  class="control-label col-lg-2" runat="server" Text="Sepakat" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddSepakat" class="form-control input-lg" runat="server"></asp:DropDownList></div>
            
        </div>
    </form>

     <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Keterangan</label>
            <div class="col-lg-3"><asp:TextBox id="txtKeterangan" type="text" runat="server" class="form-control input-lg" TextMode="multiline" Columns="15" Rows="3" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-lg-2">SKGRPHAT</label>
            <div class="col-md-3"><asp:CheckBox CssClass="form-control checkbox-lg" ID="cbSKGRPHAT" runat="server" onclick="validasi()"/></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LEksepsi" for="identitas"  class="control-label col-lg-2" runat="server" Text="Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-lg-3"><asp:CheckBox ID="chEksepsi" CssClass="form-control checkbox-lg" runat="server" text="" onclick="validasi()"/></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LKEksepsi" for="identitas"  class="control-label col-lg-2" runat="server" Text="Keterangan Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-lg-3"> <asp:TextBox id="txtKetEksepsi" class="form-control input-lg" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
        </div>
    </form>

    <br /><hr />

    <div class="form-group">
            <div class="col-md-10"><center>
                  <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" /></center>
            </div>
    </div>
</div>

<%--DIALOG--%>
<div id="dialogNeg" title="Detail Negosiasi" style="font-size:small;">
<form role="form" class="form-horizontal">

    <div class="form-group">

        <asp:Label ID="Label1" for="identitas"  class="control-label col-lg-2" runat="server" Text="No Negosiasi" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtNoNego" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label3" for="identitas"  class="control-label col-lg-2" runat="server" Text="Tanggal" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txttgl" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
        </div>

    </div>

    <div class="form-group">

        <asp:Label ID="Label2" for="identitas"  class="control-label col-lg-2" runat="server" Text="Objek" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtobj" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label6" for="identitas"  class="control-label col-lg-2" runat="server" Text="Luas" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtluasd" class="form-control input-lg" runat="server" Enabled="True"></asp:TextBox>
       </div>

     </div>

    <div class="form-group">

        <asp:Label ID="Label4" for="identitas"  class="control-label col-lg-2" runat="server" Text="Harga Permintaan" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txthrgpermin" class="form-control input-lg" runat="server" Enabled="True"></asp:TextBox>
        </div>

        <asp:Label ID="Label7" for="identitas"  class="control-label col-lg-2" runat="server" Text="Harga Penawaran" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txthrgpena" class="form-control input-lg" runat="server" Enabled="True"></asp:TextBox>
       </div>

     </div>

   <div class="hidden">
    <div class="form-group">

        <asp:Label ID="Label8" for="identitas"  class="control-label col-lg-2" runat="server" Text="Jumlah Harga Permintaan" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtjmlhrgpermin" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label9" for="identitas"  class="control-label col-lg-2" runat="server" Text="Jumlah Harga Penawaran" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtjmlhrgpena" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
       </div>

     </div >

     <div class="form-group">

         <asp:Label ID="Label10" for="identitas"  class="control-label col-lg-2" runat="server" Text="Selisih" Font-Bold="True"></asp:Label>
           <div class="col-sm-4">
            <asp:TextBox ID="txtselisih" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
           </div>

         <asp:Label ID="Label5" for="identitas"  class="control-label col-lg-2" runat="server" Text="No Squen" Font-Bold="True"></asp:Label>
           <div class="col-sm-4">
            <asp:TextBox ID="txtsequ" class="form-control input-lg" runat="server" Enabled="False"></asp:TextBox>
           </div>

     </div>
     
    </div>

<form role="form" class="form-horizontal">
    <div class="form-group">
        <div class="col-lg-11" align="right">
            <input type="button" id="PopupbtnSaveNeg" value="Save" runat="server" class="btn btn-lg btn-default" onclick="SaveKondisiNeg()" />
        </div>
    </div>
</form>
</div>

    <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
    <script src="../JavaScript/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <link rel="Stylesheet" type="text/css" href="../css/jquery-ui-1.10.3.custom.css" />

<script type="text/javascript">

    var localURL = "NegosiasiForm.aspx";
    var newUrl = "NegosiasiList.aspx";
    var txtNoNegosiasi = document.getElementById("<%= txtNoNegosiasi.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
    var txtNoPID = document.getElementById("<%= txtNoPID.ClientID %>");
    var ddNegosiasi = document.getElementById("<%= ddNegosiasi.ClientID %>");
    var txtTglNeg = document.getElementById("<%= txtTglNeg.ClientID %>");
    var ddObjek = document.getElementById("<%= ddObjek.ClientID %>");
    var txtLuas = document.getElementById("<%= txtLuas.ClientID %>");
    var txtHargaPermintaan = document.getElementById("<%= txtHargaPermintaan.ClientID %>");
    var txtHargaPenawaran = document.getElementById("<%= txtHargaPenawaran.ClientID %>");
    var txtTHargaPermintaan = document.getElementById("<%= txtTHargaPermintaan.ClientID %>");
    var txtTHargaPenawaran = document.getElementById("<%= txtTHargaPenawaran.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var ddSepakat = document.getElementById("<%= ddSepakat.ClientID %>");
    var cbSKGRPHAT = document.getElementById("<%= cbSKGRPHAT.ClientID %>");
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");
    var chEksepsi = document.getElementById("<%= chEksepsi.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");

    var hidMode = document.getElementById('hidMode');
    var txtNoNego = document.getElementById("<%= txtNoNego.ClientID %>");
    var txttgl = document.getElementById("<%= txttgl.ClientID %>");
    var txtobj = document.getElementById("<%= txtobj.ClientID %>");
    var txtluasd = document.getElementById("<%= txtluasd.ClientID %>");
    var txthrgpermin = document.getElementById("<%= txthrgpermin.ClientID %>");
    var txtjmlhrgpermin = document.getElementById("<%= txtjmlhrgpermin.ClientID %>");
    var txthrgpena = document.getElementById("<%= txthrgpena.ClientID %>");
    var txtjmlhrgpena = document.getElementById("<%= txtjmlhrgpena.ClientID %>");
    var txtselisih = document.getElementById("<%= txtselisih.ClientID %>");
    var txtsequ = document.getElementById("<%= txtsequ.ClientID %>");
    var PopupbtnSaveNeg = document.getElementById("PopupbtnSaveNeg");
    listNegosiasi();
    terimaURL();


    

    $(function txtTglNeg() {
        $("[id$=txtTglNeg]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function validasi() {
            if (document.getElementById("<%= chEksepsi.ClientID %>").checked) {
                eksepsi.value = '1';
            } else {
                eksepsi.value = '0';
             }
            if (document.getElementById("<%= cbSKGRPHAT.ClientID %>").checked) {
                SKGRPHAT.value = '1';
            } else {
                SKGRPHAT.value = '0';
             }
        
    }   

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        splitparam(params);
//        alert(txtNoNegosiasi.value);
        
    }


     function splitparam(loader) {

        var a = loader;
        //lockPengukuran();
        if (a != '0') {
            var b = new Array();
            b = a.split('&');
//            alert(a);
            
        }
        //alert(b[2].replace("param1=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V" 
			+ "&param2=" + b[3].replace("param2=","")
			+ "";

//         alert(s);
        dhtmlxAjax.post(localURL, s, bindFormNegosiasi);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockNegosiasiView();

            }

        else if (x == 'D') {
            lockNegosiasiDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockNegosiasiEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';
        }

    }

    function btnClick(objBtn) {
        switch (objBtn.value) {
     
            case "Save":
//                alert(hidMode.value);
                Edit(hidMode.value)
                break;

            case "Delete":
                if (objBtn.id == 'btnSave') {
                    if (confirm("Hapus Data Ini?"))
                        Delete(hidMode.value);
                }
                break;

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }

    function Delete() {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + txtNoNegosiasi.value  
     //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);

    }

    function SearchlistNegosiasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LD"
            + "&param1=L"
            + "&param2=" + txtNoNegosiasi.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
    }

    function Edit(tipe) {
        if (eksepsi.value == 1) {
            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoNegosiasi.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtNoPID.value
                + "&param6=" + txtKeterangan.value
                + "&param7=" + ddSepakat.value
                + "&param8=" + SKGRPHAT.value
                + "&param9=" + eksepsi.value
                + "&param10=" + txtKetEksepsi.value
                + "&param11="
                + "&param12="
                + "&param13="

              //alert('Eks 1');
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else {
            if (ddSepakat.value == 1) {
                //alert('spt 1');
                if (txtTHargaPermintaan.value == txtTHargaPenawaran.value) {
                    var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe.replace("param1=", "")
                        + "&param2=" + txtNoNegosiasi.value
                        + "&param3="
                        + "&param4=" + txtNoRegistrasi.value
                        + "&param5=" + txtNoPID.value
                        + "&param6=" + txtKeterangan.value
                        + "&param7=" + ddSepakat.value
                        + "&param8=" + SKGRPHAT.value
                        + "&param9=" + eksepsi.value
                        + "&param10=" + txtKetEksepsi.value
                        + "&param11="
                        + "&param12="
                        + "&param13="

                    //  alert(s);
                   // alert('Harga Sama');
                    dhtmlxAjax.post(localURL, s, outputResponse);
                }
                else {
                    alert('Data Harga Permintaan Dan Penawaran Tidak Sama');
                }
            }
            else {
                var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe.replace("param1=", "")
                        + "&param2=" + txtNoNegosiasi.value
                        + "&param3="
                        + "&param4=" + txtNoRegistrasi.value
                        + "&param5=" + txtNoPID.value
                        + "&param6=" + txtKeterangan.value
                        + "&param7=" + ddSepakat.value
                        + "&param8=" + SKGRPHAT.value
                        + "&param9=" + eksepsi.value
                        + "&param10=" + txtKetEksepsi.value
                        + "&param11="
                        + "&param12="
                        + "&param13="

                //  alert(s);
                //alert('Tidak Sepakat');
                dhtmlxAjax.post(localURL, s, outputResponse);
            }
        }
    }

    function bindFormNegosiasi(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
//        lockNegosiasiView();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtNoNegosiasi.value = b[0];
            txtNoRegistrasi.value = b[1];
            txtNoPID.value = b[2];
            txtKeterangan.value = b[3];
            ddSepakat.value = b[4];

            if (b[5] == 1) {
                cbSKGRPHAT.checked = true;
                SKGRPHAT.value = b[5];
            }
            txtKetEksepsi.value = b[6];

            if (b[7] == 1) {
                chEksepsi.checked = true;
                eksepsi.value = b[7];
            }

            txtTHargaPermintaan.value = b[8];
            txtTHargaPenawaran.value = b[9];
            txtTglNeg.value = b[10];


//            txtTglNeg.value = b[8];

            //txtPerLahKet.value = b[5];
            //ddPerolehanLahan.value = b[6];
            //FilePerolehanLahan.value = b[7];

        }
        SearchlistNegosiasi();
    }

   function lockNegosiasiView() 
    {
        txtNoNegosiasi.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNoPID.disabled = true;
        ddNegosiasi.disabled = true;
        txtTglNeg.disabled = true;
        ddObjek.disabled = true;
        txtLuas.disabled = true;
        txtHargaPermintaan.disabled = true;
        txtHargaPenawaran.disabled = true;
        txtTHargaPermintaan.disabled = true;
        txtTHargaPenawaran.disabled = true;
        txtKeterangan.disabled = true;
        ddSepakat.disabled = true;
        cbSKGRPHAT.disabled = true;
        txtKetEksepsi.disabled = true;
        chEksepsi.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
       
    }

     function lockNegosiasiEdit() {
       txtNoNegosiasi.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNoPID.disabled = true;
        txtTHargaPermintaan.disabled = true;
        txtTHargaPenawaran.disabled = true;
    }

    function lockNegosiasiDelete() {
       txtNoNegosiasi.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNoPID.disabled = true;
        ddNegosiasi.disabled = true;
        txtTglNeg.disabled = true;
        ddObjek.disabled = true;
        txtLuas.disabled = true;
        txtHargaPermintaan.disabled = true;
        txtHargaPenawaran.disabled = true;
        txtTHargaPermintaan.disabled = true;
        txtTHargaPenawaran.disabled = true;
        txtKeterangan.disabled = true;
        ddSepakat.disabled = true;
        cbSKGRPHAT.disabled = true;
        txtKetEksepsi.disabled = true;
        chEksepsi.disabled = true;
    }

    function SearchlistNegosiasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + txtNoNegosiasi.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
    }

    function SaveKondisiNeg() {
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=I"
                  + "&param1=I"
                  + "&param2=" + txtNoNegosiasi.value
                  + "&param3=" + txttgl.value
                  + "&param4=" + txtsequ.value
                  + "&param5=" + ddNegosiasi.value
                 // + "&param6=" + txtobj.value
                  + "&param7=" + txtluasd.value
                  + "&param8=" + txthrgpermin.value
                  + "&param9=" + txthrgpena.value
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data Berhasil Disimpan")
        // alert(s);
        SearchlistNegosiasi();
        $("#dialogNeg").dialog("close");

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + txtNoRegistrasi.value
			+ "";

        dhtmlxAjax.post(localURL, s, bindFormNegosiasi);

    }

    function onRowSelected(rowId, cellIndex) {
        txtNoNego.value = txtNoNegosiasi.value;
        txttgl.value = listNegosiasi.cells(rowId, 1).getValue();
        txtobj.value = listNegosiasi.cells(rowId, 2).getValue(); 
        txtluasd.value = "";
        txthrgpermin.value = "";
        txtjmlhrgpermin.value = listNegosiasi.cells(rowId, 5).getValue();
        txthrgpena.value = "";
        txtjmlhrgpena.value = listNegosiasi.cells(rowId, 7).getValue();
        txtselisih.value = listNegosiasi.cells(rowId, 8).getValue();
        txtsequ.value = listNegosiasi.cells(rowId, 9).getValue();
        //alert('a');
        $("#dialogNeg").dialog("open");

    }

    $(function () {
        $("#dialogNeg").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogNeg").dialog("close");
        });
    });


    function listNegosiasi() {
        listNegosiasi = new dhtmlXGridObject('gridNegosiasi');
        listNegosiasi.setImagePath("../JavaScript/codebase/imgs/");
        listNegosiasi.setHeader("No,Tanggal,Objek,Luas,Harga Permintaan,Jumlah Harga Permintaan,Harga Penawaran,Jumlah Harga Penawaran,Selisih,Sequen");
        listNegosiasi.setInitWidths("40,80,80,80,150,230,150,230,100,0");
        listNegosiasi.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listNegosiasi.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
        listNegosiasi.init();
        listNegosiasi.setSkin("dhx_skyblue");
        listNegosiasi.attachEvent("onRowSelect",onRowSelected);
        listNegosiasi.setPagingSkin("bricks");
        listNegosiasi.setColSorting("str,str,str,str,str,str,str,str,str,str");
    }

    function outputResponse(loader) {
        //alert(loader.xmlDoc.responseText);
        //document.getElementById('debug').value = loader.xmlDoc.responseText;
        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil Di Edit");
                //window.location.replace(newUrl);;
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Negosiasi Tidak Dapat Di Hapus Karena Sudah Dilakukan Pembayaran");
                //window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Negosiasi Tidak Dapat Di Edit Karena Sudah Dilakukan Pembayaran");
                //window.location.replace(newUrl);
                close();
                break;
            case "noadd":
                alert("Data Negosiasi Tidak Dapat Di Assign Karena Sudah Dilakukan Pembayaran"); 
                //window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Negosiasi Gagal Disimpan");
                //window.location.replace(newUrl);
                close();
                break;
            default:
                break;
        }
        //        fillGrid();
        //        fillGrid2();
        //        lock();
        //        clear();
        //        lockTeknik();
        //        clearTeknik();
    }


</script>

</asp:Content>

