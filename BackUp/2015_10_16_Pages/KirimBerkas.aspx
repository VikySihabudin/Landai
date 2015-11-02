<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageBootstrap.master" AutoEventWireup="true" CodeFile="KirimBerkas.aspx.cs" Inherits="Pages_KirimBerkas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="container">
<h2>Kirim Berkas</h2>
      <p>Silahkan masukkan data secara benar.</p>
	  	<table border="0" class="table" style="width:600px;">
              <tr>
                <th>No Registrasi</th>
                <th>:</th>
                <th><asp:TextBox id="txtNoIdentitas" type="text" runat="server" class="form-control" placeholder= "..." />
                <asp:Button runat="server" ID="btnCari" Text="Cari"  /></th>                
              </tr>
        </table>
        
        <table border="0" class="table" style="width:600px;">
           <thead>
              <tr>
                <th>Nama</th>
                <th>:</th>
                <th><asp:TextBox id="txtNoPL" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>                
              </tr>
            </thead>
            
              <tr>
                <th>Nomor Identitas</th>
                <th>:</th>
                <th><asp:TextBox id="TextBox4" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>           
              </tr>
              <tr>
                <th>No PR</th>
                <th>:</th>
                <th><asp:TextBox id="TextBox5" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>             
              </tr> 
              <tr>
                <th>Nomor HP</th>
                <th>:</th>
                <th><asp:TextBox id="TextBox6" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>             
              </tr>
              <tr>
                <th>Desa</th>
                <th>:</th>
                <th><asp:TextBox id="TextBox1" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>             
              </tr>
              <tr>
                <th>Kecamatan</th>
                <th>:</th>
                <th><asp:TextBox id="TextBox2" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>            
              </tr>
              <tr>
                <th>Kabupaten</th>
                <th>:</th>
                <th><asp:TextBox id="TextBox3" type="text" runat="server" class="form-control" placeholder= "" readonly /></th>             
              </tr>

              <tr>
                <th>di serahkan kepada :</th>
                <th>:</th>
                <th><asp:TextBox id="txtFileSHP" type="text" runat="server" class="form-control" placeholder= "" />
                <asp:Button runat="server" ID="Button1" Text="Cari"  /></th>            
              </tr>    
             </table>
             <table border="0" class="table" style="width:600px;">
              <tr>
                <th align="center" colspan="3"><center>
                     <button type="reset" class="btn btn-lg btn-default" id="btnCancel">Cancel</button>
                     <button type="button" class="btn btn-lg btn-primary" id="btnSave">Submit</button>
                   </center>
                </th>            
              </tr>
           
        </table>

</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript">
    $(function tglpengukuran() {
        $("[id$=txtTglPengukuran]").datepicker({
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: "../img/calender.png"
        });
    });
</script>


</asp:Content>

