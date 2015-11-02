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

public partial class Pages_NegosiasiForm : System.Web.UI.Page
{
    //Connection conn2;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    DataTable dt;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;
    private string lanjut;
    private string except;
    private string userid;
    private string groups;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            isiSepakat();
            isiNegoKe();
            isiObject();

            group();

            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        }
   
    }

    public void isiSepakat()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM landcomp.CODESS WHERE codessHeadss=6 AND codessStatss=1 ORDER BY codessCodess DESC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddSepakat.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddSepakat.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiNegoKe()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM landcomp.CODESS WHERE codessHeadss=24 AND codessStatss=1 ORDER BY codessCodess ASC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddNegosiasi.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddNegosiasi.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }


    public void isiObject()
    {
        query = @"  SELECT 'BANGUNAN' codessDescs1, '1' codessCodess ";

        dt = getDataTable(query);

        if (dt.Rows.Count > 0)
        {
            ddObjek.Items.Clear();
            ddObjek.Items.Add(new ListItem("Pilih Object", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddObjek.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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

    public void group()
    {
        if ((Session["userid"] is object) && (Session["groups"] is object) && (Session["lanjut"] is object) && (Session["except"] is object))
        {
            userid = Session["userid"].ToString();
            groups = Session["groups"].ToString();
            lanjut = Session["lanjut"].ToString();
            except = Session["except"].ToString();

            if (lanjut != "1")
            {
                ddSepakat.Visible = false;
                LSepakat.Visible = false;
            }

            if (except != "1")
            {
                chEksepsi.Visible = false;
                LEksepsi.Visible = false;
                txtKetEksepsi.Visible = false;
                LKEksepsi.Visible = false;
            }
        }
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
                var param2L = Request.Params["param2"].ToString();
                LANDCOMP.ExecuteSTP eSTP_L = new LANDCOMP.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List9("P_NEGOSI_D", param1L, param2L, "", "", "", "", "", "", "");
                dt = ds_L.Tables[0];
                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiDatess"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiObjeks"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiLuasss"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiHMinta"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiJHMinta"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiHTawar"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiJHTawar"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["Selisih"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiSequen"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            case "V":
                Response.ContentType = "text/plain";
                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();

                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();

                ds = eSTP.List13("P_NEGOSI", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["negosiNmrNeg"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["pengtoNmrPid"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["negosiKetrgn"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["negosiSepakt"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["negosiSKGR"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["negosiKetEks"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["negosiEkseps"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["minta"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["tawar"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["tglNego"].ToString() + "|"); //10
           
                dt.Dispose();
                Response.End();
                Response.End();
                return false;

            case "I":

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

                LANDCOMP.ExecuteSTP eSTP_IA = new LANDCOMP.ExecuteSTP();
                eSTP_IA.Datas();
                eSTP_IA.save9("P_NEGOSI_D", param1, param2, param3, param4, param5, param6, param7, param8, param9);

                return false;

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
        //string strCon = System.Configuration.ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal2"].ToString();    

        //conn2 = new Connection(strCon);
        
        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        String param8 = ""; if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString();
        String param9 = ""; if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();
        String param10 = ""; if (Request.Params["param10"] is object) param10 = Request.Params["param10"].ToString();
        String param11 = ""; if (Request.Params["param11"] is object) param11 = Request.Params["param11"].ToString();
        String param12 = ""; if (Request.Params["param12"] is object) param12 = Request.Params["param12"].ToString();
        String param13 = ""; if (Request.Params["param13"] is object) param13 = Request.Params["param13"].ToString();
        //String sql = "";
        String output = "";



           try
        {
              output = param1;

              if (output == "E" || output == "D" || output == "A")
              {
                  LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                  eSTP.Datas();
                  DataSet ds = new DataSet();
                  ds = eSTP.List13("P_NEGOSI", "X", param2, "", "", "", "", "", "", "", "", "", "", "");
                  dt = ds.Tables[0];

                  if (dt.Rows.Count > 0)
                  {
                      if (output == "E")
                          output = "noedit";

                      if (output == "D")
                          output = "nodelete";

                      if (output == "A")
                          output = "noadd";

                      return output;
                  }
              }

            if (output == "I" ||  output == "E" || output == "D")
            {
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save13("P_NEGOSI", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13);
                
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
