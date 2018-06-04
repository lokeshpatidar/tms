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

    public partial class Add_Document_List : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        protected void Page_Load(object sender, EventArgs e)
        {


            //this.Approval_Dt.Attributes.Add("href", "javascript:GetCurrCal('" + txt_Approval_Dt.ClientID + "','" + HiddApproveDt.ClientID + "','DivApprove','HIDdiv');");
          //  this.Effective_Dt.Attributes.Add("href", "javascript:GetCurrCal('" + txt_Eff_Dt.ClientID + "','" + HiddenEffDt.ClientID + "','Div_Eff','HIDdiv1');");
            //this.Nxt_Rev_Dt.Attributes.Add("href", "javascript:GetCurrCal('" + txt_Next_Rev_Dt.ClientID + "','" + HiddNxtRevDt.ClientID + "','Div_Nxt_Rev_Dt','HIDdiv2');");
            //this.txt_SOP_ID.Attributes.Add("href", "javascript:validateRef_ID('" + txt_SOP_ID.ClientID + "','" + Drp_Doc_Type.ClientID);
            if (!this.IsPostBack)
            {
                fill_Doc_Status_drpdwn();
                fill_Doc_Type_drpdwn();
                fill_Dept_Grid();
            }
        }
        private void fill_Dept_Grid()
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
                Grd_Get_Dept_List.DataSource = ds.Tables[0];
                Grd_Get_Dept_List.DataBind();
               
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        private void fill_Doc_Status_drpdwn()
        {
            using (SqlConnection con = new SqlConnection(constr.getconstr()))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Status FROM Document_Status"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    Drp_Status.DataSource = cmd.ExecuteReader();
                    Drp_Status.DataValueField = "Status";
                    Drp_Status.DataBind();
                    con.Close();
                }
            }
            Drp_Status.Items.Insert(0, new ListItem("--Select Status--", "0"));
        }


        private void fill_Doc_Type_drpdwn()
        {
           using (SqlConnection con = new SqlConnection(constr.getconstr()))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Doc_Type FROM Document_Type"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    Drp_Doc_Type.DataSource = cmd.ExecuteReader();
                    Drp_Doc_Type.DataValueField = "Doc_Type";
                    Drp_Doc_Type.DataBind();
                    con.Close();
                }
            }
            Drp_Doc_Type.Items.Insert(0, new ListItem("--Select Doc Type--", "0"));
            Drp_Sub_Doc_Type.Items.Insert(0, new ListItem("--Select Sub Doc Type--", "0"));
        }
        
     

        protected void Btn_Add_Doc_List_Click(object sender, EventArgs e)
        {
            try
            {
                //Validations:
                
                 Int16 i;
                int Z;
                Z = 0;
                for (i = 0; i < Grd_Get_Dept_List.Rows.Count; i++)
                {
                    CheckBox ChAction;
                    ChAction = (CheckBox)Grd_Get_Dept_List.Rows[i].FindControl("chk_Dept");

                    if (ChAction.Checked)
                    {
                        Z = Z + 1;
                    }
                }

                if (Z == 0)
                {
                    throw new Exception("Please Select Departments");
                }
                
                if (Drp_Doc_Type.SelectedValue == "Ad")
                {
                    if (Drp_SOP_ID.SelectedValue == "0")
                    {
                        throw new Exception("Please Select SOP ID");
                    }
               
                }
               
                if (Drp_Type_Doc.SelectedValue != "External")
                {
                    if (txt_Approval_Dt.Text   == "")
                    {
                        throw new Exception("Please Enter Approval Date");
                    }

                }

                if (Drp_Type_Doc.SelectedValue != "External")
                {
                    if (txt_Rev_History.Text == "")
                    {
                        throw new Exception("Please Enter Revision History");
                    }

                }

                if (Drp_Type_Doc.SelectedValue != "External")
                {
                    if (txt_Next_Rev_Dt.Text == "")
                    {
                        throw new Exception("Please Enter Next Review Date");
                    }

                }

                if (Drp_Type_Doc.SelectedValue != "External")
                {
                    
                    DateTime Eff_Dt = Convert.ToDateTime(txt_Eff_Dt.Text.Trim()).Date;
                    DateTime Nxt_rev_Dt = Convert.ToDateTime(txt_Next_Rev_Dt.Text.Trim()).Date;       
                    DateTime App_Dt = Convert.ToDateTime(txt_Approval_Dt.Text.Trim()).Date;
                    if (Eff_Dt < App_Dt)
                    {
                        throw new Exception("Effective Date Should Not Be Earlier Than Approved Date");
                    }

                    if (Nxt_rev_Dt < Eff_Dt)
                    {
                        throw new Exception("Next Review Date Should Not Be Earlier Than Effective Date");
                    }
                }

                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Add_Update_Doc_list";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Insert");
                cmd.Parameters.AddWithValue("@DOC_ID", txt_Doc_ID.Text );
                cmd.Parameters.AddWithValue("@Version_ID", txt_Ver_ID.Text );
                cmd.Parameters.AddWithValue("@SOP_ID", Drp_SOP_ID.SelectedValue);
                cmd.Parameters.AddWithValue("@DOC_Title", txt_Doc_title.Text);
                if (txt_Eff_Dt.Text != "")
                {
                    cmd.Parameters.AddWithValue("@Effective_Dt", txt_Eff_Dt.Text);
                }
                if (txt_Approval_Dt.Text != "")
                {
                    cmd.Parameters.AddWithValue("@Approval_Dt", txt_Approval_Dt.Text);
                }
                if (txt_Approval_Dt.Text != "")
                {
                    cmd.Parameters.AddWithValue("@Next_Review_Due", txt_Next_Rev_Dt.Text);
                }
                cmd.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString());
                cmd.Parameters.AddWithValue("@DOC_Type", Drp_Doc_Type.SelectedValue);              
                cmd.Parameters.AddWithValue("@Status", Drp_Status.SelectedValue );
                cmd.Parameters.AddWithValue("@DOC_Sub_Type", Drp_Sub_Doc_Type.SelectedValue);
                cmd.Parameters.AddWithValue("@Rev_History", txt_Rev_History.Text);
                cmd.Parameters.AddWithValue("@Int_Ext", Drp_Type_Doc.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();

                Int16 A;
                string EmailAdd = "abc@abc.com";
                string CCEmailAddress = "HI";
                string E_Sub = "HI";
                string E_Body = "HI";
                
                for (A = 0; A < Grd_Get_Dept_List.Rows.Count; A++)
                {

                    SqlCommand cmd2 = new SqlCommand("Add_Up_Del_Dep_wise_Doc", con);
                    cmd2.CommandType = CommandType.StoredProcedure;

                    CheckBox ChAction;
                    ChAction = (CheckBox)Grd_Get_Dept_List.Rows[A].FindControl("chk_Dept");

                   

                    if (ChAction.Checked)                    
                    
                    {
                        TextBox Dep_Name;
                        Dep_Name = (TextBox)Grd_Get_Dept_List.Rows[A].FindControl("txt_Dept_Name");

                        cmd2.Parameters.AddWithValue("@Action", "Insert");

                        cmd2.Parameters.AddWithValue("@Dept_Name", Dep_Name.Text);

                        cmd2.Parameters.AddWithValue("@DOC_ID", txt_Doc_ID.Text);

                        cmd2.Parameters.AddWithValue("@Version_ID", txt_Ver_ID.Text);

                        cmd2.Parameters.AddWithValue("@EnteredBy", Session ["User_ID"].ToString ());                                       

                        con.Open();
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    

                        if (Chk_Send_Email.Checked)
                        {

                            SqlCommand cmd3 = new SqlCommand();
                            SqlDataReader myReader;                     

                             cmd3.CommandType = CommandType.StoredProcedure;
                             cmd3.Connection = con;
                             cmd3.CommandText = "Get_Email_ID";
                             con.Open();                         
                             cmd3.Parameters.AddWithValue("@Action", "BUH");
                             cmd3.Parameters.AddWithValue("@Dept_Name", Dep_Name.Text);
                                myReader = cmd3.ExecuteReader();
                                EmailAdd = "";
                                while (myReader.Read())
                                {
                                    //Write logic to process data for the first result.
                                    if (EmailAdd == "") 
                                    {
                                        EmailAdd =  myReader["Email_ID"].ToString();
                                    }
                                    EmailAdd = EmailAdd + ";" + myReader["Email_ID"].ToString();
                                }
                                con.Close();
                                
                                

                                SqlCommand cmd4 = new SqlCommand();
                                SqlDataReader myReader1;

                                cmd4.CommandType = CommandType.StoredProcedure;
                                cmd4.Connection = con;
                                con.Open();
                                
                                cmd4.CommandText = "Get_Email_Details";
                                cmd4.Parameters.AddWithValue("@ID", 1);
                                 
                                myReader1 = cmd4.ExecuteReader();

                                CCEmailAddress = "";
                                E_Sub = "DOC ID '" + txt_Doc_ID.Text + "' " + "Version: '" + txt_Ver_ID.Text  + "'";
                                E_Body = ""; 

                                
                                while (myReader1.Read())
                                {
                                    CCEmailAddress = myReader1["E_CC"].ToString();
                                    E_Sub = E_Sub +  " " + myReader1["E_Sub"].ToString();
                                    E_Body = myReader1["E_Body"].ToString();
                                }
                                con.Close();
                              
                                constr.Email_Users(EmailAdd, CCEmailAddress, E_Sub, E_Body);
                                
                            }                       

                    }

                }

               if (Chk_Add_UTP.Checked)
                {
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = "Add_All_User_TP";
                    cmd1.Connection = con;
                    cmd1.CommandType = CommandType.StoredProcedure;                    
                    cmd1.Parameters.AddWithValue("@DOC_ID", txt_Doc_ID.Text );
                    cmd1.Parameters.AddWithValue("@Version_ID", txt_Ver_ID.Text );
                    cmd1.Parameters.AddWithValue("@Effective_Dt", txt_Eff_Dt.Text);
                    cmd1.Parameters.AddWithValue("@EnteredBy", Session["User_ID"].ToString ());
                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
                             
                  Response.Write("<script> alert('Record Updated successfully.');window.location='Add_Document_List.aspx'; </script>");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Drp_Doc_Type_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("GetDoc_SubType", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Doc_Type", Drp_Doc_Type.SelectedValue);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Drp_Sub_Doc_Type.DataSource = ds.Tables[0];
                Drp_Sub_Doc_Type.DataValueField = "Doc_Sub_Type";
                Drp_Sub_Doc_Type.DataBind();             
                Drp_Sub_Doc_Type.Items.Insert(0, new ListItem("--Select Sub Doc Type--", "0"));
                SqlCommand cmd1 = new SqlCommand("GetSOP_ID", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@Dept_Name", "ABC");
                SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                ad1.Fill(ds1);
                Drp_SOP_ID.DataSource = ds1.Tables[0];
                Drp_SOP_ID.DataValueField = "DOC_ID";
                Drp_SOP_ID.DataBind();
                con.Close();
                Drp_SOP_ID .Items.Insert(0, new ListItem("--Select SOP ID--", "0"));
            }

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }


    }
}