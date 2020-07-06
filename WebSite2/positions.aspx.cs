using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class positions : System.Web.UI.Page
{
    int pageSize,page;
    double pageNum;
    String key, area, exp, aca, p, sort;
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink[] areaLinks = new HyperLink[] { HyperLink1, HyperLink2, HyperLink3, HyperLink4, HyperLink5, HyperLink6, HyperLink7, HyperLink8, HyperLink9, HyperLink10, HyperLink11, HyperLink12, HyperLink13 };
        HyperLink[] expLinks = new HyperLink[] { HyperLink14, HyperLink15, HyperLink16, HyperLink17, HyperLink18, HyperLink19, HyperLink20 };
        HyperLink[] acaLinks = new HyperLink[] { HyperLink21, HyperLink22, HyperLink23, HyperLink24, HyperLink25, HyperLink26 };
        HyperLink[] pLinks = new HyperLink[] { HyperLink27, HyperLink28, HyperLink29, HyperLink30, HyperLink31, HyperLink32, HyperLink33 };
        HyperLink[] sortLinks = new HyperLink[] { HyperLink34, HyperLink35, HyperLink36, HyperLink37, HyperLink38, HyperLink39, HyperLink40 };
        pageSize = 10;
        page = 0;
        if (Request.QueryString["page"] != null && Request.QueryString["page"] != "")
            page = int.Parse(Request.QueryString["page"])-1;
        key = Request.QueryString["key"];
        area = Request.QueryString["area"];
        exp = Request.QueryString["exp"];
        aca = Request.QueryString["aca"];
        p = Request.QueryString["p"];
        sort = Request.QueryString["sort"];
        try
        {
            String totalSql = "select * from position a,company b where a.company=b.name";
            String resultSql = "select top "+pageSize+" a.*,b.address,b.image,b.description as cDescription,b.employee,b.sort as cSort from position a,company b where a.company=b.name";
            String limitSql = " and a.id not in(select top "+page*pageSize+" a.id from position a,company b where a.company=b.name";
            String sortSql = ") order by id desc";
            String searchSql = "select top 8 * from search order by times desc";
            SqlDataAdapter Dad = null;
            conn.Open();
            DataSet Temp_ds = new DataSet();
            if (!IsPostBack)
            {
                if (key != "" && key != null)
                {
                    tbContent.Text = key;
                    resultSql = resultSql + " and a.name like '%" + key + "%'";
                    limitSql = limitSql + " and a.name like '%" + key + "%'";
                    totalSql = totalSql + " and a.name like '%" + key + "%'";
                }
                if (area != "" && area != null)
                {
                    for (int i = 0; i < areaLinks.Length; i++)
                    {
                        if (areaLinks[i].Text == area)
                        {
                            HyperLink1.ForeColor = System.Drawing.Color.FromName("#333232");
                            areaLinks[i].ForeColor = System.Drawing.Color.FromName("#3ca2f2");
                        }
                    }
                    if (area != "全国")
                    {
                        resultSql = resultSql + " and a.place = '" + area + "'";
                        limitSql = limitSql + " and a.place = '" + area + "'";
                        totalSql = totalSql + " and a.place = '" + area + "'";
                    }
                }
                if (exp != "" && exp != null)
                {
                    for (int i = 0; i < expLinks.Length; i++)
                    {
                        if (expLinks[i].Text == exp)
                        {
                            HyperLink14.ForeColor = System.Drawing.Color.FromName("#333232");
                            expLinks[i].ForeColor = System.Drawing.Color.FromName("#3ca2f2");
                        }
                    }
                    if (exp != "不限")
                    {
                        resultSql = resultSql + " and a.experience = '" + exp + "'";
                        limitSql = limitSql + " and a.experience = '" + exp + "'";
                        totalSql = totalSql + " and a.experience = '" + exp + "'";
                    }
                }
                if (aca != "" && aca != null)
                {
                    for (int i = 0; i < acaLinks.Length; i++)
                    {
                        if (acaLinks[i].Text == aca)
                        {
                            HyperLink21.ForeColor = System.Drawing.Color.FromName("#333232");
                            acaLinks[i].ForeColor = System.Drawing.Color.FromName("#3ca2f2");
                        }
                    }
                    if (aca != "不限")
                    {
                        resultSql = resultSql + " and a.academic = '" + aca + "'";
                        limitSql = limitSql + " and a.academic = '" + aca + "'";
                        totalSql = totalSql + " and a.academic = '" + aca + "'";
                    }
                }
                if (p != "" && p != null)
                {
                    for (int i = 0; i < pLinks.Length; i++)
                    {
                        if (pLinks[i].Text == p)
                        {
                            HyperLink27.ForeColor = System.Drawing.Color.FromName("#333232");
                            pLinks[i].ForeColor = System.Drawing.Color.FromName("#3ca2f2");
                        }
                    }
                    if (p != "不限")
                    {
                        resultSql = resultSql + " and b.employee = '" + p + "'";
                        limitSql = limitSql + " and b.employee = '" + p + "'";
                        totalSql = totalSql + " and b.employee = '" + p + "'";
                    }
                }
                if (sort != "" && sort != null)
                {
                    for (int i = 0; i < sortLinks.Length; i++)
                    {
                        if (sortLinks[i].Text == sort)
                        {
                            HyperLink34.ForeColor = System.Drawing.Color.FromName("#333232");
                            sortLinks[i].ForeColor = System.Drawing.Color.FromName("#3ca2f2");
                        }
                    }
                if (sort != "不限")
                {
                    resultSql = resultSql + " and a.sort = '" + sort + "'";
                    limitSql = limitSql + " and a.sort = '" + sort + "'";
                    totalSql = totalSql + " and a.sort = '" + sort + "'";
                }
                }
            }
            Dad = new SqlDataAdapter(searchSql, conn);
            Dad.Fill(Temp_ds, "0");
            Repeater1.DataSource = Temp_ds.Tables[0];
            Repeater1.DataBind();
            Dad = new SqlDataAdapter(resultSql +limitSql+ sortSql, conn);
            Dad.Fill(Temp_ds, "1");
            DataList1.DataSource = Temp_ds.Tables[1];
            DataList1.DataBind();
            Dad = new SqlDataAdapter(totalSql, conn);
            Dad.Fill(Temp_ds, "2");
            pageNum = (double)Temp_ds.Tables[2].Rows.Count / pageSize;
            if (pageNum > Temp_ds.Tables[2].Rows.Count / pageSize)
                pageNum++;
            for (int i = 1; i <= pageNum; i++)
            {
                String link ="positions.aspx?page="+i ;
                HyperLink h=new HyperLink();
                if (key != null)
                {
                    link = link + "&key=" + key;
                }
                if (sort != null)
                {
                    link = link + "&sort=" + sort;
                }
                if (exp != null)
                {
                    link = link + "&exp=" + exp;
                }
                if (aca != null)
                {
                    link = link + "&aca=" + aca;
                }
                if (p != null)
                {
                    link = link + "&p=" + p;
                }
                if (area != null)
                {
                    link = link + "&area=" + area;
                }
                if (i == page + 1)
                {
                    h.BackColor= System.Drawing.Color.FromName("#3ca2f2");
                    h.ForeColor = System.Drawing.Color.White;
                }
                h.NavigateUrl = link;
                h.Text = "" + i;
                Label2.Controls.Add(h);
            }
        }
        catch { }
        finally { conn.Close(); }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from search where keyName like '%" + tbContent.Text+"%'";
            conn.Open();
            SqlDataReader dr = new SqlCommand(sql, conn).ExecuteReader();
            if (dr.Read())
            {
                String update = "update search set times=times+1 where id=" + dr["id"];
                conn.Close();
                conn.Open();
                new SqlCommand(update, conn).ExecuteNonQuery();
            }
            else
            {
                String insert = "insert into search values('"+tbContent.Text+"',1)";
                conn.Close();
                conn.Open();
                new SqlCommand(insert, conn).ExecuteNonQuery();
            }
        }
        catch { }
        finally { conn.Close(); }
        String link = "positions.aspx?key=" + tbContent.Text;
        if (sort != null)
        {
            link = link + "&sort=" + sort;
        }
        if (exp != null)
        {
            link = link + "&exp=" + exp;
        }
        if (aca != null)
        {
            link = link + "&aca=" + aca;
        }
        if (p != null)
        {
            link = link + "&p=" + p;
        }
        if (area != null)
        {
            link = link + "&area=" + area;
        }
        Response.Redirect(link);
    }

    protected void Pre_Click(object sender, EventArgs e)
    {
        int pg = page+1;
        if (pg==1)
        {
            pg=1;
        }
        else
        {
            pg--;
        }
        String link = "positions.aspx?page=" + pg;
        if (key != null)
        {
            link = link + "&key=" + key;
        }
        if (sort != null)
        {
            link = link + "&sort=" + sort;
        }
        if (exp != null)
        {
            link = link + "&exp=" + exp;
        }
        if (aca != null)
        {
            link = link + "&aca=" + aca;
        }
        if (p != null)
        {
            link = link + "&p=" + p;
        }
        if (area != null)
        {
            link = link + "&area=" + area;
        }
        Response.Redirect(link);
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        int pg = page+1;
        if (pg == (int)pageNum )
        {
            pg = (int)pageNum;
        }
        else
        {
            pg++;
        }
        String link = "positions.aspx?page=" + pg;
        if (key != null)
        {
            link = link + "&key=" + key;
        }
        if (sort != null)
        {
            link = link + "&sort=" + sort;
        }
        if (exp != null)
        {
            link = link + "&exp=" + exp;
        }
        if (aca != null)
        {
            link = link + "&aca=" + aca;
        }
        if (p != null)
        {
            link = link + "&p=" + p;
        }
        if (area != null)
        {
            link = link + "&area=" + area;
        }
        Response.Redirect(link);
    }
}