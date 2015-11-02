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

public partial class Pages_GroupManagementList : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    private string groupsid;


    protected void Page_Load(object sender, EventArgs e)
    {
         isiPeriode();
         bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
    }

    public void isiPeriode()
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
    
                LANDCOMP.ExecuteSTP eSTP_L = new LANDCOMP.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List7("P_GROUPS", param1L, "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                groupsid = Session["groups"].ToString();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    //Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["GroupIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["GroupsNamess"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["GroupsLanjut"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["GroupsExcept"].ToString()) + "</cell>");

                    if (groupsid == "Operator")
                    {
                        Response.Write("<cell>" + RemoveWhiteSpace("View^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["GroupIDents"].ToString() + "") + "</cell>");

                    }
                    else
                    {

                        Response.Write("<cell>" + RemoveWhiteSpace("View^GroupManagementForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["GroupIDents"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Edit^GroupManagementForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["GroupIDents"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^GroupManagementForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["GroupIDents"].ToString() + "") + "</cell>");
                    }
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