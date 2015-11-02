﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Pages_VisumForm : System.Web.UI.Page
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
            group();
            isiObLah();
            isiSuLah();
            isiaksi();
            isiDoc();
            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
            isiLanjut();
        }
    }


    public void isiLanjut()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    landcomp.CODESS
                    WHERE   codessHeadss = 4
                            AND codessStatss = 1 ORDER BY codessCodess DESC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddLanjut.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddLanjut.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiaksi()
    {
        query = @"SELECT codessCodess,codessDescs1 FROM CODESS WHERE   codessHeadss = 20 ";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddAksi.Items.Clear();
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                ddAksi.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiObLah()
    {
        query = @"SELECT codessCodess,codessDescs1 FROM CODESS WHERE codessHeadss = 21 AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddTemObLah.Items.Clear();
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                ddTemObLah.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiSuLah()
    {
        query = @"SELECT codessCodess,codessDescs1 FROM CODESS WHERE codessHeadss = 22";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddTemSuLah.Items.Clear();
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                ddTemSuLah.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiDoc()
    {
        query = @"SELECT codessCodess,codessDescs1 FROM CODESS WHERE codessHeadss = 23";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddDocum.Items.Clear();
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                ddDocum.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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
            lanjut = Session["lanjut"].ToString();
            except = Session["except"].ToString();

            if (lanjut != "1")
            {
                ddLanjut.Visible = false;
                LLanjut.Visible = false;
            }

            if (except != "1")
            {
                cbEksepsi.Visible = false;
                LEksepsi.Visible = false;
                txtKetEks.Visible = false;
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
                var param4L = Request.Params["param4"].ToString();
                LANDCOMP.ExecuteSTP eSTP_L = new LANDCOMP.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List8("P_VISUMS_D", param1L, param2L, "", param4L, "", "", "", "");
                dt = ds_L.Tables[0];
                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                    if (param1L == "LR")
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            Random r = new Random();
                            Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                            Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsCodess"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsRekom"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsAksi"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsSequen"].ToString()) + "</cell>");
                            Response.Write("</row>");
                        }
                    }

                    else
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            Random r = new Random();
                            Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                            Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsCodess"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsKtrgn"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Hapus^javascript:Hapus(\"" + "DO" + "\",\"" + "DO" + "\",\"" + dt.Rows[i]["visumsNovism"].ToString() + "\",\"" + dt.Rows[i]["visumsSequen"].ToString() + "\",\"" + "\");^_self") + "</cell>");
                            Response.Write("</row>");
                        }
                    }
                Response.Write("</rows>");
                dt.Dispose();
                Response.End();
                Response.End();

                return false;


            case "V":

                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List11("P_VISUMS", Param1, Param2, "", "", "", "", "", "", "", "", "");
           
                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["visumsNovism"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["pengtoNmrPid"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["visumsVerLnj"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["visumsEkseps"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["VisumsKetEks"].ToString() + "|"); //5
                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
                Response.End();
                return false;

            case "CRUDOS":
                Response.ContentType = "text/plain";
                Response.Write(SaveOS());
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
        String param10 = ""; if (Request.Params["param10"] is object) param10 = Request.Params["param10"].ToString();
        String param11 = ""; if (Request.Params["param11"] is object) param11 = Request.Params["param11"].ToString();
        String sql = "";
        String output = "";

        try
        {
            output = param1;

            if (output == "E" || output == "D" || output == "A")
            {
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List11("P_VISUMS", "X", param2, "", "", "", "", "", "", "", "", "");
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
                eSTP.save11("P_VISUMS", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11);
                                  
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

    private String SaveOS()
    {
        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        String param8 = ""; if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString(); 
        //String sql = "";
        String output = "";

        try
        {
            output = param1;


            if (output == "I" || output == "DO" || output == "IR")
            {


                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save8("P_VISUMS_D", param1, param2, param3, param4, param5, param6, param7, param8);

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

        