using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

// Todo: Add validation on username, make sure it does not already exist in db. Add validation
// on password, make sure it is strong and that it matches repeat password. 
public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblName.Visible = false;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO [USER] (User_Username, User_Password) VALUES (@username, @password); SELECT SCOPE_IDENTITY();", db);
        
        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        db.Open();

        try
        {
            SqlCommand check_User_Name = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([User_Username] = @user)", db);
            check_User_Name.Parameters.AddWithValue("@user", txtUsername.Text);
            int UserExist = (int)check_User_Name.ExecuteScalar();
            Page.Validate();
            if (UserExist == 0 && Page.IsValid)
            {
                Session["userid"] = cmd.ExecuteScalar();
                Response.Redirect("/Notes.aspx");
            }
            else
            {
                lblName.Visible = true;
            }
        } 
        finally
        {
            db.Close();
        }


        
    }
}