using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminUpdate : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    static String id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null||Session["userName"].ToString() != "管理员")
            Response.Write("<script>alert('请登录管理员账号');window.location.href='adminDefault.aspx';</script>");
        if (!IsPostBack)
            tbContent.Text = Request.QueryString["key"];
    }

    protected void Btn_SearchClick(object sender, EventArgs e)
    {
        Response.Redirect("adminUpdate.aspx?key=" + tbContent.Text);
    }

    protected void Btn_Edit(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        id = ((LinkButton)sender).CommandArgument.ToString();
        try { 
        String sql = "select * from position where id=" + id;
        conn.Open();
        SqlDataReader dr= new SqlCommand(sql, conn).ExecuteReader();
            if (dr.Read())
            {
                tbName.Text = dr["name"].ToString();
                tbSalary.Text = dr["salary"].ToString();
                dlComName.SelectedValue = dr["company"].ToString();
                dlPlace.SelectedValue = dr["place"].ToString();
                dlSort.SelectedValue = dr["sort"].ToString();
                ceDesc.Text = dr["description"].ToString();
                rblAca.SelectedValue = dr["academic"].ToString();
                rblExp.SelectedValue = dr["experience"].ToString();
                String tag = dr["tag"].ToString();
                int t = 0;
                for(int i = 0; i <= tag.Length / 5; i++)
                {
                    for(int j = 0; j < 6; j++) {
                        if (tag.Substring(t, 4) == cklTag.Items[j].Text)
                            cklTag.Items[j].Selected = true;
                     }
                    t = t + 5;
                }
            }
        }
        catch{}
        finally
        {
            conn.Close();
        }
    }

    protected void Btn_Update(object sender, EventArgs e)
    {
        String tag = "";
        for (int i=0;i<6;i++)
        {
            if (cklTag.Items[i].Selected)
                tag += cklTag.Items[i].Text + "/";
        }
        try
        {
            String update = "update position set name='"+tbName.Text+"',company='"+dlComName.SelectedValue+
                "',salary='"+tbSalary.Text+"',tag='"+tag.Substring(0,tag.Length-1)+"',description='"+
                ceDesc.Text+"',sort='"+dlSort.SelectedValue+"',academic='"+rblAca.SelectedValue+"',experience='"
                +rblExp.SelectedValue+"',place='"+dlPlace.SelectedValue+"' where id=" + id;
            conn.Open();
            int i=new SqlCommand(update, conn).ExecuteNonQuery();
            if (i == 1)
                Response.Write("<script>alert('更新成功');window.location='adminUpdate.aspx?key=" + tbContent.Text + "';</script>");
            else
                Response.Write("<script>alert('更新失败');window.location='adminUpdate.aspx?key=" + tbContent.Text + "';</script>");
        }
        catch { }
        finally {
            conn.Close();
        }   
    }

    protected void Btn_Exit(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
}