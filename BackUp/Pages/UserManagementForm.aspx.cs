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

public partial class Pages_UserManagementForm : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;

    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";
    protected String UserManagementEdit = ""; //0
    protected String UserManagementDelete = ""; //1
    protected String UserManagementView = ""; //2
    protected String UserManagementAssign = "";//3

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            stat();
            group();
            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
            HakAkses();
        }
        
    }

    public void HakAkses()
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

            if (Session["groups"] is object)
            {
                groups = Session["groups"].ToString();

            }

        }

        LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        var Param1 = "";

        bool cek = true;
        if (cek && (Request.Params["param1"] is object))
        {
            Param1 = Request.Params["param1"].ToString();
        }
        else
        {
            Param1 = "";
        }

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "", "", "", "", "");
        dt = ds.Tables[0];

        UserManagementView = dt.Rows[10]["UserManagement"].ToString(); //0
        UserManagementEdit = dt.Rows[10]["UserManagementEdit"].ToString(); //1
        UserManagementDelete = dt.Rows[10]["UserManagementDelete"].ToString(); //2
        UserManagementAssign = dt.Rows[10]["UserManagementAssign"].ToString(); //3

        dt.Dispose();

        if (Param1 == "")
        {
            if (UserManagementView.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Menambah Di Modul Ini');");
                    Response.Write("location.href = 'home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else if (Param1 == "V")
        {
            if (UserManagementView.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Di Modul Ini');");
                    Response.Write("location.href = 'home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else if (Param1 == "E")
        {
            if (UserManagementEdit.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Edit Di Modul Ini');");
                    Response.Write("location.href = 'home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else if (Param1.ToString() == "D")
        {
            if (UserManagementDelete.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Delete Di Modul Ini');");
                    Response.Write("location.href = 'home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Aksi Yang Anda Cari Tidak Ditemukan');");
            Response.Write("location.href = 'home.aspx';");
            Response.Write("</script>");
        }


    }

    public void group()
    {
        query = @"SELECT GroupsNamess, GroupIdents FROM GROUPS";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddGroup.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddGroup.Items.Add(new ListItem(dt.Rows[i]["GroupsNamess"].ToString(), dt.Rows[i]["GroupIdents"].ToString()));
            }
        }
        dt.Dispose();
    }


    public void stat()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM landcomp.CODESS WHERE codessHeadss=18 AND codessStatss=1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddStatusActive.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddStatusActive.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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
            case "V":

                var param1 = Request.Params["param1"].ToString();
                var param2 = Request.Params["param2"].ToString();

                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List8("P_USERSS", param1, param2, "", "", "", "", "", "");
                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["UserssIDents"].ToString() + "|"); //0
                //Response.Write(dt.Rows[0]["UserssPasswd"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["UserssNamess"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["UserssGroups"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["UserrsActive"].ToString() + "|"); //4

                dt.Dispose();

                Response.End();
                Response.End();
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

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

        }

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

            if (output == "E" )
            {
                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List8("P_USERSS", "X", param2, param8, "", "", "", "", "");
                dt = ds.Tables[0];

                if (dt.Rows.Count > 0)
                {

                   
                        eSTP.Datas();
                        eSTP.save8("P_USERSS", param1, param2, param3, param4, param5, param6, userid, "");
                        return output;
                   
                }
                output = "noedit";
                return output;
            }

            if (output == "D" || output == "I")
            {

                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                eSTP.save8("P_USERSS", param1, param2, param3, param4, param5, param6, userid, param8);
                return output;

            }

           
            
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