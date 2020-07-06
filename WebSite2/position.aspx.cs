using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class position : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    int positionId = 0;
    Boolean isCollected = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            positionId = int.Parse(Request.QueryString["id"]);
            String sql = "select a.*,b.address,b.image,b.description as cDescription,b.employee,b.sort as cSort from position a,company b where a.company=b.name and a.id=" + positionId;
            String commentSql = "select * from comment where pId=" + positionId;
            conn.Open();
            DataSet Temp_ds = new DataSet();
            SqlDataAdapter Dad = new SqlDataAdapter(sql, conn);
            Dad.Fill(Temp_ds);
            Repeater1.DataSource = Temp_ds.Tables[0];
            Repeater1.DataBind();
            Repeater2.DataSource = Temp_ds.Tables[0];
            Repeater2.DataBind();
            Dad = new SqlDataAdapter(commentSql, conn);
            Dad.Fill(Temp_ds,"1");
            Repeater3.DataSource = Temp_ds.Tables[1];
            Repeater3.DataBind();
            String tag = Temp_ds.Tables[0].Rows[0][4].ToString();
            int t = 0;
            for (int i=0;i<= tag.Length / 5; i++)
            {
                HyperLink h = new HyperLink();
                h.Text = tag.Substring(t, 4).ToString();
                t = t + 5;
                Label1.Controls.Add(h);
            }
            if (Session["userName"] != null)
            {
                String isCollectedSql = "select * from collection where uName='" + Session["userName"] + "' and pId="+positionId+"";
                SqlDataReader reader = new SqlCommand(isCollectedSql, conn).ExecuteReader();
                if (reader.HasRows)
                {
                    Image1.ImageUrl = "~/image/collected.png";
                    isCollected = true;
                }
            }
        }
        catch { }
        finally { conn.Close(); }
    }

    protected void Collect_Click(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            try
            {
                conn.Open();
                if (!isCollected) { 
                    String insert = "insert into collection values('" + Session["userName"].ToString() + "',"+positionId+")";
                    new SqlCommand(insert, conn).ExecuteNonQuery();
                    Image1.ImageUrl = "~/image/collected.png";
                }
                else
                {
                    String delete = "delete from collection where uName='"+ Session["userName"].ToString() + "' and pId="+positionId;
                    new SqlCommand(delete, conn).ExecuteNonQuery();
                    Image1.ImageUrl = "~/image/collect.png";
                }
            }
            catch { }
            finally { conn.Close(); }
        }
        else
        {
            Response.Write("<script>alert('请先登录');location='javascript:history.go(-1)';</script>");
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            try
            {
                conn.Open();
                String insert = "insert into comment values('"+TextBox1.Text+"',"+positionId+",'" + Session["userName"].ToString() + "','" +DateTime.Now.GetDateTimeFormats('f')[0].ToString() + "')";
                new SqlCommand(insert, conn).ExecuteNonQuery();
                Response.Write("<script>alert('评论成功');window.location='position.aspx?id="+ positionId +"';</script>");
            }
            catch { }
            finally { conn.Close(); }
        }
        else
        {
            Response.Write("<script>alert('请先登录');location='javascript:history.go(-1)';</script>");
        }
    }
}