using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project
{
    public partial class Student_Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["Captcha"] == null || txtCaptcha.Text.Trim() != Session["Captcha"].ToString())
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Fail','Invalid Captcha','error' );", true);
                return;
            }
            LoginStudent();
        }

        private void LoginStudent()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_LoginStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim().ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    Session["Studentusername"] = txtEmail.Text.Trim();
                    Response.Redirect("Student/Student_Index.aspx");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Fail','Incorrect Username or Password','error' );", true);
                }

            }
            catch (Exception ex)
            {

              Response.Write(ex.Message);   
            }
            finally { con.Close(); }


        }
    }
}