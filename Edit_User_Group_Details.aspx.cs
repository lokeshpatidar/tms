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
    public partial class Edit_User_Group_Details : System.Web.UI.Page
    {

        MyCon constr = new MyCon();

        private void fill_drpdwn()
        {

            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Departments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Dept.DataSource = ds.Tables[0];
                Drp_Dept.DataValueField = "Dept_Name";
                Drp_Dept.DataBind();
                con.Close();
                Drp_Dept.Items.Insert(0, new ListItem("--Select Department--", "0"));
                Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
                
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }

        }

        private void fill_drpdwn_User_Group_ID()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Group_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept.SelectedValue);
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User_Group.DataSource = ds.Tables[0];
                Drp_User_Group.DataValueField = "UserGroup_Name";
                Drp_User_Group.DataBind();
                con.Close();
                Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
                
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_Dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_Group_ID();
            txt_User_Group.Text = "";
            lblErrorMsg.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fill_drpdwn();

            }
        }

        protected void Btn_Update_UG_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Add_Upd_UserGroups");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);
                cmd.Parameters.AddWithValue("@UserGroup_Name1", txt_User_Group.Text);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString ());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='Edit_User_Group_Details.aspx'; </script>");

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_User_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txt_User_Group.Text = "";             
                lblErrorMsg.Text = "";

                if (Drp_User_Group.SelectedValue != "0")
                {
                    txt_User_Group.Text = Drp_User_Group.SelectedValue;  
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