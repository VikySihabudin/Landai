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

public partial class Pages_VisumList : System.Web.UI.Page
{

    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
   // private string groupsid;
    protected String userid = "";
    protected String groups = "";
    protected String VerifikasiView = "";
    protected String VerifikasiEdit = "";
    protected String VerifikasiDelete = "";
    protected String VerifikasiAssign = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        HakAkses();
        isiTeknis();
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
    }

    private void HakAkses()
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

            if (Session["groups"] is object)
            {
                groups = Session["groups"].ToString();

            }

        }

        if (!(Session["userid"] is object))
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Session sudah habis. Silakan login kembali.');");
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "", "", "", "", "");

        dt = ds.Tables[0];

        VerifikasiEdit = dt.Rows[4]["VerifikasiEdit"].ToString(); //0
        VerifikasiDelete = dt.Rows[4]["VerifikasiDelete"].ToString(); //1
        VerifikasiView = dt.Rows[4]["Verifikasi"].ToString(); //2
        VerifikasiAssign = dt.Rows[4]["VerifikasiAssign"].ToString(); //3

        dt.Dispose();


        if (VerifikasiView.ToString() != "1")
        {
            if (groups.ToString() != "1")
            {
                Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Modul Ini');");
                Response.Write("location.href = 'home.aspx';");
                Response.Write("</script>");
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

                HakAkses();
                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                var param4L = Request.Params["param4"].ToString();
                var param5L = Request.Params["param5"].ToString();
                LANDCOMP.ExecuteSTP eSTP_L = new LANDCOMP.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List11("P_VISUMS", param1L, param2L, "", param4L, param5L, "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                //groupsid = Session["groups"].ToString();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsNovism"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["registNmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsAssign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsVerLnj"].ToString()) + "</cell>");
                   

                    if (dt.Rows[i]["visumsNovism"].ToString() != "")
                    {
                        if (groups.ToString() == "1")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("View^VisumForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Edit^VisumForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Delete^VisumForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                        }
                        else
                        {
                            if (dt.Rows[i]["visumsVerLnj"].ToString() != "Lanjut")
                            {
                                if (VerifikasiView.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("View^VisumForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                                }
                                if (VerifikasiEdit.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Edit^VisumForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                                }
                                if (VerifikasiDelete.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^VisumForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");

                                }
                            }
                        }
                    
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

    public void isiTeknis()
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


    
}