using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminInsert : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null || Session["userName"].ToString() != "管理员")
            Response.Write("<script>alert('请登录管理员账号');window.location.href='adminDefault.aspx';</script>");
    }

    protected void Btn_Insert(object sender, EventArgs e)
    {
        String tag = "";
        for (int i = 0; i < 6; i++)
        {
            if (cklTag.Items[i].Selected)
                tag += cklTag.Items[i].Text + "/";
        }
        try
        {
            String insert = "insert into position values('" + tbName.Text + "','" + dlComName.SelectedValue +
                "','" + tbSalary.Text + "','" + tag.Substring(0, tag.Length - 1) + "','" +
                ceDesc.Text + "','" + dlSort.SelectedValue + "','" + rblAca.SelectedValue + "','"
                + rblExp.SelectedValue + "','" + dlPlace.SelectedValue + "')";
            conn.Open();
            int i = new SqlCommand(insert, conn).ExecuteNonQuery();
            if (i == 1)
                Response.Write("<script>alert('发布成功');window.location='adminDefault.aspx';</script>");
            else
                Response.Write("<script>alert('发布失败');</script>");
        }
        catch { }
        finally
        {
            conn.Close();
        }
    }
}