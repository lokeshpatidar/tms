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
    public partial class Assess_Questions : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        protected void Page_Load(object sender, EventArgs e)
        {
           try
           {
               if (!this.IsPostBack)
               {
                   SqlConnection con = new SqlConnection(constr.getconstr());
                   con.Open();                

                   SqlCommand cmd = new SqlCommand("Get_Assess_Questions");
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Connection = con;               
                   cmd.Parameters.AddWithValue("@User_Name", Session["U_Name"].ToString());
                   cmd.Parameters.AddWithValue("@DOC_ID", Session["Doc_ID"].ToString());
                   cmd.Parameters.AddWithValue("@Version_ID", Session["Version_ID"].ToString());
                   using (SqlDataReader sdr = cmd.ExecuteReader())
                   {
                       sdr.Read();
                       txt_DOC_ID.Text = sdr["Doc_ID"].ToString();
                       txt_Ver_ID.Text = sdr["Version_ID"].ToString();
                       txt_DOC_Title.Text = sdr["DOC_Title"].ToString();
                       txt_Questions.Text = sdr["Questions"].ToString();
                       txt_CA_ID.Text = sdr["CA_ID"].ToString();
                       txt_Quest_ID.Text = sdr["QuesID"].ToString();
                       txt_Act_Ans.Text = sdr["Answer"].ToString();
                       txt_Attempt.Text = sdr["Attempt"].ToString();
                       Session["Attempt"] = sdr["Attempt"].ToString();
                       txt_SelectAnyOne.Text = sdr["Sel_Any_One"].ToString();                       
                   }
                   con.Close();
                   if (txt_SelectAnyOne.Text == "True")
                   {
                       fill_Sel_Anyone_Grid();
                       txt_Answer.Visible = false;
                   }
                   else
                   {
                       txt_Answer.Visible = true;
                   }
               }
           }
           catch (Exception ex)
           {
                   lblErrorMsg.Text = "";
                   SqlConnection con = new SqlConnection(constr.getconstr());
                   SqlCommand cmd = new SqlCommand("Get_User_Result");
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Connection = con;               
                   cmd.Parameters.AddWithValue("@User_Name", Session["U_Name"].ToString());
                   cmd.Parameters.AddWithValue("@DOC_ID", Session["Doc_ID"].ToString());
                   cmd.Parameters.AddWithValue("@Version_ID", Session["Version_ID"].ToString());
                   cmd.Parameters.AddWithValue("@Attempt_ID", Session["Attempt"].ToString());
                   string result = "";
                   con.Open();
                   using (SqlDataReader sdr = cmd.ExecuteReader())
                   {
                       sdr.Read();
                       result = sdr["Results"].ToString();
                       
                   }
                   con.Close();

                   Session["U_Name"] = "";
                   Session["Doc_ID"] = "";
                   Session["Version_ID"] = "";
                   Session["Attempt"] = "";
                    
               if (result  == "1")
               {
                   lbldisplaymsg.Text = "Assessment Complete!!!  Congratulations!!! you have Passed the Assessment Test!!!";
               }

               if (result == "2")
               {
                   lbldisplaymsg.Text = "Assessment Complete!!!  Sorry!!! you have Failed the Assessment Test!!!";
               }

               if (result == "0")
               {
                   lbldisplaymsg.Text = "Assessment Complete!!!  Result still pending, will be updated once Analyzed!!! ";
               }
           }
        }

        private void fill_Sel_Anyone_Grid()
        {

            try
            {
                SqlConnection con = new SqlConnection(constr.getconstr());
                SqlCommand cmd = new SqlCommand("Get_Select_Any_one_Assess", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@CA_ID", txt_CA_ID.Text);
                cmd.Parameters.AddWithValue("@DOC_ID", txt_DOC_ID.Text);
                cmd.Parameters.AddWithValue("@Version_ID", txt_Ver_ID.Text);
                cmd.Parameters.AddWithValue("@QuesID", txt_Quest_ID.Text);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                Grd_Select_Ans.DataSource = ds.Tables[0];
                Grd_Select_Ans.DataBind();
                con.Close();

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
        protected void Btn_Next_Click(object sender, EventArgs e)
        {
             try
           {
               string Ans = "";
               if (txt_SelectAnyOne.Text  == "True")
               {
                   Int16 i;
                   int Z;
                   Z = 0;
                   for (i = 0; i < Grd_Select_Ans.Rows.Count; i++)
                   {
                       CheckBox ChAction;
                       ChAction = (CheckBox)Grd_Select_Ans.Rows[i].FindControl("chk_Dept");

                       if (ChAction.Checked)
                       {
                           Z = Z + 1;
                       }
                   }

                
                   i = 0;
                   if (Z == 0)
                   {
                       throw new Exception("Please Select the Options Provided");
                   }
                   else
                   {
                       for (i = 0; i < Grd_Select_Ans.Rows.Count; i++)
                       {
                           CheckBox ChAction;
                           ChAction = (CheckBox)Grd_Select_Ans.Rows[i].FindControl("chk_Dept");

                           TextBox  SelAns;
                           SelAns = (TextBox)Grd_Select_Ans.Rows[i].FindControl("txt_Assess_Opt");

                           if (ChAction.Checked)
                           {
                               Ans = Ans + SelAns.Text;
                           }
                       }
                   }
                                   
               }
                 
               SqlConnection con = new SqlConnection(constr.getconstr());
               SqlCommand cmd = new SqlCommand("Strt_User_Assess");
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Connection = con;
               con.Open();
               cmd.Parameters.AddWithValue("@Action", "Update");
               cmd.Parameters.AddWithValue("@User_Name", Session["U_Name"].ToString());
               cmd.Parameters.AddWithValue("@DOC_ID", txt_DOC_ID.Text);
               cmd.Parameters.AddWithValue("@Version_ID", txt_Ver_ID.Text);
               if (txt_SelectAnyOne.Text == "True")
               {
                   cmd.Parameters.AddWithValue("@User_Ans", Ans);
                   cmd.Parameters.AddWithValue("@SelectAnyOne", "1");
               }
               else
               {
                   cmd.Parameters.AddWithValue("@User_Ans", txt_Answer.Text);
                   cmd.Parameters.AddWithValue("@SelectAnyOne", "0");
               }
               cmd.Parameters.AddWithValue("@CA_ID", txt_CA_ID.Text);
               cmd.Parameters.AddWithValue("@QuesID", txt_Quest_ID.Text);
               cmd.Parameters.AddWithValue("@Answer", txt_Act_Ans.Text);
               cmd.Parameters.AddWithValue("@Atmp_ID", txt_Attempt.Text);  
               cmd.ExecuteNonQuery();
               con.Close();

               Response.Write("<script>window.location='Assess_Questions.aspx'; </script>");

           }
             catch (Exception ex)
             {
                 lblErrorMsg.Text = "";
                 lblErrorMsg.Text = ex.Message;
             }
        }
    }
}