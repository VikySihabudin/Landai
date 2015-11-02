using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using Waindo.Conn;

public partial class MasterPages_mpbootstrap : System.Web.UI.MasterPage
{
    protected String userid = "";
    protected String namass = "";
    protected String groups = "";
    protected String lanjut = "";
    protected String excepts = "";

    protected String modul = "";

    protected String praregistrasi = ""; //0
    protected String PengecekanLapangan = ""; //1
    protected String Registrasi = ""; //2
    protected String PengukuranT0 = ""; //3
    protected String Verifikasi = ""; //4
    protected String Negosiasi = ""; //5
    protected String Pemberkasan = ""; //6
    protected String Pembayaran = ""; //7
    protected String Finalisasi = ""; //8
    protected String GroupManagement = ""; //9
    protected String UserManagement = ""; //10
    protected String MasterIdentitas = ""; //11
    protected String MasterPerusahaan = ""; //12
    protected String MasterCodes = ""; //13
    protected String MasterMenu = ""; //14
    protected String SerahTerimaBerkas = ""; //15
    protected String TopPriority = ""; //16
    protected String FiveYears = ""; //17
    protected String LOM = ""; //18
    protected String Other = ""; //19
    protected String ReportPraRegistrasi = ""; //20
    protected String ReportPengecekanLapangan = ""; //21
    protected String ReportRegistrasi = ""; //22
    protected String ReportPengukuranT0 = ""; //23
    protected String ReportNegosiasi = ""; //24
    protected String ReportVerifikasi = ""; //25
    protected String ReportFinalisasi = ""; //26

    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        setProperties();

        if (!IsPostBack)
        {

            //bool normal = true;

            //if (normal && (Request.Params["sm"] is object))
            //{
            //    normal = ServiceSelect(Request.Params["sm"].ToString());

            //}

            HakAkses();
        }


        if (!(Session["userid"] is object))
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Session sudah habis. Silakan login kembali.');");
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }
        //Response.Write(userid.ToString());
    }

    private void HakAkses()
    {

        //Response.ContentType = "text/plain";

        LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "", "", "", "", "");

        dt = ds.Tables[0];

        //Response.ContentType = "text/plain";
       
        praregistrasi = dt.Rows[0]["PraRegistrasi"].ToString(); //0
        PengecekanLapangan = dt.Rows[1]["PengecekanLapangan"].ToString(); //1
        Registrasi = dt.Rows[2]["Registrasi"].ToString(); //2
        PengukuranT0 = dt.Rows[5]["PengukuranT0"].ToString(); //3
        Verifikasi = dt.Rows[4]["Verifikasi"].ToString(); //4
        Negosiasi = dt.Rows[3]["Negosiasi"].ToString(); //5
        Pemberkasan = dt.Rows[6]["Pemberkasan"].ToString(); //6
        Pembayaran = dt.Rows[7]["Pembayaran"].ToString(); //7
        Finalisasi = dt.Rows[8]["Finalisasi"].ToString(); //8
        GroupManagement = dt.Rows[9]["GroupManagement"].ToString(); //9
        UserManagement = dt.Rows[10]["UserManagement"].ToString(); //10
        MasterIdentitas = dt.Rows[11]["MasterIdentitas"].ToString(); //11
        MasterPerusahaan = dt.Rows[12]["MasterPerusahaan"].ToString(); //12
        MasterCodes = dt.Rows[13]["MasterCodes"].ToString(); //13
        MasterMenu = dt.Rows[14]["MasterMenu"].ToString(); //14
        SerahTerimaBerkas = dt.Rows[15]["SerahTerimaBerkas"].ToString(); //15
        TopPriority = dt.Rows[16]["TopPriority"].ToString(); //16
        FiveYears = dt.Rows[17]["FiveYears"].ToString(); //17
        LOM = dt.Rows[18]["LOM"].ToString(); //18
        Other = dt.Rows[19]["Other"].ToString(); //19
        ReportPraRegistrasi = dt.Rows[0]["ReportPraRegistrasi"].ToString(); //20
        ReportPengecekanLapangan = dt.Rows[1]["ReportPengecekanLapangan"].ToString(); //21
        ReportRegistrasi = dt.Rows[2]["ReportRegistrasi"].ToString(); //22
        ReportPengukuranT0 = dt.Rows[3]["ReportPengukuranT0"].ToString(); //23
        ReportNegosiasi = dt.Rows[5]["ReportNegosiasi"].ToString(); //24
        ReportVerifikasi = dt.Rows[4]["ReportVerifikasi"].ToString(); //25
        ReportFinalisasi = dt.Rows[8]["ReportFinalisasi"].ToString(); //26

        //Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
        //Response.Write("alert('Viky Ganteng');" + ReportFinalisasi);
        //Response.Write("</script>");

        dt.Dispose();

        //Response.End();

    }

    private void setProperties()
    {


        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();


            if (Session["namass"] is object)
            {
                namass = Session["namass"].ToString();
            }
            if (Session["groups"] is object)
            {
                groups = Session["groups"].ToString();

            }
            if (Session["lanjut"] is object)
            {
                lanjut = Session["lanjut"].ToString();
            }
            if (Session["excepts"] is object)
            {
                excepts = Session["excepts"].ToString();
            }

        }
    }

}
