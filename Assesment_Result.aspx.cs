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
    public partial class Assesment_Result : System.Web.UI.Page
    {
        MyCon constr = new MyCon();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                    lblTotQuestions.Text = sdr["Tot_Question"].ToString();
                    lblCorrectAns.Text = sdr["Tot_Pass_Ans"].ToString();
                    lblWrngAns.Text = sdr["Tot_Fail_Ans"].ToString();
                    lblYetTBAnalysed.Text = sdr["TotYetAnalyzed"].ToString();
                    lbl_Tot_Per.Text = sdr["Passing_Per"].ToString();
                    lbl_User_Per.Text = sdr["Per_Scored"].ToString();

                }
                con.Close();

                Session["U_Name"] = "";
                Session["Doc_ID"] = "";
                Session["Version_ID"] = "";
                Session["Attempt"] = "";

                if (result == "1")
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

            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void Btn_Close_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Assesment_Result.aspx", "window.close();", true);
        }
    }
}