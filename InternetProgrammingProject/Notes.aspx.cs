using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Notes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("/Login.aspx");
        }
        else
        {
            int userID;
            int.TryParse(Session["userid"].ToString(), out userID);
            if (userID == 0)
            {
                badPullLabel.Visible = true; //Display that the data is incorrect because of a bad parse
            }
        }
    }

    protected void InsertButton_Click(Object sender, EventArgs e)
    {
        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO [Note] (FK_User_ID, Note_Title, Note_Text) VALUES (@FK_User_ID, @Note_Title, @Note_Text); SELECT SCOPE_IDENTITY();", db);

        cmd.Parameters.AddWithValue("@FK_User_ID", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@Note_Title", NoteTitleTextbox.Text);
        cmd.Parameters.AddWithValue("@Note_Text", NoteTextTextbox.Text);
        db.Open();

        try
        {
            cmd.ExecuteScalar();
            Response.Redirect("/Notes.aspx"); //If anyone knows of a better way to simply refresh the page, go ahead and replace this line with that
        }
        finally
        {
            db.Close();
        }
    }
}