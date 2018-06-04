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
    public partial class Approve_User_Training : System.Web.UI.Page
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
                cmd.Parameters.AddWithValue("@Action", "Approve");
                cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Dept.SelectedValue);
                
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
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            try
            {
                Int16 i;

                SqlConnection con = new SqlConnection(constr.getconstr());

                for (i = 0; i < Grd_Get_SOP_List.Rows.Count; i++)
                {

                    SqlCommand cmd = new SqlCommand("Up_Train_Complete", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    CheckBox ChAction;
                    ChAction = (CheckBox)Grd_Get_SOP_List.Rows[i].FindControl("Chk_Approve");

                    if (ChAction.Checked)
                    {
                        
                        TextBox Doc_ID;
                        Doc_ID = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Doc_ID");

                        TextBox Ver_ID;
                        Ver_ID = (TextBox)Grd_Get_SOP_List.Rows[i].FindControl("txt_Ver_ID");

                        cmd.Parameters.AddWithValue("@Action", "Approve");

                        cmd.Parameters.AddWithValue("@User_Name", Drp_User.SelectedValue);

                        cmd.Parameters.AddWithValue("@Doc_ID", Doc_ID.Text);

                        cmd.Parameters.AddWithValue("@Version_ID", Ver_ID.Text );

                        cmd.Parameters.AddWithValue("@Train_Com_Dt",DateTime.Today);

                        cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString ());

                        con.Open();
                        cmd.ExecuteNonQuery();

                        con.Close();
                        
                    }

                }
                Response.Write("<script> alert('Record Updated successfully.');window.location='Approve_User_Training.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
      
        protected void grd_data_PreRender(object sender, EventArgs e)
        {
            try
            {
                GridView gv = (GridView)sender;
                if ((gv.ShowHeader == true && gv.Rows.Count > 0)
                    || (gv.ShowHeaderWhenEmpty == true))
                {
                    //Force GridView to use <thead> instead of <tbody> - 11/03/2013 - MCR.
                    gv.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                if (gv.ShowFooter == true && gv.Rows.Count > 0)
                {
                    //Force GridView to use <tfoot> instead of <tbody> - 11/03/2013 - MCR.
                    gv.FooterRow.TableSection = TableRowSection.TableFooter;
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.ToString();

            }
        }
    }
}