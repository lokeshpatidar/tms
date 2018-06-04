using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS
{
    public partial class Add_Functions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string user_ID = Session["User_ID"].ToString ();
            string _script = string.Empty;
            _script = "Get_Ads.aspx?txt_User_Name=" + user_ID;
            Response.Write("<script>javascript:window.open('" + _script + "','','ModalPopUp,fullscreen=no,toolbar=no,menubar=no,controlbox=no,scrollbars=no,status=no,height=400,width=400');window.location='Add_Functions.aspx';</script>");
        }
    }
}