using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class css_headFoot : System.Web.UI.MasterPage
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        login.NavigateUrl = "~/loginRegister.aspx?url="+ HttpContext.Current.Request.Url.PathAndQuery;
        register.NavigateUrl = "~/loginRegister.aspx?r=true&url="+ HttpContext.Current.Request.Url.PathAndQuery;
        if (Session["userName"] != null)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            HyperLink1.Text = Session["userName"].ToString();
            if (Session["userName"].ToString() == "管理员")
            {
                Image1.ImageUrl = "~/image/admin.jpeg";
                AdminDefault.Visible = true;
            }
            try
            {
                String sql = "select * from collection c,position p where uName='"+Session["userName"]+"' and c.pId=p.id";
                conn.Open();
                DataSet Temp_ds = new DataSet();
                SqlDataAdapter Dad = new SqlDataAdapter(sql, conn);
                Dad.Fill(Temp_ds);
                DataList1.DataSource = Temp_ds.Tables[0];
                DataList1.DataBind();
            }
            catch { }
            finally { conn.Close(); }
        }
    }

    protected void Exit_Click(object sender, EventArgs e)
    {
        Session.Remove("userName");
        Response.Redirect(HttpContext.Current.Request.Url.PathAndQuery);
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (slideR.Visible == false)
        {
            slideR.Visible = true;
            Image2.ImageUrl = "~/image/collect.png";
            LinkButton2.ForeColor = System.Drawing.Color.FromName("#3ca2f2");
        }
        else if (slideR.Visible == true)
        {
            slideR.Visible = false;
            Image2.ImageUrl = "~/image/icon.png";
        }
    }
}
