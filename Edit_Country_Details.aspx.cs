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
    public partial class Edit_Country_Details : System.Web.UI.Page
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
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fill_drpdwn();
            }
        }

        protected void Drp_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txt_Country.Text = "";
                txt_Country_ID.Text = "";
                txt_Country_Prefix.Text = "";
                lblErrorMsg.Text = "";

                if (Drp_Country.SelectedValue != "0")
                {

                    SqlConnection con = new SqlConnection(constr.getconstr());
                    SqlCommand cmd = new SqlCommand("Get_Country_Details");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@Country_Name", Drp_Country.SelectedValue);

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        txt_Country_ID.Text = sdr["Country_ID"].ToString();
                        txt_Country.Text = sdr["Country_Name"].ToString();
                        txt_Country_Prefix.Text = sdr["Country_Prefix"].ToString();
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

        protected void Btn_Update_Country_Click(object sender, EventArgs e)
        {
            try
            {
            
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Add_Up_Del_County");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.Parameters.AddWithValue("@Country_Name", Drp_Country.SelectedValue);
                cmd.Parameters.AddWithValue("@Country_Prefix", txt_Country_Prefix.Text);
                cmd.Parameters.AddWithValue("@Country_Name1", txt_Country.Text);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString ());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='Edit_Country_Details.aspx'; </script>");
            
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}