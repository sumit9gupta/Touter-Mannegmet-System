using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project.Tutor
{
    public partial class View_Student : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tutorusername"] == null)
            {
                Response.Redirect("~/Tutor_Login1.aspx");
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
                SqlCommand cmd = new SqlCommand("Select * from Studeny_Sigin_tb", con);
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
            SerchStudent();
        }

        private void SerchStudent()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_SerchStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Standard", txtclass.Text.Trim());
                cmd.Parameters.AddWithValue("@Type", ddltype.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Subject", txtsub.Text.Trim());
                cmd.Parameters.AddWithValue("@Countery", txtcountry.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
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