using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace TMS
{
    public partial class GetDocPdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {                       
                byte[] bytes;
                string fileName, contentType;

                MyCon constr = new MyCon();
                SqlConnection con = new SqlConnection(constr.getconstr());

                //Get Doc Information
                using (SqlCommand cmd = new SqlCommand("Download_Doc"))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;              

                    cmd.Connection = con;
                    //con.Open();
                    cmd.Parameters.AddWithValue("@Doc_ID", Session["Doc_ID"].ToString());
                    cmd.Parameters.AddWithValue("@Version_ID", Session["Version_ID"].ToString());

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["Name"].ToString();
                    }
                    con.Close();
                }


                // Creating Log of Doc Opened by user
                using (SqlCommand cmd1 = new SqlCommand("Sp_Doc_Open_log"))
                {
                    con.Open();
                    cmd1.CommandType = CommandType.StoredProcedure;
                
                    cmd1.Connection = con;
                    cmd1.Parameters.AddWithValue("@Doc_ID", Session["Doc_ID"].ToString());
                    cmd1.Parameters.AddWithValue("@Version_ID", Session["Version_ID"].ToString());
                    cmd1.Parameters.AddWithValue("@Opened_By", Session["User_ID"].ToString());
                    cmd1.ExecuteNonQuery();
                    con.Close();                  
                }

                // Opening DOC
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = contentType;
                Response.AppendHeader("Content-Disposition", "Inline; filename=" + fileName);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();

                //string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"500px\" height=\"300px\">";
                //embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
                //embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                //embed += "</object>";
                //ltEmbed.Text = string.Format(embed, ResolveUrl("~/Document/Report1.pdf"));

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }  
    }
}