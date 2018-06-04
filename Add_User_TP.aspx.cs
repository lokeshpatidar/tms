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
    public partial class Add_User_TP : System.Web.UI.Page
    {
        MyCon constr = new MyCon();
       
        private void fill_Doc_Type_drpdwn()
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Doc_Type", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "View");
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Doc_Type.DataSource = ds.Tables[0];
                Drp_Doc_Type.DataValueField = "Doc_Type";
                Drp_Doc_Type.DataBind();
                con.Close();
                Drp_Doc_Type.Items.Insert(0, new ListItem("All", "99"));
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
                cmd.Parameters.AddWithValue("@User_ID", Session ["User_ID"].ToString());
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_User_Group.DataSource = ds.Tables[0];
                Drp_User_Group.DataValueField = "UserGroup_Name";
                Drp_User_Group.DataBind();
                con.Close();
                Drp_User_Group.Items.Insert(0, new ListItem("--Select User Group--", "0"));
                Drp_Doc_Type.Items.Insert(0, new ListItem("All", "99"));
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                fill_drpdwn();
            }
        }

        protected void Drp_Dept_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_Group_ID();
        }

        protected void btn_Get_Doc_List_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("View_User_TP", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Insert");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept.SelectedValue);
                cmd.Parameters.AddWithValue("@Doc_Type", Drp_Doc_Type.SelectedValue);
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

        protected void Drp_User_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_ID();
            fill_Doc_Type_drpdwn();
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            try
            {
                Int16 i;
                Int16 z;

                for (z = 0; z < Grd_Get_SOP_List.Rows.Count; z++)
                {

                    CheckBox ChAction;
                    ChAction = (CheckBox)Grd_Get_SOP_List.Rows[z].FindControl("Chk_Sel_Doc_ID");

                    if (ChAction.Checked)
                    {
                        TextBox Train_Days;
                        Train_Days = (TextBox)Grd_Get_SOP_List.Rows[z].FindControl("txt_Train_Days");

                        DropDownList Train_Purpose;
                        Train_Purpose = (DropDownList)Grd_Get_SOP_List.Rows[z].FindControl("Drp_Train_Purpose");

                        DropDownList Train_Mode;
                        Train_Mode = (DropDownList)Grd_Get_SOP_List.Rows[z].FindControl("Drp_Train_Mode");

                        DropDownList Evalution;
                        Evalution = (DropDownList)Grd_Get_SOP_List.Rows[z].FindControl("Drp_Evalution");

                        TextBox Train_Pass;
                        Train_Pass = (TextBox)Grd_Get_SOP_List.Rows[z].FindControl("txt_Pass_Per");
                       

                        if (Train_Days.Text == "")
                        {
                            throw new Exception("Please Enter Training Days");
                        }

                        if (Train_Purpose.SelectedValue == "0")
                        {
                            throw new Exception("Please Select Purpose of Training");
                        }

                        if (Train_Mode.SelectedValue == "0")
                        {
                            throw new Exception("Please Select Mode of Training");
                        }

                        if (Evalution.SelectedValue == "0")
                        {
                            throw new Exception("Please Select Evaluation");
                        }

                        if (Evalution.SelectedValue == "True")
                        {
                            if (Train_Pass.Text == "")
                            {
                                throw new Exception("Please Enter Passing Percentage");
                            }
                        }

                    }
                }

                SqlConnection con = new SqlConnection(constr.getconstr());

                for (i = 0; i < Grd_Get_SOP_List.Rows.Count; i++)
                {

                    SqlCommand cmd = new SqlCommand("Add_Up_Del_User_TP", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    CheckBox ChAction;
                    ChAction = (CheckBox)Grd_Get_SOP_List.Rows[i].FindControl("Chk_Sel_Doc_ID");

                    if (ChAction.Checked)
                    {
                        TextBox Doc_ID;
                        Doc_ID = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Doc_ID");

                        TextBox Doc_title;
                        Doc_title = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Doc_title");

                        TextBox Ver_ID;
                        Ver_ID = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Ver_ID");

                        TextBox Train_Days;
                        Train_Days = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Train_Days");

                        DropDownList  Train_Purpose;
                        Train_Purpose = (DropDownList)Grd_Get_SOP_List.Rows[i].FindControl("Drp_Train_Purpose");

                        DropDownList Train_Mode;
                        Train_Mode = (DropDownList)Grd_Get_SOP_List.Rows[i].FindControl("Drp_Train_Mode");

                        DropDownList Evalution;
                        Evalution = (DropDownList)Grd_Get_SOP_List.Rows[i].FindControl("Drp_Evalution");

                        TextBox Effective_Dt;
                        Effective_Dt = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Eff_Dt");

                        TextBox Trainer;
                        Trainer = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Trainer");

                        TextBox Train_Pass;
                        Train_Pass = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Pass_Per");


                        cmd.Parameters.AddWithValue("@Action", "Insert");

                        cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);

                        cmd.Parameters.AddWithValue("@DOC_ID", Doc_ID.Text);

                        cmd.Parameters.AddWithValue("@Version_ID", Ver_ID.Text);

                        cmd.Parameters.AddWithValue("@Train_Purpose", Train_Purpose.Text);

                        cmd.Parameters.AddWithValue("@Train_Mode", Train_Mode.Text);

                        cmd.Parameters.AddWithValue("@Training_Days", Train_Days.Text);

                        cmd.Parameters.AddWithValue("@Evaluation", Evalution.SelectedValue);

                        cmd.Parameters.AddWithValue("@User_Per", Train_Pass.Text);

                        cmd.Parameters.AddWithValue("@EnteredBy", Session ["User_ID"].ToString ());

                        cmd.Parameters.AddWithValue("@Effective_Dt", Effective_Dt.Text );

                        if (Trainer.Text != "")
                        {
                            cmd.Parameters.AddWithValue("@Trainer", Trainer.Text);
                        }
                       

                        con.Open();
                        cmd.ExecuteNonQuery();

                        con.Close();
                       
                    }

                }

                Response.Write("<script> alert('Record Updated successfully.');window.location='Add_User_TP.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}