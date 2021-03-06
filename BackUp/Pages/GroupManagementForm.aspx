﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MPForm.master" AutoEventWireup="true" CodeFile="GroupManagementForm.aspx.cs" Inherits="Pages_GroupManagementForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<input type="hidden" id="hidMode" value="I" />
<input type="hidden" id="hiIdentitas" value="I" />

<div class="container">

<br /><br /><br /><br />

<h2>Group Management</h2>
	
	<hr class="style-four">    
    
	<form role="form" class="form-horizontal" action="#">

        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Nama Group</label>
            <div class="col-lg-3"><asp:TextBox id="txtGroupsNamess" class="form-control input-lg" type="text" runat="server" /></div>			
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Group Lanjut</label>
            <div class="col-lg-3"><asp:DropDownList ID="ddLanjut" type="text" runat="server" class="form-control input-lg"></asp:DropDownList></div>			
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Group Except</label>
            <div class="col-lg-3"><asp:DropDownList ID="ddExcept" type="text" runat="server" class="form-control input-lg"></asp:DropDownList></div>			
        </div>

        <hr />

        <div class="form-group">
            <div class="col-md-10">
                <center>
                <%--<center><asp:CheckBox id="cbTest" CssClass="form-control checkbox-lg" runat="server" />           --%>   
                <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />             
                </center>
            </div>
        </div>
        

</div>


<script type="text/javascript">

    var localURL = "GroupManagementForm.aspx";
    var newUrl = "GroupManagementList.aspx";
    var txtGroupsNamess = document.getElementById("<%= txtGroupsNamess.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var ddExcept = document.getElementById("<%= ddExcept.ClientID %>");
    var hidMode = document.getElementById('hidMode');
    var hiIdentitas = document.getElementById('hiIdentitas');
    
    terimaURL();

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        //alert(params);
        splitparam(params);
    }


    function splitparam(loader) {
        var a = loader;
        if (a != '0') {
            var b = new Array();
            b = a.split('&');
            //            alert(a);


            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

            dhtmlxAjax.post(localURL, s, bindFormGroupManagement);

            var x = b[2].replace("param1=", "");
        }

        if (x == 'V') {
            txtGroupsNamess.disabled = true;
            ddLanjut.disabled = true;
            ddExcept.disabled = true;

            
        }
        else if (x == 'E') {
            btnSave.value = 'Save';
            hidMode.value = 'E';
            //alert(hidMode.value);
        }
        else if (x == 'D') {
            btnSave.value = 'Delete';
            hidMode.value = 'D';
            //alert(hidMode.value);
        }
    }



    function bindFormGroupManagement(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //lockPengecekanLapangan();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            //alert(b[0]);

            hiIdentitas.value = b[0];
            txtGroupsNamess.value = b[1];
            ddLanjut.value = b[2];
            ddExcept.value = b[3];

            //alert(b[2]);
        }
    }


    function btnClick(objBtn) {
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
                close();
                break;

            default:
                break;
        }
    }

    function Edit(tipe) {

        
        if (tipe.replace("param1=", "") == 'I') {
            //            alert(tipe.replace("param2=", ""));
            //alert(hiIdentitas.value);
            var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD" 
                        + "&param1=" + tipe
                        + "&param2=" + hiIdentitas.value
                        + "&param3=" + txtGroupsNamess.value
                        + "&param4=" + ddLanjut.value
                        + "&param5=" + ddExcept.value

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (tipe.replace("param1=", "") == 'E') {
        //alert("testE");
            //alert(tipe);e
            //alert(hiIdentitas.value);//100
            var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe
                        + "&param2=" + hiIdentitas.value
                        + "&param3=" + txtGroupsNamess.value
                        + "&param4=" + ddLanjut.value
                        + "&param5=" + ddExcept.value

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
    }
    
    function Delete() {
        
           var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + hiIdentitas.value

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


</script>

</asp:Content>

