<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fusion.aspx.cs" Inherits="fusion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="Javascript/fusionchart/Gallery/assets/ui/css/style.css" rel="stylesheet" type="text/css" />
    <link href="Javascript/fusionchart/Gallery/assets/prettify/prettify.css" rel="stylesheet"
        type="text/css" />
    <script src="Javascript/fusionchart/Gallery/assets/prettify/prettify.js" type="text/javascript"></script>
        <script type="text/javascript" src="Javascript/fusionchart/Charts/jquery.min.js"></script>
        <script type="text/javascript" src="Javascript/fusionchart/Charts/FusionCharts.js"></script>

    
    <script src="Javascript/fusionchart/Gallery/assets/ui/js/json2.js" type="text/javascript"></script>
    <script src="Javascript/fusionchart/Gallery/assets/ui/js/lib.js" type="text/javascript"></script>

    <script src="Javascript/fusionchart/Gallery/Data/String/js/MSStCol2DLine1.js" type="text/javascript"></script>
</head>
<h3 class="chart-title">Mulit-series Stacked Column 2D Line Dual Y Combination Chart</h3>
        <p>&nbsp;</p>

        <div id="chartdiv" align="center">Chart will load here</div>
        <script type="text/javascript">
            var chart = new FusionCharts("Javascript/fusionchart/Charts/MSStackedColumn2DLineDY.swf", "ChartId", "560", "400", "0", "0");
            chart.setXMLData(dataString);
//            chart.setXMLUrl("Javascript/fusionchart/Gallery/Data/XML/data.xml");
            chart.render("chartdiv");
		</script>
		  <p>&nbsp;</p>
		  <P align="center">Multi-Series 2D Stacked Combination chart with line dataset showing breakup of revenue between products and services Columns are plotted against primary axis, whereas lines are plotted against secondary axis.</P> 
 <br/> 
<div class="qua-button-holder"></div>
       
        <div class="show-code-block"></div>
     </body>
</html>
