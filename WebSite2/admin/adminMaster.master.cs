using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath;
        HyperLink[] links = new HyperLink[] { HyperLink1, HyperLink2, HyperLink3, HyperLink4,HyperLink5 };
        for(int i = 0; i < links.Length; i++)
        {
            if (url == "/WebSite2/admin/"+links[i].NavigateUrl)
            {
                links[i].ForeColor = System.Drawing.Color.FromName("#3ca2f2");
            }
        }
    }
}
