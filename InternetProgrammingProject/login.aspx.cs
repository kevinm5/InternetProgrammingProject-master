using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT User_ID FROM [User] WHERE User_Username=@username AND User_Password=@password;", db);

        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        db.Open();

        try
        {
            Object id = cmd.ExecuteScalar();
            if (id != null)
            {
                Session["userid"] = id;
                Response.Redirect("/Notes.aspx");
            }
        }
        catch (Exception error)
        {
            
        }
        finally
        {
            db.Close();
        }
    }
}