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
    public partial class Add_Country : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        protected void Page_Load(object sender, EventArgs e)
        {
            fillDataRepeater();
        }

        void fillDataRepeater()
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Country_Name", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();

            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }

        }

        protected void Btn_Add_Country_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Add_Up_Del_County";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Insert");
                cmd.Parameters.AddWithValue("@Country_Name", txt_Country.Text);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());
                cmd.Parameters.AddWithValue("@Country_Prefix", txt_Coun_Prefix.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='Add_Country.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }


    }
}