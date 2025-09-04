using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Runtime.InteropServices;

namespace TMS_Project
{
    public partial class Student_Signup : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountry();
                
            }
            
        }

        private void BindCountry()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select Id,CountryName from Country_tb ", con);
                con.Open();
                SqlDataReader dr= cmd.ExecuteReader();
                ddlCountry.DataSource = dr;
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataValueField = "Id";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("--Select Country--", ""));

                Session["CountryId"] = ddlCountry.SelectedValue;
                con.Close();

            }
            catch (Exception ex)
            {

                Response.Write("Error" + ex);
            }
                  

        }

        private void BindCity(int countryId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select  CityId,CityName from City_tb where Countryid=@CountryId", con);
                cmd.Parameters.AddWithValue("@CountryId", countryId);
                con.Open();
                SqlDataReader dr=cmd.ExecuteReader();
                ddlCity.DataSource = dr;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "Cityid";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
                con.Close();

            }
            catch (Exception ex)
            {
                 Response.Write("Error" + ex);
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int countryId = Convert.ToInt32(ddlCountry.SelectedValue);
            if (countryId > 0)
            {
                BindCity(countryId);
            }
            else
            {
                ddlCity.Items.Clear();
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SubmitStudentdata();
        }

        private void SubmitStudentdata()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_studentSignup", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtFname.Text.Trim());
                cmd.Parameters.AddWithValue("@Surname ", txtLname.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                cmd.Parameters.AddWithValue("@FatherName", txtFathername.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@City", ddlCity.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.ToString());
                cmd.Parameters.AddWithValue("@Standard", txtStandard.Text.Trim());
                cmd.Parameters.AddWithValue("@GoingTo ", ddlGoingTo.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_No", Convert.ToInt32(txtContactNo.Text.Trim()));
                cmd.Parameters.AddWithValue("@Tuition_Type", ddlTuitiontype.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Tutor_Preferred", ddlTuterPreferred.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text.Trim().ToString());

               int resutl= cmd.ExecuteNonQuery();
                if (resutl > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "SucessContactinfo();", true);
                    Empty();
                   
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "FailContactinfo();", true);
                    Response.Write("Data Not Inserted");
                }
                

            }
            catch (Exception ex)
            {

                Response.Write("Error" +ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        private void Empty()
        {
            txtFname.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtLname.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtAge.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtFathername.Text = string.Empty;
            txtConfopassword.Text = string.Empty;
            txtStandard.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtpassword.Text = string.Empty;
            ddlCity.ClearSelection();
            ddlCountry.ClearSelection();
            ddlGender.ClearSelection();
            ddlGoingTo.ClearSelection();
           ddlTuterPreferred.ClearSelection();
            ddlTuitiontype.ClearSelection();
        }


        protected void btnReset_Click1(object sender, EventArgs e)
        {
            Empty();
        }
    }
}