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
    public partial class Edit_User_Details : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        private void fill_drpdwn_Dept1()
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
                Drp_Dept1.DataSource = ds.Tables[0];
                Drp_Dept1.DataValueField = "Dept_Name";
                Drp_Dept1.DataBind();
                con.Close();
                Drp_Dept1.Items.Insert(0, new ListItem("--Select Department--", "0"));
                Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void fill_drpdwn_User_Group_ID_1()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Group_ID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept1.SelectedValue);
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User_Group1.DataSource = ds.Tables[0];
                Drp_User_Group1.DataValueField = "UserGroup_Name";
                Drp_User_Group1.DataBind();
                con.Close();
                Drp_User_Group1.Items.Insert(0, new ListItem("--Select User Group--", "0"));
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

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
                Drp_User.Items.Insert(0, new ListItem("--Select User--", "0"));
                Drp_Exp.SelectedValue = "0";
                Drp_Gender.SelectedValue = "0";
                Drp_User_Type.SelectedValue = "0";
                txt_Dt_of_Join.Text = "";
                Chk_Lev1_Manager.Checked = false;
                Chk_Lev2_Manager.Checked = false;
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
                Drp_Exp.SelectedValue = "0";
                Drp_Gender.SelectedValue = "0";
                Drp_User_Type.SelectedValue = "0";
                txt_Dt_of_Join.Text = "";
                Chk_Lev1_Manager.Checked = false;
                Chk_Lev2_Manager.Checked = false;
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
                cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);
                cmd.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User.DataSource = ds.Tables[0];
                Drp_User.DataValueField = "User_Name";
                Drp_User.DataBind();
                con.Close();
                Drp_User.Items.Insert(0, new ListItem("--Select User--", "0"));
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
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            this.Dt_Joining.Attributes.Add("href", "javascript:GetCurrCal('" + txt_Dt_of_Join.ClientID + "','" + HiddDt_Joining.ClientID + "','DivJoining','HIDdiv');");
            if (!this.IsPostBack)
            {
                fill_drpdwn();
                fill_drpdwn_Dept1();
                fill_drpdwn_User_Group_ID_1();
            }
        }

        protected void Drp_User_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_ID();            
        }

        protected void Drp_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
             
                lblErrorMsg.Text = "";

                if (Drp_User.SelectedValue != "0")
                {

                    SqlConnection con = new SqlConnection(constr.getconstr());
                    SqlCommand cmd = new SqlCommand("Get_User_Details");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);

                    string Lvel1 = "0";
                    string Lvel2 = "0";

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        Drp_User_Type.SelectedValue = sdr["User_Type"].ToString();
                        Drp_Gender.SelectedValue = sdr["Gender"].ToString();
                        txt_Dt_of_Join.Text = sdr["DOJ"].ToString();
                        Drp_Exp.SelectedValue = sdr["Exp_Details"].ToString();
                        Lvel1 = sdr["Main_Manager"].ToString();
                        Lvel2 = sdr["BUH"].ToString();                        
                    }
                    if (Lvel1 == "True")
                    {
                        Chk_Lev1_Manager.Checked = true;
                    }
                    if (Lvel1 == "False")
                    {
                        Chk_Lev1_Manager.Checked = false;
                    }

                    if (Lvel2 == "True")
                    {
                        Chk_Lev2_Manager.Checked = true;
                    }
                    if (Lvel2 == "False")
                    {
                        Chk_Lev2_Manager.Checked = false;
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
                SqlCommand cmd = new SqlCommand("Update_User_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Action", "Update");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                cmd.Parameters.AddWithValue("@User_Type", Drp_User_Type.SelectedValue);
                cmd.Parameters.AddWithValue("@Gender", Drp_Gender.SelectedValue);
                cmd.Parameters.AddWithValue("@DOJ", txt_Dt_of_Join.Text);
                cmd.Parameters.AddWithValue("@Exp", Drp_Exp.SelectedValue);
                cmd.Parameters.AddWithValue("@EnteredBy", Session ["User_ID"].ToString ());
                if (Drp_Dept1.SelectedValue != "0")
                {
                    cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept1.SelectedValue);
                }
                if (Drp_User_Group1.SelectedValue != "0")
                {
                    cmd.Parameters.AddWithValue("@UG_Name", Drp_User_Group1.SelectedValue);
                }

                if (Chk_Lev1_Manager.Checked)
                {
                    cmd.Parameters.AddWithValue("@Level1", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Level1", "False");
                }

                if (Chk_Lev2_Manager.Checked)
                {
                    cmd.Parameters.AddWithValue("@Level2", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Level2", "False");
                }

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Record Updated successfully.');window.location='Edit_User_Details.aspx'; </script>");

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_Dept1_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_Group_ID_1();
        }
    
    }
}