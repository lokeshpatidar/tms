using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TMS
{
    public partial class Edit_Department_Details : System.Web.UI.Page
    {

        MyCon constr = new MyCon();

        private void fill_drpdwn()
        {

            using (SqlConnection con = new SqlConnection(constr.getconstr()))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Country_Name FROM Country_Details"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    Drp_Country.DataSource = cmd.ExecuteReader();
                    Drp_Country.DataValueField = "Country_Name";
                    Drp_Country.DataBind();
                    con.Close();
                }
            }
            Drp_Country.Items.Insert(0, new ListItem("--Select Country--", "0"));
            Drp_Departments.Items.Insert(0, new ListItem("--Select Department--", "0"));
        }


        private void fill_drpdwn_Dept()
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Dept_ID", con);


                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Country_Name", Drp_Country.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Departments.DataSource = ds.Tables[0];
                Drp_Departments.DataValueField = "Dept_Name";
                Drp_Departments.DataBind();
                con.Close();
                Drp_Departments.Items.Insert(0, new ListItem("--Select Department--", "0"));

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_Dept();
            txt_Dept_name.Text = "";
            txt_Dept_Prefix.Text = "";
            lblErrorMsg.Text = "";
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fill_drpdwn();

            }
        }



        protected void Drp_Departments_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txt_Dept_name .Text = "";
                txt_Dept_Prefix .Text = "";                
                lblErrorMsg.Text = "";

                if (Drp_Departments.SelectedValue != "0")
                {

                    SqlConnection con = new SqlConnection(constr.getconstr());
                    SqlCommand cmd = new SqlCommand("Get_Department_Details");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@Dept_Name", Drp_Departments.SelectedValue);

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        txt_Dept_name.Text = sdr["Dept_Name"].ToString();
                        txt_Dept_Prefix.Text = sdr["Dept_Prefix"].ToString();                       
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Btn_Update_Dept_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Add_Upd_Department");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Departments.SelectedValue);
                cmd.Parameters.AddWithValue("@Dept_Prefix", txt_Dept_Prefix.Text);
                cmd.Parameters.AddWithValue("@Dept_Name1", txt_Dept_name.Text);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString ());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='Edit_Department_Details.aspx'; </script>");

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}