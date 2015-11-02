v<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MasIden_Anak.aspx.cs" MasterPageFile="~/MasterPages/MasterPage2.master" Inherits="Pages_MasIden_Anak" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div id="MasIden_Anak" style="position:absolute; border: #B5CDE4 1px solid; background-color: #f0f8ff; overflow:auto; padding-left:1%; padding-right:1%; padding-bottom:1%; ">
<h3>Master Identitas Anak Kandung</h3>
<table border="1">
    <tr>
        <td>
            <div style="height:180px; width:280px;">
                <table>
                    <tr>
                        <td>Nama Anak</td>
                        <td>:</td>
                        <td><input id="txtNamaAnak" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Tanggal lahir</td>
                        <td>:</td>
                        <td><input id="txtTglLahirAnak" type="text" runat="server" readonly="readonly" style="width: 60px;" /></td>
                    </tr>
                    <tr>
                        <td>Pekerjaan</td>
                        <td>:</td>
                        <td><asp:DropDownList ID="PekerjaanAnak" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td>:</td>
                        <td><asp:TextBox id="txtAlamatAnak" TextMode="multiline" Columns="15" Rows="3" runat="server" /></td>
                    </tr>
                </table>
              </div>
         </td>
       </tr>
</table>
</div>


    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>