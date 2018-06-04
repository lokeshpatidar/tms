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
    public partial class Edit_User_ExpDetails : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!this.IsPostBack)
            {
                fill_drpdwn();
                fill_drpdwn_User_Group_ID();
                fill_drpdwn_User_ID();
            }
        }   
        
        private void fill_drpdwn()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Departments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Get_DeptByUser");
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Dept.DataSource = ds.Tables[0];
                Drp_Dept.DataValueField = "Dept_Name";
                Drp_Dept.DataBind();
                con.Close();   
                Drp_Exp.SelectedValue = "0";           
                lblErrorMsg.Text = "";
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
                cmd.Parameters.AddWithValue("@Action", "Get_UGByUser");
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept.SelectedValue);
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User_Group.DataSource = ds.Tables[0];
                Drp_User_Group.DataValueField = "UserGroup_Name";
                Drp_User_Group.DataBind();
                con.Close();
                Drp_Exp.SelectedValue = "0";            
                lblErrorMsg.Text = "";
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void fill_drpdwn_User_ID()
        {
            try
            {
                lblErrorMsg.Text = "";
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Get_UserByUserID");
                cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User.DataSource = ds.Tables[0];
                Drp_User.DataValueField = "User_Name";
                Drp_User.DataBind();
                con.Close();

                if (Drp_User.SelectedValue != "0")
                {

                  
                    cmd = new SqlCommand("Get_User_Details");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        Drp_Exp.SelectedValue = sdr["Exp_Details"].ToString();
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

     

       

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Update_User_Exp_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);             
                cmd.Parameters.AddWithValue("@Exp", Drp_Exp.SelectedValue);
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());
              
              
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='Edit_User_ExpDetails.aspx'; </script>");

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

      
    }
}