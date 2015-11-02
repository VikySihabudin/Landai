using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Waindo.Conn;
using System.Configuration;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class Pages_Upload : System.Web.UI.Page
{
    private string _stFAsli;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

     public void AjaxFileUploadMRS_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string user = Request.Params["user"].ToString();
        string wilayah = Request.Params["wilay"].ToString();

        LANDCOMP.generateNUm gn = new LANDCOMP.generateNUm();
        gn.Datas();

        string _stNomor;

        string _stDates = DateTime.Today.ToString("yyyyMMdd");

        string uploadFolder = Request.PhysicalApplicationPath + "uploadDocument\\";

        LANDCOMP.paramz ext = new LANDCOMP.paramz();

        ext.setExtension(Path.GetExtension(e.FileName));

        if (ext.getExtsion() != ".exe")
        {
            _stFAsli = System.IO.Path.GetFileName(e.FileName);

            string wilay = user;
            string owner1 = "";
            switch (wilayah)
            {
                case "1":
                    owner1 = "SBU1";
                    break;
                case "2":
                    owner1 = "SBU2";
                    break;
                case "3":
                    owner1 = "SBU3";
                    break;
                case "4":
                    owner1 = "TSJ1";
                    break;
                case "5":
                    owner1 = "LANDCOMP1";
                    break;
                default:
                    break;
            }

            _stNomor = gn.GenerateNumber(owner1, 100, 51, _stDates, user);

            AjaxFileUploadMRS.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + user + "|" + wilayah);

        }
     }
}