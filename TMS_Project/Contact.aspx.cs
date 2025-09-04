using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services.Description;
using System.Drawing;


namespace TMS_Project
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            
         
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SendMessage();

        }

        public void SendMessage()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_ContactInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtname.Text.ToString());
                cmd.Parameters.AddWithValue("@Email", txtemail.Text.ToString());
                cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Message", txttextarea.Text.ToString());
                cmd.Parameters.AddWithValue("@Date_Time", DateTime.Now);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    //lblMessage.Text = "Message Sended";
                    //lblMessage.ForeColor = Color.Green;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "SucessContactinfo();", true);
                        

                    Empty();
                }
                else
                {
                    //lblMessage.Text = "Error Message Not Sended";
                    //lblMessage.ForeColor = Color.Red;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "FailContactinfo();", true);

                }
                con.Close();
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
          
        }
        private void Empty()
        {
            txtname.Text = string.Empty;
            txtemail.Text = string.Empty;
            ddlSubject.ClearSelection();
            txttextarea.Text = string.Empty;
        }
    }    
}