using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TMS_Project.Admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtPassword.Attributes["value"] = txtPassword.Text;
                txtEmail.Focus();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoginAdmin();
        }

        private void LoginAdmin()
        {
            try
            {
                con.Open();
                SqlCommand cmd=new SqlCommand("sp_LoginAdmin", con);
                cmd.CommandType=CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                int result= Convert.ToInt32(cmd.ExecuteScalar());
                if (result > 0)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Login Successful";
                    Session["Admin_User"] = txtEmail.Text;
                    Response.Redirect("Admin_Index.aspx");
                }
                else
                {
                    //lblMessage.Visible = true;
                    //lblMessage.Text = " Invalid Username or Password";
                    //lblMessage.ForeColor = System.Drawing.Color.Red;


                    txtPassword.Attributes["value"] = txtPassword.Text;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Fail','Incorrect Username or Password','error' );", true);
                }
            
               
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}