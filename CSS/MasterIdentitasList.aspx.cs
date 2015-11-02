using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class Pages_MasterIdentitasList : System.Web.UI.Page
{
    DataTable dt;
    private string groupsid;

    protected void Page_Load(object sender, EventArgs e)
    {
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        
    }

    private string RemoveWhiteSpace(string value)
    {
        value = value.Replace("&", "&amp;");
        value = value.Replace("<", "&lt;");
        value = value.Replace(">", "&gt;");
        value = value.Replace("'", "&apos;");
        //value = value.Replace(",", ".");
        value = value.Replace(@"\", "&quot;");
        return value;
    }


    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "L":

                var param1L = Request.Params["param1"].ToString();
                //var param2L = Request.Params["param2"].ToString();

                LANDCOMP.ExecuteSTP eSTP_L = new LANDCOMP.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.LMID("P_MINDENT", param1L, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_L.Tables[0];


                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                groupsid = Session["groups"].ToString();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentIdents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentJnsKel"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentTmplhr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentTglLhr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentStatus"].ToString()) + "</cell>");
                    if (groupsid == "Operator")
                    {
                        Response.Write("<cell>" + RemoveWhiteSpace("View^MasterIdentitasForm.aspx?rand=" + r.Next() + "&param1=F" + "&param2=" + dt.Rows[i]["MidentIdents"].ToString() + "") + "</cell>");
                    }
                    else
                    {
                        Response.Write("<cell>" + RemoveWhiteSpace("View^MasterIdentitasForm.aspx?rand=" + r.Next() + "&param1=F" + "&param2=" + dt.Rows[i]["MidentIdents"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Edit^MasterIdentitasForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["MidentIdents"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^MasterIdentitasForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["MidentIdents"].ToString() + "") + "</cell>");
                        //Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "D" + "\",\"" + "D" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + "\");^_self") + "</cell>");
                    }
                    Response.Write("</row>");
                }
                Response.Write("</rows>");



                dt.Dispose();

                Response.End();
                
                
                
                return false;

            //case "D":

            //    string param1D = Request.Params["param1"].ToString();
            //    string param2D = Request.Params["param2"].ToString();

            //    LANDCOMP.ExecuteSTP eSTP_D = new LANDCOMP.ExecuteSTP();
            //    eSTP_D.Datas();
            //    eSTP_D.LMID("P_MINDENT", param1D, param2D, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

            //    return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

}