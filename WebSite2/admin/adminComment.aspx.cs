using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminComment : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null || Session["userName"].ToString() != "管理员")
            Response.Write("<script>alert('请登录管理员账号');window.location.href='adminDefault.aspx';</script>");
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataKey key = GridView1.DataKeys[e.RowIndex];
        int id = int.Parse(key[0].ToString());
        try
        {
            String delete = "delete from comment where id=" + id;
            conn.Open();
            new SqlCommand(delete, conn).ExecuteNonQuery();
        }
        catch { }
        finally { conn.Close(); }
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridView1.DataBind();
    }
}