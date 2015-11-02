<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MPForm.master" CodeFile="R_PraRegistrasi.aspx.cs" Inherits="Pages_R_PraRegistrasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br /><br />
<div class="container">
<center>
    <h2>REPORT PRA REGISTRASI</h2>
    <br />
    <hr class="style-four"></hr>
</center><br />
    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-lg-2">Pilih Bulan</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddBulan" runat="server" class="form-control input-lg"></asp:DropDownList>
            </div>
            <label for="identitas" class="control-label col-lg-2">Pilih Tahun</label>
            <div class="col-md-3">
                <asp:TextBox id="txtTahun" type="text" runat="server" class="form-control input-lg" placeholder= "..." />
            </div>
            <%--<div class="col-md-2">
                <input type="button" id="btnPdf" value="PDF"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
            </div>--%>
        </div>

        <br />

        <div class="form-group">
        <center>    
            <div class="col-lg-12">
                <input type="button" id="btnPdf" value="Generate to PDF"  class="btn btn-lg btn-success" onclick="btnClick(this)" />
                
            </div>
        </div>
        </center>
    </form>    

</div>



<script type="text/javascript">
    var localURL = "R_PraRegistrasi.aspx";

    var bulan = document.getElementById("<%= ddBulan.ClientID %>");
    var tahun = document.getElementById("<%= txtTahun.ClientID %>");
    var btnPDF = document.getElementById("btnPDF");

    function btnClick(btn) {
        //if (btn.id == 'btnCari')
        //    searchListOfftake();
        //else if (btn.id == 'btnPDF') {
            //alert('S');
        var url = "http://localhost/landcomp/report/r001.aspx";
            url += "?rnd=" + Math.random() * 4
                + "&sm=l"
                + "&param1=" + tahun.value + "-" + bulan.value + "-01"
                + "";

            //   alert(localURL+"?"+url);
            window.open(url, '', 'width=700,height=300');
        //}
    }


</script>

</asp:Content>
