using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project.Admin
{
    public partial class Admin_Index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        private int TT=0;
        private int TS=0;
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (Session["Admin_User"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            if (!IsPostBack)
            {
                TotelStudent();
                TotelTeacher();
                TotelUser();
            }
        }

        private void TotelStudent()
        {
           
            try
            {
                SqlCommand cmd = new SqlCommand("sp_TotelStudent", con);
                cmd.CommandType=CommandType.StoredProcedure;
                con.Open();
                TS = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                lblcountstudent.Text = TS.ToString();

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        private void TotelTeacher()
        {
            
            try
            {
                SqlCommand cmd = new SqlCommand("sp_TotelTeacher", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                TT = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                lblcountTeacher.Text = TT.ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }   
        }
        private void TotelUser()
        {
            int Tu = 0;
            Tu = TS + TT;
            lblTotelUser.Text = Tu.ToString();

        }
    }
}