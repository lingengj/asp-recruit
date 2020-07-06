<%@ Page Title="全部职位" Language="C#" MasterPageFile="~/headFoot.master" AutoEventWireup="true" CodeFile="positions.aspx.cs" Inherits="positions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/positions.css" rel="stylesheet" type="text/css" />
    <script  src="js/jquery-3.3.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="bg">
    <div id="condition">
        <div id="search">
            <asp:TextBox PlaceHolder="输入职位关键词：如 Java等" ID="tbContent" runat="server"  ForeColor="Black" BorderWidth="0px" Height="50px" Width="860px" CssClass="tbContent"  ></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" BackColor="#1D81C7" BorderWidth="0px" Font-Bold="False" Font-Size="12pt" ForeColor="White" Height="54px" Width="120px" CssClass="btnSearch" OnClick="BtnSearch_Click" />
            <div id="hot">
                <a>热门搜索：</a>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <a href="javascript:;" onclick="key(this.innerText)"><%#Eval("keyName") %></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="condition">
            <span>工作地点：</span>
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#3ca2f2" href="javascript:;" onclick="area(this.innerText)">全国</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" href="javascript:;" onclick="area(this.innerText)">北京</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" href="javascript:;" onclick="area(this.innerText)">上海</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" href="javascript:;" onclick="area(this.innerText)">广州</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" href="javascript:;" onclick="area(this.innerText)">深圳</asp:HyperLink>
            <asp:HyperLink ID="HyperLink6" runat="server" href="javascript:;" onclick="area(this.innerText)">苏州</asp:HyperLink>
            <asp:HyperLink ID="HyperLink7" runat="server" href="javascript:;" onclick="area(this.innerText)">天津</asp:HyperLink>
            <asp:HyperLink ID="HyperLink8" runat="server" href="javascript:;" onclick="area(this.innerText)">杭州</asp:HyperLink>
            <asp:HyperLink ID="HyperLink9" runat="server" href="javascript:;" onclick="area(this.innerText)">西安</asp:HyperLink>
            <asp:HyperLink ID="HyperLink10" runat="server" href="javascript:;" onclick="area(this.innerText)">武汉</asp:HyperLink>
            <asp:HyperLink ID="HyperLink11" runat="server" href="javascript:;" onclick="area(this.innerText)">南京</asp:HyperLink>
            <asp:HyperLink ID="HyperLink12" runat="server" href="javascript:;" onclick="area(this.innerText)">长沙</asp:HyperLink>
            <asp:HyperLink ID="HyperLink13" runat="server" href="javascript:;" onclick="area(this.innerText)">成都</asp:HyperLink>
        </div>
        <div class="condition">
            <span>工作经验：</span>
            <asp:HyperLink ID="HyperLink14" runat="server" ForeColor="#3ca2f2" href="javascript:;" onclick="exp(this.innerText)">不限</asp:HyperLink>
            <asp:HyperLink ID="HyperLink15" runat="server" href="javascript:;" onclick="exp(this.innerText)">应届毕业生</asp:HyperLink>
            <asp:HyperLink ID="HyperLink16" runat="server" href="javascript:;" onclick="exp(this.innerText)">1-3年</asp:HyperLink>
            <asp:HyperLink ID="HyperLink17" runat="server" href="javascript:;" onclick="exp(this.innerText)">3-5年</asp:HyperLink>
            <asp:HyperLink ID="HyperLink18" runat="server" href="javascript:;" onclick="exp(this.innerText)">5-10年</asp:HyperLink>
            <asp:HyperLink ID="HyperLink19" runat="server" href="javascript:;" onclick="exp(this.innerText)">10年以上</asp:HyperLink>
            <asp:HyperLink ID="HyperLink20" runat="server" href="javascript:;" onclick="exp(this.innerText)">经验不限</asp:HyperLink>
        </div>
        <div class="condition">
            <span>学历要求：</span>
            <asp:HyperLink ID="HyperLink21" runat="server" ForeColor="#3ca2f2" href="javascript:;" onclick="aca(this.innerText)">不限</asp:HyperLink>
            <asp:HyperLink ID="HyperLink22" runat="server" href="javascript:;" onclick="aca(this.innerText)">大专</asp:HyperLink>
            <asp:HyperLink ID="HyperLink23" runat="server" href="javascript:;" onclick="aca(this.innerText)">本科</asp:HyperLink>
            <asp:HyperLink ID="HyperLink24" runat="server" href="javascript:;" onclick="aca(this.innerText)">硕士</asp:HyperLink>
            <asp:HyperLink ID="HyperLink25" runat="server" href="javascript:;" onclick="aca(this.innerText)">博士</asp:HyperLink>
            <asp:HyperLink ID="HyperLink26" runat="server" href="javascript:;" onclick="aca(this.innerText)">不要求</asp:HyperLink>
        </div>
        <div class="condition">
            <span>公司规模：</span>
            <asp:HyperLink ID="HyperLink27" runat="server" ForeColor="#3ca2f2" href="javascript:;" onclick="p(this.innerText)">不限</asp:HyperLink>
            <asp:HyperLink ID="HyperLink28" runat="server" href="javascript:;" onclick="p(this.innerText)">少于100人</asp:HyperLink>
            <asp:HyperLink ID="HyperLink29" runat="server" href="javascript:;" onclick="p(this.innerText)">100-500人</asp:HyperLink>
            <asp:HyperLink ID="HyperLink30" runat="server" href="javascript:;" onclick="p(this.innerText)">500-1000人</asp:HyperLink>
            <asp:HyperLink ID="HyperLink31" runat="server" href="javascript:;" onclick="p(this.innerText)">1000-5000人</asp:HyperLink>
            <asp:HyperLink ID="HyperLink32" runat="server" href="javascript:;" onclick="p(this.innerText)">5000-10000人</asp:HyperLink>
            <asp:HyperLink ID="HyperLink33" runat="server" href="javascript:;" onclick="p(this.innerText)">10000人以上</asp:HyperLink>
        </div>
        <div class="condition">
            <span>行业领域：</span>
            <asp:HyperLink ID="HyperLink34" runat="server" ForeColor="#3ca2f2" href="javascript:;" onclick="sort(this.innerText)">不限</asp:HyperLink>
            <asp:HyperLink ID="HyperLink35" runat="server" href="javascript:;" onclick="sort(this.innerText)">IT·互联网</asp:HyperLink>
            <asp:HyperLink ID="HyperLink36" runat="server" href="javascript:;" onclick="sort(this.innerText)">房地产</asp:HyperLink>
            <asp:HyperLink ID="HyperLink37" runat="server" href="javascript:;" onclick="sort(this.innerText)">金融</asp:HyperLink>
            <asp:HyperLink ID="HyperLink38" runat="server" href="javascript:;" onclick="sort(this.innerText)">消费品</asp:HyperLink>
            <asp:HyperLink ID="HyperLink39" runat="server" href="javascript:;" onclick="sort(this.innerText)">汽车·制造</asp:HyperLink>
            <asp:HyperLink ID="HyperLink40" runat="server" href="javascript:;" onclick="sort(this.innerText)">医疗·化工</asp:HyperLink>
        </div>
    </div>
