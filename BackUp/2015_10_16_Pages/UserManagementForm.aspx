<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MPForm.master" AutoEventWireup="true" CodeFile="UserManagementForm.aspx.cs" Inherits="Pages_UserManagementForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />
<br /><br /><br /><br />
<div class="container">
<h2>User Management</h2>
    
    <hr class="style-four">

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">User Id</label>
            <div class="col-lg-3"><asp:TextBox id="txtUserId" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Nama</label>
            <div class="col-lg-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-lg" placeholder= "..." /></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Password</label>
            <div class="col-lg-3"><asp:TextBox id="txtPassword" TextMode="password" type="text" runat="server" class="form-control input-lg" /></div>
        </div>
    </form>

        <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">New Password</label>
            <div class="col-lg-3"><asp:TextBox id="txtNewPass" TextMode="password" type="text" runat="server" class="form-control input-lg" /></div>
        </div>
    </form>

        <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Confirmasi New Password</label>
            <div class="col-lg-3"><asp:TextBox id="txtconfirmasiPassword"  TextMode="password" onkeyup="checkPass();" type="text" runat="server" class="form-control input-lg" /><span id="confirmMessage" class="confirmMessage"></span></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Group</label>
            <div class="col-md-4"><asp:DropDownList ID="ddGroup" class="form-control input-lg" runat="server"></asp:DropDownList></div>
        </div>
    </form>

    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Status Active</label>
            
            <div class="col-md-4"><asp:DropDownList ID="ddStatusActive" class="form-control input-lg" runat="server"></asp:DropDownList></div>
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

<script type="text/javascript">

    var localURL = "UserManagementForm.aspx";
    var newUrl = "UserManagementList.aspx";
    var txtUserId = document.getElementById("<%= txtUserId.ClientID %>");
    var txtPassword = document.getElementById("<%= txtPassword.ClientID %>");
    var txtconfirmasiPassword = document.getElementById("<%= txtconfirmasiPassword.ClientID %>");
    var ddGroup = document.getElementById("<%= ddGroup.ClientID %>");
    var txtNama = document.getElementById("<%= txtNama.ClientID %>");
    var ddStatusActive = document.getElementById("<%= ddStatusActive.ClientID %>");
    var txtNewPass = document.getElementById("<%= txtNewPass.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var hidMode = document.getElementById('hidMode');
    
    



    terimaURL();

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;
        splitparam(params);
    }

    function splitparam(loader) {

        var a = loader;
        //lockPengukuran();
        if (a != '0') {
            var b = new Array();
            b = a.split('&');

        }
        //alert(b[2].replace("param1=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, bindUserManagement);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockUserManagementView();

        }

        else if (x == 'D') {
            lockUserManagementDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockUserManagementEdit();
            btnSave.value = 'Edit';
            hidMode.value = 'E';


        }

    }

    function checkPass() {

        //Store the Confimation Message Object ...
        var message = document.getElementById('confirmMessage');
        //Set the colors we will be using ...
        var goodColor = "#66cc66";
        var badColor = "#ff6666";
        //Compare the values in the password field
        //and the confirmation field
        if (txtNewPass.value == txtconfirmasiPassword.value) {
            //The passwords match.
            //Set the color to the good color and inform
            //the user that they have entered the correct password
            txtconfirmasiPassword.style.backgroundColor = goodColor;
            message.style.color = goodColor;
            message.innerHTML = "Passwords Match!"
        } else {
            //The passwords do not match.
            //Set the color to the bad color and
            //notify the user.
            txtconfirmasiPassword.style.backgroundColor = badColor;
            message.style.color = badColor;
            message.innerHTML = "Passwords Do Not Match!"
        }
    }  

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);
                Insert(hidMode.value)
                break;

            case "Edit":
                if (txtNewPass.value == txtconfirmasiPassword.value) {
                    //alert(hidMode.value);
                    Edit(hidMode.value)
                }
                else {
                    alert("Kombinasi Password Dan Konfirmasi Password Salah");
                    txtconfirmasiPassword.focus();
                }
                break;

            case "Delete":
                if (confirm("Hapus Data Ini?"))
                    Delete(hidMode.value);
                break;

            

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }

    function Delete() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=D"
			+ params
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);

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
                window.location.replace(newUrl);
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                window.location.replace(newUrl);
                break;
            case "I":
                alert("Data Berhasil Di Simpan");
                window.location.replace(newUrl);
                break;
            case "noedit":
                alert("Kata Sandi Password Lama Salah");
                break;
             case "gagal":
                alert("Data Gagal Disimpan");
                window.location.replace(newUrl);
                break;
            default:
                break;
        }
    }

    function Edit(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=E"
                + "&param2=" + txtUserId.value
                + "&param3=" + txtNama.value
                + "&param4=" + txtNewPass.value
                + "&param5=" + ddGroup.value
                + "&param6=" + ddStatusActive.value
                + "&param7="
                + "&param8=" + txtPassword.value
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function Delete(tipe) {
            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + txtUserId.value
                + "&param3=" + txtNama.value
                + "&param4=" + txtPassword.value
                + "&param5=" + ddGroup.value
                + "&param6=" + ddStatusActive.value
                + "&param7="
                + "&param8="
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    function Insert(tipe) {
        var s = ""
            + "rnd=" + Math.random() * 4
			+ "&sm=CRUD"
            + "&param1=I"
            + "&param2=" + txtUserId.value
            + "&param3=" + txtNama.value
            + "&param4=" + txtPassword.value
            + "&param5=" + ddGroup.value
            + "&param6=" + ddStatusActive.value
            + "&param7="
            + "&param8="
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function bindUserManagement(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //lockUserManagementView();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtUserId.value = b[0];
            //txtPassword.value = b[1];
            txtNama.value = b[1];
            ddGroup.value = b[2];
            ddStatusActive.value = b[3];
        }
    }

    function lockUserManagementView() {
        txtUserId.disabled = true;
        txtPassword.disabled = true;
        ddGroup.disabled = true;
        txtNama.disabled = true;
        ddStatusActive.disabled = true;
        txtconfirmasiPassword.disabled = true;
        txtNewPass.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
      
    }

    function lockUserManagementEdit() {
        txtUserId.disabled = true;
    }

    function lockUserManagementDelete() {
        txtUserId.disabled = true;
        txtPassword.disabled = true;
        ddGroup.disabled = true;
        txtNama.disabled = true;
        txtNewPass.disabled = true;
        ddStatusActive.disabled = true;
        txtconfirmasiPassword.disabled = true;
    }

</script>



</asp:Content>

