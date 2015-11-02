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


public partial class Pages_SerahTerimaBerkas : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    private string groupsid;

    protected void Page_Load(object sender, EventArgs e)
    {
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
  
    }

    public DataTable getDataTable(string query)
    {
        dt = new DataTable();
        conn = new SqlConnection(connstring);
        conn.Open();
        sda = new SqlDataAdapter(query, conn);
        dt = new DataTable();
        sda.Fill(dt);
        conn.Close();
        return dt;
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
                ds_L = eSTP_L.List9("P_SRHTRM", param1L, "", "", "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmNmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentIdents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNmrHps"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mdesaaNmdesa"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mcamatNmcamt"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mkabupNmkabu"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmNmrSTs"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;
       
            case "V":
                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List9("P_SRHTRM", Param1, Param2, "", "", "", "", "","","");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0][""].ToString() + "|"); //
                Response.Write(dt.Rows[0][""].ToString() + "|"); //1
                Response.Write(dt.Rows[0][""].ToString() + "|"); //2
                Response.Write(dt.Rows[0][""].ToString() + "|"); //3

                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            //return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
                Response.End();
                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    private String Save()
    {
        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        String param8 = ""; if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString();
        String param9 = ""; if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();

        String sql = "";
        String output = "";

        try
        {

            output = param1;

            if (output == "E" || output == "D" || output == "A" || output == "I")
            {
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();

                eSTP.save9("[landcomp].[P_SRHTRM]", param1, param2, param3, param4, param5, param6, param7, param8, param9);

                return output;
            }

            else
                output = "gagal";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.End();
            return ex.Message;
        }

        return output;
    }
        
}

  