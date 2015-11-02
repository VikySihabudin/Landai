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
using System.IO;

using System.Web.Services;


public partial class Pages_MasterIdentitasForm : System.Web.UI.Page
{
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    DataTable dt;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;

    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";
    protected String MasterIdentitasEdit = ""; //0
    protected String MasterIdentitasDelete = ""; //1
    protected String MasterIdentitasView = ""; //2
    protected String MasterIdentitasAssign = "";//3

    private string _stFAsli;

    protected void Page_Load(object sender, EventArgs e)
    {
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        HakAkses();
        if (normal)
        {
            if (!IsPostBack)
            {
                Bind();
                //ServiceSelect("MRSEVCpic");
            }
        }


        //WEBCAM

        if (!this.IsPostBack)
        {
            if (Request.InputStream.Length > 0)
            {
                using (StreamReader reader = new StreamReader(Request.InputStream))
                {
                    string hexString = Server.UrlEncode(reader.ReadToEnd());
                    //string imageName = txtNoIdentitas.Text;
                    //string imagePath = string.Format("asdf.png", imageName);
                    string imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                    string imagePath = string.Format("Captures/{0}.png", imageName);
                    File.WriteAllBytes(Server.MapPath(imagePath), ConvertHexToBytes(hexString));
                    Session["CapturedImage"] = ResolveUrl(imagePath);
                }
            }
        }

    }

    private static byte[] ConvertHexToBytes(string hex)
    {
        byte[] bytes = new byte[hex.Length / 2];
        for (int i = 0; i < hex.Length; i += 2)
        {
            bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
        }
        return bytes;
    }

    [WebMethod(EnableSession = true)]

    public static string GetCapturedImage()
    {
        string url = HttpContext.Current.Session["CapturedImage"].ToString();
        HttpContext.Current.Session["CapturedImage"] = null;
        return url;
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

        MasterIdentitasView = dt.Rows[11]["MasterIdentitas"].ToString(); //0
        MasterIdentitasEdit = dt.Rows[11]["MasterIdentitasEdit"].ToString(); //1
        MasterIdentitasDelete = dt.Rows[11]["MasterIdentitasDelete"].ToString(); //2
        MasterIdentitasAssign = dt.Rows[11]["MasterIdentitasAssign"].ToString(); //3

        dt.Dispose();

        if (Param1 == "")
        {
            if (MasterIdentitasView.ToString() != "1")
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

        else if (Param1 == "F")
        {
            if (MasterIdentitasView.ToString() != "1")
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
            if (MasterIdentitasEdit.ToString() != "1")
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
            if (MasterIdentitasDelete.ToString() != "1")
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

        else if (Param1.ToString() == "I")
        {
            if (MasterIdentitasAssign.ToString() != "1")
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
        else
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Aksi Yang Anda Cari Tidak Ditemukan');");
            Response.Write("location.href = 'home.aspx';");
            Response.Write("</script>");
        }


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

    public void Bind()
    {
        BindIdentitas();
        BindJenisKelamin();
        BindPekerjaan();
        BindStatus();
    }

    private void BindIdentitas()
    {
        
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    landcomp.CODESS
                    WHERE   codessHeadss = 3
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddIdentitas.Items.Clear();
            ddIdentitas.Items.Add(new ListItem("Pilih Identitas", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
               ddIdentitas.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString())  );
            }
        }
        dt.Dispose();
    }

    private void BindJenisKelamin()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    landcomp.CODESS
                    WHERE   codessHeadss = 1
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            DDJenisKelamin.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDJenisKelamin.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    private void BindPekerjaan()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    landcomp.CODESS
                    WHERE   codessHeadss = 2
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddPekerjaan.Items.Clear();
            ddPekerjaan.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddPekerjaan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }

        if (dt.Rows.Count > 0)
        {
            PopupddPkrjAnak.Items.Clear();
            PopupddPkrjAnak.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                PopupddPkrjAnak.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }

        if (dt.Rows.Count > 0)
        {
            PopupddPkrjSaudara.Items.Clear();
            PopupddPkrjSaudara.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                PopupddPkrjSaudara.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }

