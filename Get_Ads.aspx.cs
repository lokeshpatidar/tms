using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TMS
{
    public partial class Get_Ads : System.Web.UI.Page
    {

        MyCon constr = new MyCon();


        protected void DownloadFile(object sender, EventArgs e)
        {

            try
            {
                if (Session["User_ID"] == null)
                {
                    Response.Redirect("SessionExpired.aspx", false);
                }
                else
                {

                    int id = int.Parse((sender as LinkButton).CommandArgument);
                    id = id - 1;
                    byte[] bytes;
                    string fileName, contentType;

                    SqlConnection con = new SqlConnection(constr.getconstr());
                    con.Open();
                    using (SqlCommand cmd1 = new SqlCommand("Sp_Doc_Open_log"))
                    {
                        cmd1.CommandType = CommandType.StoredProcedure;

                        TextBox Doc_ID;
                        Doc_ID = (TextBox)Grd_Get_SOP_List.Rows[id].FindControl("txt_Doc_ID");

                        TextBox Version_ID;
                        Version_ID = (TextBox)Grd_Get_SOP_List.Rows[id].FindControl("txt_Ver_ID");

                        cmd1.Connection = con;

                        cmd1.Parameters.AddWithValue("@Doc_ID", Doc_ID.Text);
                        cmd1.Parameters.AddWithValue("@Version_ID", Version_ID.Text);
                        cmd1.Parameters.AddWithValue("@Opened_By", Session["User_ID"].ToString());
                        cmd1.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd = new SqlCommand("Download_Doc"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        TextBox Doc_ID;
                        Doc_ID = (TextBox)Grd_Get_SOP_List.Rows[id].FindControl("txt_Doc_ID");

                        TextBox Version_ID;
                        Version_ID = (TextBox)Grd_Get_SOP_List.Rows[id].FindControl("txt_Ver_ID");

                        cmd.Connection = con;
                        //con.Open();
                        cmd.Parameters.AddWithValue("@Doc_ID", Doc_ID.Text);
                        cmd.Parameters.AddWithValue("@Version_ID", Version_ID.Text);

                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            bytes = (byte[])sdr["Data"];
                            contentType = sdr["ContentType"].ToString();
                            fileName = sdr["Name"].ToString();
                        }
                        con.Close();
                    }

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = contentType;
                    Response.AppendHeader("Content-Disposition", "Inline; filename=" + fileName);
                    Response.BinaryWrite(bytes);
                    Response.Flush();
                    Response.End();
                }
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["User_ID"] == null)
                {
                    Response.Redirect("SessionExpired.aspx", false);
                }
                else
                {

                    SqlConnection con = new SqlConnection(constr.getconstr());
                    con.Open();

                    Session["Doc_ID"] = Request.QueryString["Doc_ID"];

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "Get_AD";
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    string doc = Session["Doc_ID"].ToString();
                    cmd.Parameters.AddWithValue("@Doc_ID", doc);

                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    Grd_Get_SOP_List.DataSource = ds.Tables[0];
                    Grd_Get_SOP_List.DataBind();
                }


            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}