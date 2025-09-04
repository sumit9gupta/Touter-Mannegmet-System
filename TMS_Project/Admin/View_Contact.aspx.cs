using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.WebSockets;
using System.Drawing;

namespace TMS_Project.Admin
{
    public partial class View_Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_User"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            if (!IsPostBack)
            {
                
                BindGrid();
            }
        }

        private void BindGrid()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_ViewContact", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        private void DeleteRow(int id)
        {
            try
            {
               
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from Contact_tbl where Id=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
               int result= cmd.ExecuteNonQuery();
                if (result > 0)
                {
                   

                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Deleted','Record Deleted Successfully','success');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire('Fail','Record Not Deleted','error');", true);

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
            BindGrid();
        }

        protected void btndelete_Click1(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            DeleteRow(id);
        }
    }
}