using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace TMS
{
    public partial class Auth : System.Web.UI.Page
    {
        MyCon constr = new MyCon();

        protected void Page_Load(object sender, EventArgs e)
        {

          
            //this.Rotator.Text = "<FONT SIZE='3' FACE='courier' COLOR=Black><MARQUEE SCROLLAMOUNT=5 WIDTH=100% BEHAVIOR=SCROLL><b>" + "DiagnoSearch has Operations In India,South Korea, Thailand, Taiwan, Malaysia, Mexico & US" + "</b></MARQUEE></FONT>";
           
            //if (Session["User_ID"] != null)
            //{
            //    SqlConnection con = new SqlConnection(constr.getconstr());
            //    SqlCommand cmd3 = new SqlCommand();
            //    cmd3.CommandType = CommandType.StoredProcedure;
            //    cmd3.Connection = con;
            //    cmd3.CommandText = "Update_Alrdy_Log_IN";
            //    con.Open();
            //    cmd3.Parameters.AddWithValue("@Action", "LogOut");
            //    cmd3.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString());
            //    cmd3.ExecuteNonQuery();
            //    con.Close();
            //    Session["User_ID"] = null;
            //}

        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
                //if (Request.Browser.Browser != "IE" || Request.Browser.Browser != "Firefox")
                //{
                //    throw new Exception("Please use Browser: 'Internet Explorer' to Start the Assessment!!!");
                //}


                string Host_IP = Request.UserHostAddress.ToString();
                SqlConnection con = new SqlConnection(constr.getconstr());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "User_Auth";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", this.txt_UserName.Text);
                cmd.Parameters.AddWithValue("@Pwd", this.txt_Pwd.Text);
                cmd.Parameters.AddWithValue("@Host_IP", Host_IP);

                var returnParam1 = new SqlParameter
                {
                    ParameterName = "@Result",
                    Direction = ParameterDirection.Output,
                    Size = 1
                };
                cmd.Parameters.Add(returnParam1);
                cmd.ExecuteNonQuery();
                string retunvalue = (string)cmd.Parameters["@Result"].Value;
                con.Close();

                if (retunvalue == "1")
                {
                  
                    throw new Exception("Invalid Credentials");
                }
                else if (retunvalue == "2")
                {
                 
                    throw new Exception("User Account has been Locked.");
                }
                else if (retunvalue == "3")
                {
                    Session["User_ID"] = this.txt_UserName.Text;
                    Response.Redirect("Change_Password.aspx");
                }
                else if (retunvalue == "4")
                {
                    Session["User_ID"] = this.txt_UserName.Text;
                    Response.Redirect("Change_Password.aspx");
                }

                else if (retunvalue == "5")
                {
                    throw new Exception("Invalid Credentials");
                }

                else if (retunvalue == "6")
                {
                    throw new Exception("User Has Already been Logged IN");
                }

                else if (retunvalue == "0")
                {
                    Session["User_ID"] = this.txt_UserName.Text;

                    SqlCommand cmd3 = new SqlCommand();
                    cmd3.CommandType = CommandType.StoredProcedure;
                    cmd3.Connection = con;
                    cmd3.CommandText = "Update_Alrdy_Log_IN";
                    con.Open();
                    cmd3.Parameters.AddWithValue("@Action", "LogIn");
                    cmd3.Parameters.AddWithValue("@User_ID", Session["User_ID"].ToString ());
                    cmd3.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = "Approval_Doc_Count";
                    cmd1.Connection = con;
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@User_ID", this.txt_UserName.Text);
                    SqlDataReader myReader;
                    myReader = cmd1.ExecuteReader();

                    while (myReader.Read())
                    {
                        Session["CountAppDoc"] = myReader["DOC_ID"].ToString();                        
                    }
                    con.Close();

                    con.Open();
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandText = "PWD_EXP_Reminder";
                    cmd2.Connection = con;
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@User_ID", this.txt_UserName.Text);
                    SqlDataReader myReader1;
                    myReader1 = cmd2.ExecuteReader();

                    while (myReader1.Read())
                    {
                        Session["PWDExpire"] = myReader1["Result"].ToString();
                        Session["NoofDays"] = myReader1["NoofDays"].ToString();
                    }
                    con.Close(); 
                    
                    Response.Redirect("HomePage.aspx");
                   
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}