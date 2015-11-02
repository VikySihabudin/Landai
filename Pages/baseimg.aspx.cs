using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Drawing;
using System.Data.SqlClient;

public partial class WebCam_baseimg : System.Web.UI.Page
{

    protected String userid = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        //called page form json for creating imgBase64 in image

        StreamReader reader = new StreamReader(Request.InputStream); 
        String Data = Server.UrlDecode(reader.ReadToEnd());
        reader.Close();

        DateTime nm = DateTime.Now;
        string date = nm.ToString("yyyymmddMMss");
        //used date for creating Unique image name

        Session["capturedImageURL"] = Server.MapPath("~/Userimages/") + date + ".jpeg";  

        Session["Imagename"] = date + ".jpeg"; 
        // We can use name of image where ever we required that why we are storing in Session

        drawimg(Data.Replace("imgBase64=data:image/png;base64,", String.Empty), Session["capturedImageURL"].ToString());
        // it is method 
        // passing base64 string and string filename to Draw Image.

        insertImagePath(Session["Imagename"].ToString(), "~/Userimages/" + Session["Imagename"].ToString());
        // it is method 
        //inserting image in to database 


    }

    public void drawimg(string base64, string filename)  // Drawing image from Base64 string.
    {
        using (FileStream fs = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.Write))
        {
            using (BinaryWriter bw = new BinaryWriter(fs))
            {
               // String param2 = ""; if (Request.Params["para33m2"] is object) param2 = Request.Params["param2"].ToString();
                //if (param2 == "")
                //{
                    byte[] data = Convert.FromBase64String(base64);
                    bw.Write(data);
                    bw.Close();
                //}
            }
        }
    }

    public void insertImagePath(string imagename, string imagepath) // use for imserting image when it is created.
    {

        if (!(Session["userid"] is object))
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Session sudah habis. Silakan login kembali.');");
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

        }

        String param1 = "1"; //if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        //String noid = ""; if (Request.Params["noid"] is object) noid = Request.Params["noid"].ToString();
        //if (param2 != "")
        //{
            LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
            eSTP.Datas();
            DataSet ds = new DataSet();
            eSTP.save7("Usp_InsertImageDT", param1, imagename, imagepath, param2, param3, param4, userid);
        //}
     

        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mycon"].ToString());

        //SqlCommand cmd = new SqlCommand("Usp_InsertImageDT", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        ////cmd.Parameters.AddWithValue("@param1", 3);
        //cmd.Parameters.AddWithValue("@param1", 1);
        //cmd.Parameters.AddWithValue("@UserImagename", imagename);
        //cmd.Parameters.AddWithValue("@UserImagePath", imagepath);
        //cmd.Parameters.AddWithValue("@param2", param2);
        //cmd.Parameters.AddWithValue("@param3", param3);
        //cmd.Parameters.AddWithValue("@param4",7);
        //cmd.Parameters.AddWithValue("@UserID", 1);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close(); 
    }

}
