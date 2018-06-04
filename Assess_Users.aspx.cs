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
    public partial class Assess_Users : System.Web.UI.Page
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
                Drp_User.Items.Insert(0, new ListItem("--Select User--", "0"));
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
                Drp_User.Items.Insert(0, new ListItem("--Select DOC ID--", "0"));
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

        private void fill_drpdwn_Doc_ID()
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Ans", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "FillDrp_Doc_ID");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Doc_ID.DataSource = ds.Tables[0];
                Drp_Doc_ID.DataValueField = "DOC_ID";
                Drp_Doc_ID.DataBind();
                con.Close();
                Drp_Doc_ID.Items.Insert(0, new ListItem("--Select DOC ID--", "0"));

            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void fill_drpdwn_Ver_ID()
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Ans", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "FillDrp_Ver_ID");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                cmd.Parameters.AddWithValue("@Doc_ID", Drp_Doc_ID.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Ver_ID.DataSource = ds.Tables[0];
                Drp_Ver_ID.DataValueField = "Version_ID";
                Drp_Ver_ID.DataBind();
                con.Close();
                Drp_Ver_ID.Items.Insert(0, new ListItem("--Select Version ID--", "0"));

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

        protected void Drp_User_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_ID();            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fill_drpdwn();                
            }
        }

        protected void Drp_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_Doc_ID();
        }

        protected void Drp_Doc_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_Ver_ID();
        }

        protected void btn_Get_User_Ans_Click(object sender, EventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_User_Ans", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "FillGrd");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                cmd.Parameters.AddWithValue("@Doc_ID", Drp_Doc_ID.SelectedValue);
                cmd.Parameters.AddWithValue("@Version_ID", Drp_Ver_ID.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                ad.Fill(ds);
                Grd_Get_SOP_List.DataSource = ds.Tables[0];
                Grd_Get_SOP_List.DataBind();

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
                Int16 i = 0;
                int Z;
                int X;
                Z = 0;
                X = 0;
                string strAttempt = "";
                SqlConnection con = new SqlConnection(constr.getconstr());
                for (i = 0; i < Grd_Get_SOP_List.Rows.Count; i++)
                {
                    CheckBox ChkCorrect;
                    ChkCorrect = (CheckBox)Grd_Get_SOP_List.Rows[i].FindControl("chk_Correct");
                    CheckBox ChkWrong;
                    ChkWrong = (CheckBox)Grd_Get_SOP_List.Rows[i].FindControl("chk_Wrong");

                    if (ChkCorrect.Checked == false)
                    {
                        Z = Z + 1;
                    }

                    if (ChkWrong.Checked == false)
                    {
                        X = X + 1;
                    }

                    if (Z != 0 & X != 0)
                    {
                        throw new Exception("Please Complete the Assessment Results");
                    }

                    if (Z == 0 & X == 0)
                    {
                        throw new Exception("You Cannot select both options 'Correct' and 'Wrong'");
                    }

                    Z = 0;
                    X = 0;
                }
                
                i = 0;
                if (Z != 0 & X != 0)
                {
                    throw new Exception("Please Complete the Assessment Results");
                }
                else
                {
                    for (i = 0; i < Grd_Get_SOP_List.Rows.Count; i++)
                    {
                        
                        SqlCommand cmd = new SqlCommand("Update_User_Results", con);
                        cmd.CommandType = CommandType.StoredProcedure;

                        TextBox Attempt;
                        Attempt = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Attempt");
                        TextBox CA_ID;
                        CA_ID = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_CA_ID");
                        TextBox Quest_ID;
                        Quest_ID = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_QuesID");
                        CheckBox ChkCorrect;
                        ChkCorrect = (CheckBox)Grd_Get_SOP_List.Rows[i].FindControl("chk_Correct");
                        CheckBox ChkWrong;
                        ChkWrong = (CheckBox)Grd_Get_SOP_List.Rows[i].FindControl("chk_Wrong");
                        
                        cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                        cmd.Parameters.AddWithValue("@CA_ID", CA_ID.Text);
                        cmd.Parameters.AddWithValue("@DOC_ID", Drp_Doc_ID.SelectedValue);
                        cmd.Parameters.AddWithValue("@Version_ID", Drp_Ver_ID.SelectedValue);
                        cmd.Parameters.AddWithValue("@QuesID", Quest_ID.Text);
                        cmd.Parameters.AddWithValue("@Attempt", Attempt.Text);

                        if (ChkCorrect.Checked)
                        {
                            cmd.Parameters.AddWithValue("@Result", "Pass");
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@Result", "Fail");
                        }
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        strAttempt = Attempt.Text;
                    }

                    SqlCommand cmd1 = new SqlCommand("Get_Per_To_Pass", con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);                 
                    cmd1.Parameters.AddWithValue("@DOC_ID", Drp_Doc_ID.SelectedValue);
                    cmd1.Parameters.AddWithValue("@Version_ID", Drp_Ver_ID.SelectedValue);
                    cmd1.Parameters.AddWithValue("@Attempt", strAttempt);
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script> alert('Record Updated successfully.');window.location='Assess_Users.aspx'; </script>");
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