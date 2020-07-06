using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginRegister : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    String url;

    protected void Page_Load(object sender, EventArgs e)
    {
        url = Request.QueryString["url"];
        if(Request.QueryString["r"]!=null&& Request.QueryString["r"] == "true")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }

    protected void Register_Click(object sender, EventArgs e)
    {
        try
        {
            String select = "select * from users where name='"+TextBox3.Text+"'";
            String insert = "insert into users values('" + TextBox3.Text + "','" + TextBox4.Text + "','"+TextBox5.Text+"','')";
            conn.Open();
            SqlDataReader reader = new SqlCommand(select, conn).ExecuteReader();
            if (reader.HasRows)
                Response.Write("<script>alert('该用户名已存在');location='javascript:history.go(-1)';</script>");
            else
            {
                conn.Close();
                conn.Open();
                int i = new SqlCommand(insert, conn).ExecuteNonQuery();
                if (i == 1)
                    Response.Write("<script>alert('注册成功');window.location='loginRegister.aspx';</script>");
                else
                    Response.Write("<script>alert('注册失败');location='javascript:history.go(-1)';</script>");
            }
        }
        catch { }
        finally
        {
            conn.Close();
        }
    }

    protected void Login_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();
            String select = "select * from users where name='" + TextBox1.Text + "' and pwd='"+TextBox2.Text+"'";
            SqlDataReader reader = new SqlCommand(select, conn).ExecuteReader();
            if (reader.HasRows&&reader.Read()) {
                if (reader.GetValue(4).ToString() == "true")
                {
                    Session["userName"] = "管理员";
                }
                else { 
                    Session["userName"] = TextBox1.Text;
                }
                if(url== null)
                    Response.Write("<script>alert('登录成功');window.location='index.aspx';</script>");
                Response.Write("<script>alert('登录成功');window.location='" + url + "';</script>");
            }
            else
            {
                Response.Write("<script>alert('用户名或密码错误');location='javascript:history.go(-1)';</script>");
            }
        }
        catch { }
        finally
        {
            conn.Close();
        }
    }
}