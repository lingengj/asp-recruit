using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminDefault : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            tbContent.Text = Request.QueryString["key"];
    }

    protected void Btn_SearchClick(object sender, EventArgs e)
    {
        Response.Redirect("adminDefault.aspx?key="+tbContent.Text);
    }

}