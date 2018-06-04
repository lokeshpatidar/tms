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
    public partial class Add_User_Profile : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {

            this.Dt_Joining.Attributes.Add("href", "javascript:GetCurrCal('" + txt_Dt_of_Join.ClientID + "','" + HiddDt_Joining.ClientID + "','DivJoining','HIDdiv');");
            if (!this.IsPostBack)
            {
                fill_drpdwn();
            }
        }

        protected void Drp_Dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_Group_ID();
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            try
            {
                string EmailAdd = "abc@abc.com";
                string CCEmailAddress = "HI";
                string E_Sub = "HI";
                string E_Body = "HI";

                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();                    
                               
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Add_User_Profile";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept.SelectedValue);
                cmd.Parameters.AddWithValue("@USerGroup_Name", Drp_User_Group.SelectedValue);
                cmd.Parameters.AddWithValue("@User_Name", txt_User_Name.Text );              
                cmd.Parameters.AddWithValue("@EnteredBy", Session ["User_ID"].ToString ());
                cmd.Parameters.AddWithValue("@User_Type", Drp_User_Type.SelectedValue );
                cmd.Parameters.AddWithValue("@Gender", Drp_Gender.SelectedValue );
                cmd.Parameters.AddWithValue("@DOJ", txt_Dt_of_Join.Text);
                cmd.Parameters.AddWithValue("@Exp_Details", Drp_Exp.SelectedValue);                
                
                if (Chk_Lev1_Manager.Checked)
                {
                    cmd.Parameters.AddWithValue("@Level1Mag", "True");
                }
                else 
                {
                    cmd.Parameters.AddWithValue("@Level1Mag", "False");
                }

                if (Chk_Lev2_Manager.Checked)
                {
                    cmd.Parameters.AddWithValue("@Level2Mag", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Level2Mag", "False");
                }
               
                cmd.Parameters.AddWithValue("@Emp_ID", txt_Emp_ID.Text);
                
                cmd.ExecuteNonQuery();
                con.Close();            
                      
              

                // Send User ID in Email
                         
                SqlCommand cmd4 = new SqlCommand();
                SqlDataReader myReader1;

                cmd4.CommandType = CommandType.StoredProcedure;
                cmd4.Connection = con;
                con.Open();

                cmd4.CommandText = "Get_Email_Details";
                cmd4.Parameters.AddWithValue("@ID", 4);

                CCEmailAddress = "";
                E_Sub = "";
                E_Body = "";               

                myReader1 = cmd4.ExecuteReader();      
                while (myReader1.Read())

                {
                    EmailAdd = myReader1["E_TO"].ToString();
                    CCEmailAddress = myReader1["E_CC"].ToString();
                    E_Sub = myReader1["E_Sub"].ToString() + " " + txt_User_Name.Text + " " + "has Joined";
                    E_Body = myReader1["E_Body"].ToString();
                }
                con.Close();
              
                constr.Email_Users(EmailAdd, CCEmailAddress, E_Sub, E_Body);          


                Response.Write("<script> alert('Record Updated successfully.');window.location='Add_User_Profile.aspx'; </script>");
          
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}