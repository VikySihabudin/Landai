<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPageTest.master" AutoEventWireup="true" CodeFile="peta.aspx.cs" Inherits="Pages_peta" %>

<asp:Content  ContentPlaceHolderID="head" Runat="Server">

<link href="../JavaScript/webgis/js/313/dijit/themes/claro/claro.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/Grid.css" rel="stylesheet" type="text/css" />
     <link href="../JavaScript/webgis/js/313/dojox/grid/resources/claroGrid.css" rel="stylesheet" type="text/css" />
     <link href="../JavaScript/webgis/js/313/esri/css/esri.css" rel="stylesheet" type="text/css" />
      <link href="../JavaScript/webgis/css/layout.css" rel="stylesheet" type="text/css" />
      <script src="../JavaScript/webgis/js/313/init.js" type="text/javascript"></script>
      <script src="../JavaScript/webgis/adaro.js" type="text/javascript"></script>
      <script src="../JavaScript/webgis/js/313/upclick-min.js" type="text/javascript"></script>

       </asp:Content>
<asp:Content  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <div data-dojo-type="dijit/layout/BorderContainer" data-dojo-props="design:'headline'"  style="width:100%;height:100%;margin:0;">
    <div  data-dojo-type="dijit/layout/ContentPane" data-dojo-props="region:'top'" style="background-color:#FF6600;height:40px;">
      <span style="font-size:20pt;font-family: Franklin Gothic Medium;font-style:bold;"><center>LANDMAP</center></span>
      
    </div>
    <div id="map"  >
      <div id="cari" > 
        Parcel ID: <input type="text" id="pid" size="20" value=" " />      
        <button id="search" data-dojo-type="dijit.form.Button" type="button" data-dojo-attach-point="button"  >Cari       
        </button> 



      </div>

        <div id="gris">
     <table data-dojo-type="dojox/grid/DataGrid" data-dojo-id="grid"  id="grid" data-dojo-props="rowsPerPage:'5', rowSelector:'20px'">
      <thead>
        <tr>
          <th field="PID">Parcel ID</th>
          <th field="Status_Lhn" >Status</th>
          <th field="Nama">Nama</th>
          <th field="Desa">Desa</th>
          <th field="Registrasi" >Registrasi</th>
        </tr>
      </thead>
    </table>
    </div>

    <div id="addshp">
              <form enctype="multipart/form-data" method="post" id="uploadForm">
              <div class="field">
                  <label class="file-upload">
                      <span><strong>Add To Map</strong></span>
                      <!--input type="file" name="file" id="inFile" /-->
                      <input type="file" name="file" id="inFile" />
                  </label>
              </div>
              </form>
              <div class="field">
                  <label class="file-upload">
                      <span><strong>Upload</strong></span>
                      <!--input type="file" name="file" id="inFile" /-->
                      <input type="file" name="file" id="uploadshp" onclick="upload()"/>
                  </label>
              </div>
              <span class="file-upload-status" style="opacity:1;" id="upload-status"></span>
              <div id="fileInfo"> </div>
        </div>
    
   
  </div>
  </asp:Content>