</div>
<asp:DataList ID="DataList1" runat="server" CssClass="positions">
    <ItemTemplate>
        <div class="littlePart">
            <div class="position">
                <div class="connect">
                    <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                    <span class="salary"><%#Eval("salary") %></span>
                </div>
                <span class="info"><%# Eval("place")%>&nbsp |&nbsp <%# Eval("experience")%>&nbsp |&nbsp <%# Eval("academic")%></span>
                <span class="tag">
                    <a><%#Eval("tag").ToString().Substring(0,4) %></a>
                    <a><%#Eval("tag").ToString().Length>4?Eval("tag").ToString().Substring(5,4):Eval("tag").ToString().Substring(0,4) %></a>
                    <a><%#Eval("tag").ToString().Length>9?Eval("tag").ToString().Substring(10,4):Eval("tag").ToString().Substring(0,4) %></a>
                    <a><%#Eval("tag").ToString().Length>14?Eval("tag").ToString().Substring(15,4):Eval("tag").ToString().Substring(0,4) %></a>
                </span>
            </div>
            <div  class="company">
                <a href="#"><%# Eval("company")%></a>
                <img src="<%#Eval("image") %>" />
                <span class="info"><%# Eval("cSort")%>&nbsp |&nbsp <%# Eval("employee")%></span>
                <span class="address"><%#Eval("address") %></span>
            </div>
        </div>
    </ItemTemplate>
</asp:DataList>
<asp:Label ID="Label1" runat="server" CssClass="pageNum" >
    <div id="bigPack">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pre_next" OnClick="Pre_Click"><</asp:LinkButton>
        <asp:Label ID="Label2" runat="server" CssClass="pack" ></asp:Label>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="pre_next" OnClick="Next_Click">></asp:LinkButton>
    </div>
