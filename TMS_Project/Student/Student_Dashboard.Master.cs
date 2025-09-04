using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_Project.Student
{
    public partial class Student_Dashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Studentusername"] == null)
                {
                    Response.Redirect("~/Student_Login.aspx");
                }
              
            }
        }
    }
}