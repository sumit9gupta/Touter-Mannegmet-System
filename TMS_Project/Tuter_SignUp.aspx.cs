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
using System.IO;
using System.Drawing;

namespace TMS_Project
{
    public partial class Tutes_SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        string ImagePath2 = "";
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
                 bool isImageValid= UserImage();
                if (!isImageValid)
                {
                    return;
                }
                
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Teacher_Signin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtfName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLname.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedItem.Text);
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
                cmd.Parameters.AddWithValue("@image", ImagePath2.Trim());

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
                    return;
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
            lblimg_msg.Visible = false;

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Cleare();
        }

        /* private bool UserImage()
         {
             string filePath = Server.MapPath("/TeacherImage/");
             string fileName = Path.GetFileName(FileUpload1.FileName);
             string extension = Path.GetExtension(fileName).ToLower();
             HttpPostedFile postedFile = FileUpload1.PostedFile;
             int size=postedFile.ContentLength;

             if (!Directory.Exists(filePath)) 
             {
                 Directory.CreateDirectory(filePath);
             }

             if(FileUpload1.HasFile==true)
             {
                 if (extension.ToLower()==".jpg"|| extension.ToLower()==".png"|| extension.ToLower() == ".jpeg")
                 {

                     if (size<=1000000)
                     {
                         string fullPath = Path.Combine(filePath, fileName);
                         try
                         {


                             FileUpload1.SaveAs(fullPath);
                             ImagePath2 = "~/TeacherImage/" + fileName;
                             return true;
                         }
                         catch (Exception ex)
                         {
                             lblimg_msg.Text = "Error saving image: " + ex.Message;
                             lblimg_msg.ForeColor = Color.Red;
                             return false;
                         }
                     }
                     else
                     {
                         lblimg_msg.Text = "Length Should be Lesthen 1 MB";
                         lblimg_msg.ForeColor = Color.Red;
                         return false;
                     }
                 }
                 else
                 {
                     lblimg_msg.Text = "Image Should not be accept other then (.jpeg,.png,.jpg) ";
                     lblimg_msg.ForeColor = Color.Red;
                     return false;
                 }

             }
             else
             {
                 lblimg_msg.Text = "Plese Upload Image ";
                 lblimg_msg.ForeColor=Color.Red;
                 return false;
             }
         }*/
        private bool UserImage()
        {
            try
            {
                // Resolve the physical path of the folder
                string filePath = Server.MapPath("~/TeacherImage/");
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(fileName)?.ToLower();
                HttpPostedFile postedFile = FileUpload1.PostedFile;

                // Validate folder existence
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }

                // Validate file upload
                if (FileUpload1.HasFile && postedFile != null && postedFile.ContentLength > 0)
                {
                    int size = postedFile.ContentLength;

                    // Validate extension
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        // Validate file size (<= 1MB)
                        if (size <= 1000000)
                        {
                            string fullPath = Path.Combine(filePath, fileName);

                            // Save the file
                            FileUpload1.SaveAs(fullPath);
                            ImagePath2 = "~/TeacherImage/" + fileName;

                            lblimg_msg.Text = "Image uploaded successfully.";
                            lblimg_msg.ForeColor = Color.Green;
                            return true;
                        }
                        else
                        {
                            lblimg_msg.Text = "Image size should be less than 1 MB.";
                            lblimg_msg.ForeColor = Color.Red;
                            return false;
                        }
                    }
                    else
                    {
                        lblimg_msg.Text = "Only .jpg, .jpeg, and .png formats are allowed.";
                        lblimg_msg.ForeColor = Color.Red;
                        return false;
                    }
                }
                else
                {
                    lblimg_msg.Text = "Please upload a valid image file.";
                    lblimg_msg.ForeColor = Color.Red;
                    return false;
                }
            }
            catch (Exception ex)
            {
                lblimg_msg.Text = "Error saving image: " + ex.Message;
                lblimg_msg.ForeColor = Color.Red;
                return false;
            }
        }
    }
}