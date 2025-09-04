using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project.Student
{
    public partial class View_Tutors : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Studentusername"] == null)
            {
                Response.Redirect("~/Student_Login.aspx");
            }


            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("Select * from Teacher_Signin_tb ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

       

        protected void btnserch_Click(object sender, EventArgs e)
        {
            searchTutor();
        }

        private void searchTutor()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_SearchTeacher2", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@Experience", ddlexp.SelectedValue == "0" ? (object)DBNull.Value : ddlexp.SelectedValue);

                cmd.Parameters.AddWithValue("@Country", txtcountry.Text.Trim());
                cmd.Parameters.AddWithValue("@Degree", txtqfc.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('No data found');</script>");
                    Repeater1.DataSource = null;
                    Repeater1.DataBind();
                }
                
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
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