using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Runtime.InteropServices;

namespace TMS_Project
{
    public partial class Tutes_SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountery();
                ddlCity.Items.Clear();
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));

                txtfName.Focus();
            }
                        
           
        }

        private void BindCountery()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select id,CountryName from Country_tb ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                ddlCountry.DataSource = dr;         
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataValueField = "Id";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("--Select Countery--","0"));
         
            }
            catch (Exception ex)
            {

                Response.Write("Error" + ex);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }

        private void BindCity(int Counterid)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select  CityId,CityName from City_tb where Countryid=@CountryId ", con);
                cmd.Parameters.AddWithValue("@CountryId", Counterid);
                SqlDataReader dr = cmd.ExecuteReader();
                ddlCity.DataSource = dr;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "Cityid";
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
                ddlCity.DataBind();
            }
            catch (Exception ex)
            {

                Response.Write("Error" + ex);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
               

            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Counterid = Convert.ToInt32( ddlCountry.SelectedValue);
            if (Counterid > 0)
            {
                BindCity(Counterid);
            }
            else
            {
                ddlCity.Items.Clear();
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }

        private void InsertTuter()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Teacher_Signin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtfName.Text);
                cmd.Parameters.AddWithValue("@Gender", txtLname.Text);
                cmd.Parameters.AddWithValue("@Mailid", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@MaritalStatus", ddlMaritalStatus.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@City", ddlCity.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Qualification",ddlQualification.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Degree", txtDegree.Text);
                cmd.Parameters.AddWithValue("@Experience", txtExperience.Text);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@Contact_No", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

               int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "SucessContactinfo();", true);
                    Cleare();


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "FailContactinfo();", true);
                    Response.Write("Data Not Inserted");
                }
                
                

            }
            catch (Exception ex)
            {

               Response.Write("Error"+ex);
            }
            finally
            {
                if (con.State==ConnectionState.Open)
                {
                    con.Close();
                }
            }
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertTuter();
        }

        private void Cleare()
        {
            txtEmail.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtfName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtDegree.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtLname.Text = string.Empty;
            txtAge.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtCPassword.Text = string.Empty;
            ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
            ddlCity.SelectedIndex = 0;
            ddlCountry.ClearSelection();
            ddlMaritalStatus.ClearSelection();
            ddlQualification.ClearSelection();
            ddlGender.ClearSelection();

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Cleare();
        }
    }
}