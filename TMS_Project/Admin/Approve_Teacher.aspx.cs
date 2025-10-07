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
    public partial class Approve_Teacher : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void txtId_TextChanged(object sender, EventArgs e)
        {
            
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select Id from Teacher_Signin_tb where Id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", txtId.Text.Trim());
                int res=Convert.ToInt32( cmd.ExecuteScalar());
                if (res > 0)
                {
                    lblres.Visible = false;
                }
                else
                {
                    lblres.Text = "Invalid Id Not Exigiest in DataBase ";
                    lblres.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblres.Text = ex.Message;
            } 
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Teacher_Signin_tb set Status=@sts where Id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", txtId.Text);
                cmd.Parameters.AddWithValue("@sts", ddlvalue.SelectedValue);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblMessage.Text = "Condition Apply Successfully";
                    lblres.ForeColor = System.Drawing.Color.Green;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "SucessContactinfo();", true);
                }
                con.Close();
            }
            catch (Exception ex)
            {

               lblMessage.Text = ex.Message;
            }
        }

        private void BindGrid()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Approveview_Teacher", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                MyGrid.DataSource = dt;
                MyGrid.DataBind();

            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
            finally { con.Close(); }
        }
    }
}