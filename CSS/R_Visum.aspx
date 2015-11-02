<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MPForm.master" CodeFile="R_Visum.aspx.cs" Inherits="Pages_R_Visum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br /><br />
<div class="container">
<center>
    <h2>REPORT VISUM</h2>
</center>
    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Bulan</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddBulan" runat="server" class="form-control input-lg"></asp:DropDownList>
            </div>
            <label for="identitas" class="control-label col-md-1">Tahun</label>
            <div class="col-md-3">
                <asp:TextBox id="txtTahun" type="text" runat="server" class="form-control input-lg" placeholder= "..." />
            </div>
            <div class="col-md-2">
                <input type="button" id="btnPdf" value="PDF"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
            </div>
        </div>
    </form>    

</div>



<script type="text/javascript">
    var localURL = "R_Visum.aspx";

    var bulan = document.getElementById("<%= ddBulan.ClientID %>");
    var tahun = document.getElementById("<%= txtTahun.ClientID %>");
    var btnPDF = document.getElementById("btnPDF");

    datetime();

    function btnClick(btn) {
        //if (btn.id == 'btnCari')
        //    searchListOfftake();
        //else if (btn.id == 'btnPDF') {
        //alert('S');
        var url = "http://localhost/landcomp/report/r005.aspx";
        url += "?rnd=" + Math.random() * 4
                + "&sm=l"
                + "&param1=" + tahun.value + "-" + bulan.value + "-01"
                + "";

        //   alert(localURL+"?"+url);
        window.open(url, '', 'width=700,height=300');
        //}
    }

    function datetime() {
        var currentTime = new Date();
        var bulan = currentTime.getMonth() + 1;
        document.getElementById("<%= ddBulan.ClientID %>").value = bulan

        var tahun = currentTime.getFullYear();
        document.getElementById("<%= txtTahun.ClientID %>").value = tahun
    }


</script>

</asp:Content>
