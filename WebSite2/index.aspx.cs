using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    private static String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            String order = " order by a.id desc";
            String sql = "select top 6 a.*,b.image from position a,company b where a.company=b.name and a.sort=";
            String sort = "";
            String order2 = " and kind='职位'";
            String order3 = " and kind='公司'";
            String keySql = "select * from hot where sort=";
            String citySql = "select COUNT(*) as num,a.name,a.img from city a,position b where b.place=a.name group by a.name,a.img order by num desc";
            String searchSql = "select top 8 * from search order by times desc";
            SqlDataAdapter Dad=null;
            conn.Open();
            DataSet Temp_ds = new DataSet();
            for(int i = 0; i < 18; i++)
            {
                switch (i)
                {
                    case 0:
                    case 6:
                    case 12:
                        sort = "'IT·互联网'";
                        break;
                    case 1:
                    case 7:
                    case 13:
                        sort = "'房地产'";
                        break;
                    case 2:
                    case 8:
                    case 14:
                        sort = "'金融'";
                        break;
                    case 3:
                    case 9:
                    case 15:
                        sort = "'消费品'";
                        break;
                    case 4:
                    case 10:
                    case 16:
                        sort = "'汽车·制造'";
                        break;
                    case 5:
                    case 11:
                    case 17:
                        sort = "'医疗·化工'";
                        break;
                }
                if (i < 6)
                    Dad = new SqlDataAdapter(sql + sort + order, conn);
                else if(i<12)
                    Dad = new SqlDataAdapter(keySql + sort + order2, conn);
                else
                    Dad = new SqlDataAdapter(keySql + sort + order3, conn);
                Dad.Fill(Temp_ds,""+i);
            }
            Repeater1.DataSource = Temp_ds.Tables[0];
            Repeater1.DataBind();
            Repeater2.DataSource = Temp_ds.Tables[1];
            Repeater2.DataBind();
            Repeater3.DataSource = Temp_ds.Tables[2];
            Repeater3.DataBind();
            Repeater4.DataSource = Temp_ds.Tables[3];
            Repeater4.DataBind();
            Repeater5.DataSource = Temp_ds.Tables[4];
            Repeater5.DataBind();
            Repeater6.DataSource = Temp_ds.Tables[5];
            Repeater6.DataBind();
            Repeater7.DataSource = Temp_ds.Tables[6];
            Repeater7.DataBind();
            Repeater8.DataSource = Temp_ds.Tables[7];
            Repeater8.DataBind();
            Repeater9.DataSource = Temp_ds.Tables[8];
            Repeater9.DataBind();
            Repeater10.DataSource = Temp_ds.Tables[9];
            Repeater10.DataBind();
            Repeater11.DataSource = Temp_ds.Tables[10];
            Repeater11.DataBind();
            Repeater12.DataSource = Temp_ds.Tables[11];
            Repeater12.DataBind();
            Repeater14.DataSource = Temp_ds.Tables[12];
            Repeater14.DataBind();
            Repeater15.DataSource = Temp_ds.Tables[13];
            Repeater15.DataBind();
            Repeater16.DataSource = Temp_ds.Tables[14];
            Repeater16.DataBind();
            Repeater17.DataSource = Temp_ds.Tables[15];
            Repeater17.DataBind();
            Repeater18.DataSource = Temp_ds.Tables[16];
            Repeater18.DataBind();
            Repeater19.DataSource = Temp_ds.Tables[17];
            Repeater19.DataBind();
            Dad = new SqlDataAdapter(citySql, conn);
            Dad.Fill(Temp_ds, 18+"");
            Repeater13.DataSource = Temp_ds.Tables[18];
            Repeater13.DataBind();
            Dad = new SqlDataAdapter(searchSql, conn);
            Dad.Fill(Temp_ds, 19 + "");
            Repeater20.DataSource = Temp_ds.Tables[19];
            Repeater20.DataBind();
        }
        catch { }
        finally { conn.Close(); }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            String sql = "select * from search where keyName like '%" + tbContent.Text + "%'";
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
                String insert = "insert into search values('" + tbContent.Text + "',1)";
                conn.Close();
                conn.Open();
                new SqlCommand(insert, conn).ExecuteNonQuery();
            }
        }
        catch { }
        finally { conn.Close(); }
        String link = "positions.aspx?key=" + tbContent.Text;
        Response.Redirect(link);
    }

}