        dt.Dispose();
    }

    private void BindStatus()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    landcomp.CODESS
                    WHERE   codessHeadss = 5
                            AND NOT codessCodess IN (0,3,4)";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            DDStatus.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDStatus.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

     private bool ServiceSelect(string sm)
     {
       
        switch (sm)
        {

            case "select":

                var param1SM = Request.Params["param1"].ToString();
                var param2SM = Request.Params["param2"].ToString();

                LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.param26("P_MINDENT", param1SM, param2SM, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["MidentIdents"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentJnsIdn"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNamass"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentJnsKel"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTmplhr"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTgllhr"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentPekerj"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmrPeg"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentAlamat"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmrHps"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentStatus"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmPsng"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTmpPas"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTglPas"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentThnNkh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmAyah"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTglAyh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentKrjAyh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentAlmAyh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmIbus"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTglIbu"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentKrjIbu"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentAlmIbu"].ToString() + "|");
                

                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "SA":

                var param1SA = Request.Params["param1"].ToString();
                var param2SA = Request.Params["param2"].ToString();

                LANDCOMP.ExecuteSTP eSTP_SA = new LANDCOMP.ExecuteSTP();
                eSTP_SA.Datas();
                DataSet ds_SA = new DataSet();
                ds_SA = eSTP_SA.param7("P_MINDENT_A", param1SA, param2SA, "", "", "", "", "");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentTgllhr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentPkrjan"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentAlamat"].ToString()) + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace("View^javascript:View(\"" + "SA" + "\",\"" + "SA" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace("Edit^javascript:EditDetil(\"" + "UA" + "\",\"" + "UA" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" +"DA" + "\",\"" + "DA" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "SS":

                var param1SS = Request.Params["param1"].ToString();
                var param2SS = Request.Params["param2"].ToString();
               

                LANDCOMP.ExecuteSTP eSTP_SS = new LANDCOMP.ExecuteSTP();
                eSTP_SS.Datas();
                DataSet ds_SS = new DataSet();
                ds_SA = eSTP_SS.param7("P_MINDENT_S", param1SS, param2SS, "", "", "", "", "");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentTgllhr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentPkrjan"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentAlamat"].ToString()) + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace("View^javascript:View(\"" + "SS" + "\",\"" + "SS" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace("Edit^javascript:Edit(\"" + "US" + "\",\"" + "US" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "DS" + "\",\"" + "DS" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "ListUploadIdentitasLahan":

                var Param1z = Request.Params["param1"].ToString();
                var Param2z = Request.Params["IDRegistrasi"].ToString();

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();


                LANDCOMP.ExecuteSTP eSTPz = new LANDCOMP.ExecuteSTP();
                eSTPz.Datas();
                DataSet dsz = new DataSet();
                dsz = eSTPz.param26("P_MINDENT", Param1z, Param2z, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                //dsz = eSTPz.List34("P_REGIST", Param1z, Param2z, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = dsz.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pic + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + Param2z + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                //conn.myConnectionClose();
                Response.End();
                return false;

            case "ListUploadKelengkapan":

                var Param1a = Request.Params["param1"].ToString();
                var Param2a = Request.Params["IDRegistrasi"].ToString();

                String path_pica = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();


                LANDCOMP.ExecuteSTP eSTPa = new LANDCOMP.ExecuteSTP();
                eSTPa.Datas();
                DataSet dsa = new DataSet();
                dsa = eSTPa.List6("P_REGIST_D", Param1a, Param2a, "", "", "", "");

                dt = dsa.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs2"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pica + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + Param2a + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                //conn.myConnectionClose();
                Response.End();
                return false;

            case "df":
                Response.Clear();
                string namafile = (Request.Params["filelama"] is object ? Request.Params["filelama"].ToString() : "");
                String urlfile = (Request.Params["namafile"] is object ? Request.Params["namafile"].ToString() : "");
                String randomfile = (Request.Params["random"] is object ? Request.Params["random"].ToString() : "");
                string type = "";
                switch (namafile.Substring(namafile.Length - 4))
                {
                    case ".htm":
                    case ".html":
                        type = "text/HTML";
                        break;

                    case ".txt":
                        type = "text/plain";
                        break;

                    case ".doc":
                    case ".docx":
                    case ".rtf":
                        type = "Application/msword";
                        break;
                    case ".xls":
                    case ".xlsx":
                        type = "Application/msexcel";
                        break;

                    case ".zip":
                    case ".rar":
                        type = "application/zip";
                        break;

                    case ".pdf":
                        type = "application/pdf";
                        break;
                    case ".jpg":
                        type = "image/JPG";
                        break;
                    case ".pgn":
                        type = "image/PNG";
                        break;
                    case ".tif":
                        type = "image/tif";
                        break;
                }

                Response.AddHeader("content-disposition", "attachment;filename=" + namafile + "");
                Response.ContentType = type;

                Response.WriteFile(Server.MapPath(@"~/uploaddocument/" + Request.Params["namafile"].ToString().Replace("&amp;", "&")));

                Response.End();
                return false;

            case "SaveUploadRegistrasi":
                Response.ContentType = "text/plain";
                Response.Write(SaveUploadRegistrasi());
                Response.End();
                return false;

            case "IA":

                string param1IA = Request.Params["param1"].ToString();
                string param2IA = Request.Params["param2"].ToString();
                //string param3IA = Request.Params["param3"].ToString();
                string param4IA = Request.Params["param4"].ToString();
                string param5IA = Request.Params["param5"].ToString();
                string param6IA = Request.Params["param6"].ToString();
                string param7IA = Request.Params["param7"].ToString();


                LANDCOMP.ExecuteSTP eSTP_IA = new LANDCOMP.ExecuteSTP();
                eSTP_IA.Datas();
                eSTP_IA.save7("P_MINDENT_A", param1IA, param2IA, "", param4IA, param5IA, param6IA, param7IA);

                return false;

            case "IS":

                string param1IS = Request.Params["param1"].ToString();
                string param2IS = Request.Params["param2"].ToString();
                //string param3IS = Request.Params["param3"].ToString();
                string param4IS = Request.Params["param4"].ToString();
                string param5IS = Request.Params["param5"].ToString();
                string param6IS = Request.Params["param6"].ToString();
                string param7IS = Request.Params["param7"].ToString();


                LANDCOMP.ExecuteSTP eSTP_IS = new LANDCOMP.ExecuteSTP();
                eSTP_IS.Datas();
                eSTP_IS.save7("P_MINDENT_S", param1IS, param2IS, "", param4IS, param5IS, param6IS, param7IS);

                return false;

            case "DA":

                string param1DA = Request.Params["param1"].ToString();
                string param2DA = Request.Params["param2"].ToString();
                string param3DA = Request.Params["param3"].ToString();

                LANDCOMP.ExecuteSTP eSTP_DA = new LANDCOMP.ExecuteSTP();
                eSTP_DA.Datas();
                eSTP_DA.save7("P_MINDENT_A", param1DA, param2DA, param3DA, "", "", "", "");

                return false;

            case "DS":

                string param1DS = Request.Params["param1"].ToString();
                string param2DS = Request.Params["param2"].ToString();
                string param3DS = Request.Params["param3"].ToString();

                LANDCOMP.ExecuteSTP eSTP_DS = new LANDCOMP.ExecuteSTP();
                eSTP_DS.Datas();
                eSTP_DS.save7("P_MINDENT_S", param1DS, param2DS, param3DS, "", "", "", "");

                return false;

            case "Save":
                Response.ContentType = "text/plain";
                Response.Write(Save());
                Response.End();
                return false;

            case "Insert":
                Response.ContentType = "text/plain";
                Response.Write(Save());
                Response.End();
                return false;

            case "Delete":
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

     private String SaveUploadRegistrasi()
     {
         string IDRegistrasi = Request.Params["IDREGISTRASI"].ToString();
         string _stNamaFile = Request.Params["NAMA"].ToString();
         string _stKeterangan = Request.Params["KETERANGAN"].ToString();
         string _stNomor = Request.Params["NOMOR"].ToString();

         LANDCOMP.UploadFile uf = new LANDCOMP.UploadFile();
         uf.Datas();

         string _stDates = DateTime.Today.ToString("yyyyMMdd");

         string param1 = Request.Params["param1"].ToString();
         string param5 = Request.Params["param5"].ToString();
         string user = Request.Params["user"].ToString();
         string wilayah = Request.Params["wilay"].ToString();


         string _stUploadKeterangan = "";
         _stUploadKeterangan = _stKeterangan;

         string uploadFolder = Request.PhysicalApplicationPath + "uploadDocument\\";
         string extension = Path.GetExtension(_stNamaFile);

         LANDCOMP.paramz ext = new LANDCOMP.paramz();

         LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
         eSTP.Datas();
         DataSet ds = new DataSet();

         //eSTP.save5("P_REGIST_U", param1, IDRegistrasi, "", param5, _stKeterangan);

         if (extension != ".exe")
         {

             uf.UploadFilesWeb("I", user, _stDates, "Master Identitas", param5, uploadFolder, IDRegistrasi, _stNomor + extension, _stNamaFile, _stUploadKeterangan);
         }

         var _stOutput = IDRegistrasi;

         return _stOutput;
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
         String param9 = ""; if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();
         String param10 = ""; if (Request.Params["param10"] is object) param10 = Request.Params["param10"].ToString();
         String param11 = ""; if (Request.Params["param11"] is object) param11 = Request.Params["param11"].ToString();
         String param12 = ""; if (Request.Params["param12"] is object) param12 = Request.Params["param12"].ToString();
         String param13 = ""; if (Request.Params["param13"] is object) param13 = Request.Params["param13"].ToString();
         String param14 = ""; if (Request.Params["param14"] is object) param14 = Request.Params["param14"].ToString();
         String param15 = ""; if (Request.Params["param15"] is object) param15 = Request.Params["param15"].ToString();
         String param16 = ""; if (Request.Params["param16"] is object) param16 = Request.Params["param16"].ToString();
         String param17 = ""; if (Request.Params["param17"] is object) param17 = Request.Params["param17"].ToString();
         String param18 = ""; if (Request.Params["param18"] is object) param18 = Request.Params["param18"].ToString();
         String param19 = ""; if (Request.Params["param19"] is object) param19 = Request.Params["param19"].ToString();
         String param20 = ""; if (Request.Params["param20"] is object) param20 = Request.Params["param20"].ToString();
         String param21 = ""; if (Request.Params["param21"] is object) param21 = Request.Params["param21"].ToString();
         String param22 = ""; if (Request.Params["param22"] is object) param22 = Request.Params["param22"].ToString();
         String param23 = ""; if (Request.Params["param23"] is object) param23 = Request.Params["param23"].ToString();
         String param24 = ""; if (Request.Params["param24"] is object) param24 = Request.Params["param24"].ToString();
         String param25 = ""; if (Request.Params["param25"] is object) param25 = Request.Params["param25"].ToString();
         String param26 = ""; if (Request.Params["param26"] is object) param26 = Request.Params["param26"].ToString();
         

         String sql = "";
         String output = "";

         try
         {

             output = param1;

                 if (output == "I")
                 {

                     LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                     eSTP.Datas();
                     DataSet ds = new DataSet();
                     ds = eSTP.LMID("P_MINDENT", "X", param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, userid, param26);
                     dt = ds.Tables[0];

                         if (dt.Rows.Count > 0)
                         {
                             if (output == "I")
                                 output = "notambah";

                             return output;
                         }
                 }
                    

             if (output == "I" || output == "E" || output == "D")
             //if (output == "E" || output == "D")
             {

                 LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
                 eSTP.Datas();
                 DataSet ds = new DataSet();
                 eSTP.save26("P_MINDENT", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, userid, param26);


                 return output;
             }

             //if (output == "I")
             //{

             //    LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
             //    eSTP.Datas();
             //    DataSet ds = new DataSet();
             //    eSTP.save26("P_MINDENT", "E", param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, param25, param26);


             //    return output;
             //}

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


     public void AjaxFileUploadIdentitasLahan_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
     {

         if (Session["userid"] is object)
         {
             userid = Session["userid"].ToString();
         }

         //string user = "";
         string wilayah = "";

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


             _stNomor = gn.GenerateNumber("", 101, 10, _stDates, userid);

             AjaxFileUploadIdentitasLahan.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
             e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

         }
     }

}