</asp:Label>

<script type="text/javascript">
    
    function area(area) {
        var link = "positions.aspx?area="+ area;
        if (GetQueryString('key') != null) {
            link = link+"&key="+GetQueryString('key');
        }
        if (GetQueryString('exp') != null) {
            link = link+"&exp="+GetQueryString('exp');
        }
        if (GetQueryString('aca') != null) {
            link = link+"&aca="+GetQueryString('aca');
        }
        if (GetQueryString('p') != null) {
            link = link+"&p="+GetQueryString('p');
        }
        if (GetQueryString('sort') != null) {
            link = link+"&sort="+GetQueryString('sort');
        }
        window.location.href = link;
    }

    function exp(exp) {
        var link = "positions.aspx?exp="+ exp;
        if (GetQueryString('key') != null) {
            link = link+"&key="+GetQueryString('key');
        }
        if (GetQueryString('area') != null) {
            link = link+"&area="+GetQueryString('area');
        }
        if (GetQueryString('aca') != null) {
            link = link+"&aca="+GetQueryString('aca');
        }
        if (GetQueryString('p') != null) {
            link = link+"&p="+GetQueryString('p');
        }
        if (GetQueryString('sort') != null) {
            link = link+"&sort="+GetQueryString('sort');
        }
        window.location.href = link;
    }

    function aca(aca) {
        var link = "positions.aspx?aca="+ aca;
        if (GetQueryString('key') != null) {
            link = link+"&key="+GetQueryString('key');
        }
        if (GetQueryString('exp') != null) {
            link = link+"&exp="+GetQueryString('exp');
        }
        if (GetQueryString('area') != null) {
            link = link+"&area="+GetQueryString('area');
        }
        if (GetQueryString('p') != null) {
            link = link+"&p="+GetQueryString('p');
        }
        if (GetQueryString('sort') != null) {
            link = link+"&sort="+GetQueryString('sort');
        }
        window.location.href = link;
    }

    function p(p) {
        var link = "positions.aspx?p="+ p;
        if (GetQueryString('key') != null) {
            link = link+"&key="+GetQueryString('key');
        }
        if (GetQueryString('exp') != null) {
            link = link+"&exp="+GetQueryString('exp');
        }
        if (GetQueryString('aca') != null) {
            link = link+"&aca="+GetQueryString('aca');
        }
        if (GetQueryString('area') != null) {
            link = link+"&area="+GetQueryString('area');
        }
        if (GetQueryString('sort') != null) {
            link = link+"&sort="+GetQueryString('sort');
        }
        window.location.href = link;
    }

    function sort(sort) {
        var link = "positions.aspx?sort="+ sort;
        if (GetQueryString('key') != null) {
            link = link+"&key="+GetQueryString('key');
        }
        if (GetQueryString('exp') != null) {
            link = link+"&exp="+GetQueryString('exp');
        }
        if (GetQueryString('aca') != null) {
            link = link+"&aca="+GetQueryString('aca');
        }
        if (GetQueryString('p') != null) {
            link = link+"&p="+GetQueryString('p');
        }
        if (GetQueryString('area') != null) {
            link = link+"&area="+GetQueryString('area');
        }
        window.location.href = link;
    }

    function key(key) {
        var link = "positions.aspx?key="+ key;
        if (GetQueryString('sort') != null) {
            link = link+"&sort="+GetQueryString('sort');
        }
        if (GetQueryString('exp') != null) {
            link = link+"&exp="+GetQueryString('exp');
        }
        if (GetQueryString('aca') != null) {
            link = link+"&aca="+GetQueryString('aca');
        }
        if (GetQueryString('p') != null) {
            link = link+"&p="+GetQueryString('p');
        }
        if (GetQueryString('area') != null) {
            link = link+"&area="+GetQueryString('area');
        }
        window.location.href = link;
    }

    function GetQueryString(name) {   
       var url = window.location.search; //获取url中"?"符后的字串   
       var theRequest = new Object();   
       if (url.indexOf("?") != -1) {   
	      var str = url.substr(1);   
	      strs = str.split("&");   
	      for(var i = 0; i < strs.length; i ++) {   
		      //就是这句的问题
		     theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]); 
		     //之前用了unescape()
		     //才会出现乱码  
	      }   
       }   
       return theRequest[name];   
    }
    
</script>
</asp:Content>

