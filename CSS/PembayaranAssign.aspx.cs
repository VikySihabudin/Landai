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

public partial class Pages_PembayaranAssign : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;

    protected void Page_Load(object sender, EventArgs e)
    {
        isiTeknis();
        isiFilter();
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
    }

    public void isiFilter()
    {
        query = @"SELECT codessDescs1, codessCodess FROM CODESS WHERE codessHeadss = '9'";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddprg.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddprg.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiTeknis()
    {
        query = @"SELECT GrupmnModuls,GrupmnUserId FROM GRUPMN WHERE GrupmnModuls ='PMBYRN'";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddteknis.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddteknis.Items.Add(new ListItem(dt.Rows[i]["GrupmnUserId"].ToString()));
            }
        }
        dt.Dispose();
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

            case "E":

                Response.ContentType = "text/plain";
                var param1 = Request.Params["param1"].ToString();
                var param2 = Request.Params["param2"].ToString();
                var param4 = Request.Params["param4"].ToString();
                var param5 = Request.Params["param5"].ToString();
                var param6 = Request.Params["param6"].ToString();
                var param7 = Request.Params["param7"].ToString();
                var param8 = Request.Params["param8"].ToString();
                var param21 = Request.Params["param21"].ToString();
                //var param17 = "hanny"; //session
                var param22 = Session["userid"].ToString();
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save23("P_PMBYRN", param1, param2, "", param4, param5, param6, param7, param8, "", "", "", "", "", "", "", "", "", "", "", "", param21, param22, "");
                Response.End();
                return false;

            case "L":

                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                var param4L = Request.Params["param4"].ToString();
                var param5L = Request.Params["param5"].ToString();
                LANDCOMP.ExecuteSTP eSTP_L = new LANDCOMP.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List23("P_PMBYRN", param1L, param2L, "", param4L, param5L, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnNmrByr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>"); 
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnAssign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnLnjuts"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["Assign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks1NmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks1NmrNeg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsNovism"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks1NmrBr1"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }
}