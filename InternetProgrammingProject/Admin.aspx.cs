using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] == null)
        {
            Response.Redirect("/AdminLogin.aspx");
        }
    }

    protected void lbInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["User_Username"].DefaultValue=((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
        SqlDataSource1.InsertParameters["User_Password"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPassword")).Text;

        SqlDataSource1.Insert();
    }
}