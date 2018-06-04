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
    public partial class Add_User_Group_Rights : System.Web.UI.Page
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
                Drp_Departments.DataSource = ds.Tables[0];
                Drp_Departments.DataValueField = "Dept_Name";
                Drp_Departments.DataBind();
                con.Close();
                Drp_Departments.Items.Insert(0, new ListItem("--Select Department--", "0"));
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
                cmd.Parameters.AddWithValue("@Dept_Name", Drp_Departments.SelectedValue);
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
            if (!this.IsPostBack)
            {
                fill_drpdwn();
            }
        }

        protected void Btn_Get_Fun_Click(object sender, EventArgs e)
        {
            try             
            {

                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_UserGroup_functions", con);

               
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue ("@UserGroup_Name", Drp_User_Group.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                ad.Fill(ds);
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }


        }

        protected void Btn_Add_Fun_Click(object sender, EventArgs e)
        {

            try
            {
                Int16 i;

                SqlConnection con = new SqlConnection(constr.getconstr());

                for (i = 0; i < GridView1.Rows.Count; i++)
                {

                    SqlCommand cmd = new SqlCommand("Add_Up_Del_User_Group_Fun", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    CheckBox ChAction;
                    ChAction = (CheckBox)GridView1.Rows[i].FindControl("Chk_Sel_Fun");

                    if (ChAction.Checked)
                    {
                        TextBox Fn_ID;
                        Fn_ID = (TextBox)GridView1.Rows[i].FindControl("txt_Fun_ID");

                        Label Parent;
                        Parent = (Label)GridView1.Rows[i].FindControl("txt_Parent");

                        Label Fn_Name;
                        Fn_Name = (Label)GridView1.Rows[i].FindControl("txt_Fun_Name");

                        cmd.Parameters.AddWithValue("@Action", "Insert");

                        cmd.Parameters.AddWithValue("@UserGroup_Name", Drp_User_Group.SelectedValue);

                        cmd.Parameters.AddWithValue("@FunctionID", Convert.ToInt32(Fn_ID.Text));

                        cmd.Parameters.AddWithValue("@Parent", Parent.Text);

                        cmd.Parameters.AddWithValue("@EnteredBy", Session ["User_ID"].ToString ());

                        con.Open();
                        cmd.ExecuteNonQuery();

                        con.Close();
                        
                    }

                }

                SqlCommand cmd1 = new SqlCommand("Add_Up_Del_User_Fun", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@Action", "Frm_User_Group");
                cmd1.Parameters.AddWithValue("@USerGroup_Name", Drp_User_Group.SelectedValue);
                cmd1.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();

                Response.Write("<script> alert('Record Updated successfully.');window.location='Add_User_Group_Rights.aspx'; </script>");
            
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_Departments_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill_drpdwn_User_Group_ID();
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