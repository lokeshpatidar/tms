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
    public partial class DepartmentDetails : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        private void fill_drpdwn()
        {
            using (SqlConnection con = new SqlConnection(constr.getconstr ()))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Country_Name FROM Country_Details"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    Drp_Country .DataSource = cmd.ExecuteReader();
                    Drp_Country.DataValueField = "Country_Name";
                    Drp_Country.DataBind();
                    con.Close();
                }
            }
            Drp_Country.Items.Insert(0, new ListItem("--Select Country--", "0"));
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            fillDataRepeater();
            if (!this.IsPostBack)
            {
                fill_drpdwn();
            }
        }
        protected void Btn_Add_Dept_Click(object sender, EventArgs e)
        {
            try
            {
                
                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Add_Upd_Department";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Insert");
                cmd.Parameters.AddWithValue("@Country_Name", Drp_Country.SelectedValue);
                cmd.Parameters.AddWithValue("@Dept_Name", txt_Dept_name.Text);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());
                cmd.Parameters.AddWithValue("@Dept_Prefix", txt_Dept_Prefix.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='DepartmentDetails.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        void fillDataRepeater()
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Department_Name", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Country_Name", Drp_Country.SelectedValue);
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
        protected void Drp_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillDataRepeater();
        }
    }
}