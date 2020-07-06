<%@ Page Title="首页" Language="C#" MasterPageFile="~/headFoot.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script  src="js/jquery-3.3.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container">
        <div class="pic">
            <div class="content">
                <img src="image/carousel1.jpg" />
                <img src="image/carousel2.jpg" />
                <img src="image/carousel3.jpg" />
                <img src="image/carousel4.jpg" />
                <img src="image/carousel5.jpg" />
            </div>
            <ul class="index">
                <li class="first"></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
            <div id="right">></div>
            <div id="left"><</div>
        </div>
        <div id="search">
            <asp:TextBox PlaceHolder="输入职位关键词：如 Java等" ID="tbContent" runat="server"  ForeColor="Black" BorderWidth="0px" Height="50px" Width="780px" CssClass="tbContent"  ></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" BackColor="#1D81C7" BorderWidth="0px" Font-Bold="False" Font-Size="12pt" ForeColor="White" Height="54px" Width="120px" CssClass="btnSearch" OnClick="BtnSearch_Click" />
            <div id="hot">
                <a>热门搜索：</a>
                <asp:Repeater ID="Repeater20" runat="server">
                    <ItemTemplate>
                        <a href="positions.aspx?key=<%#Eval("keyName") %>"><%#Eval("keyName") %></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div id="content">
            <div class="git">
                <div class="left">
                    <div class="leftTop">
                        <div class="logo"></div>
                        <h2 class="title">IT·互联网</h2>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater7" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "positions.aspx?key="+DataBinder.Eval(Container.DataItem,"key") %>'><%#Eval("key") %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater14" runat="server">
                            <ItemTemplate>
                                <a href="#"><%#Eval("key") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="right">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="littlePart">
                                <div class="position">
                                    <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                                    <span class="salary"><%#Eval("salary") %></span>
                                    <span class="info"><%# Eval("place")%>  |  <%# Eval("experience")%>  |  <%# Eval("academic")%></span></div>
                                <div  class="company">
                                    <a href="#"><%# Eval("company")%></a>
                                    <img src="<%#Eval("image") %>" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="git">
                <div class="left">
                    <div class="leftTop">
                        <div class="logo"></div>
                        <h2 class="title">房地产</h2>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater8" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "positions.aspx?key="+DataBinder.Eval(Container.DataItem,"key") %>' runat="server"><%#Eval("key") %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater15" runat="server">
                            <ItemTemplate>
                                <a href="#"><%#Eval("key") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="right">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <div class="littlePart">
                                <div class="position">
                                    <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                                    <span class="salary"><%#Eval("salary") %></span>
                                    <span class="info"><%# Eval("place")%>  |  <%# Eval("experience")%>  |  <%# Eval("academic")%></span></div>
                                <div  class="company">
                                    <a href="#"><%# Eval("company")%></a>
                                    <img src="<%#Eval("image") %>" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="git">
                <div class="left">
                    <div class="leftTop">
                        <div class="logo"></div>
                        <h2 class="title">金融</h2>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater9" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# "positions.aspx?key="+DataBinder.Eval(Container.DataItem,"key") %>' runat="server"><%#Eval("key") %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater16" runat="server">
                            <ItemTemplate>
                                <a href="#"><%#Eval("key") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="right">
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <div class="littlePart">
                                <div class="position">
                                    <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                                    <span class="salary"><%#Eval("salary") %></span>
                                    <span class="info"><%# Eval("place")%>  |  <%# Eval("experience")%>  |  <%# Eval("academic")%></span></div>
                                <div  class="company">
                                    <a href="#"><%# Eval("company")%></a>
                                    <img src="<%#Eval("image") %>" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="git">
                <div class="left">
                    <div class="leftTop">
                        <div class="logo"></div>
                        <h2 class="title">消费品</h2>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater10" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink4" NavigateUrl='<%# "positions.aspx?key="+DataBinder.Eval(Container.DataItem,"key") %>' runat="server"><%#Eval("key") %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater17" runat="server">
                            <ItemTemplate>
                                <a href="#"><%#Eval("key") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="right">
                    <asp:Repeater ID="Repeater4" runat="server">
                        <ItemTemplate>
                            <div class="littlePart">
                                <div class="position">
                                    <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                                    <span class="salary"><%#Eval("salary") %></span>
                                    <span class="info"><%# Eval("place")%>  |  <%# Eval("experience")%>  |  <%# Eval("academic")%></span></div>
                                <div  class="company">
                                    <a href="#"><%# Eval("company")%></a>
                                    <img src="<%#Eval("image") %>" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="git">
                <div class="left">
                    <div class="leftTop">
                        <div class="logo"></div>
                        <h2 class="title">汽车·制造</h2>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater11" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink5" NavigateUrl='<%# "positions.aspx?key="+DataBinder.Eval(Container.DataItem,"key") %>' runat="server"><%#Eval("key") %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater18" runat="server">
                            <ItemTemplate>
                                <a href="#"><%#Eval("key") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="right">
                    <asp:Repeater ID="Repeater5" runat="server">
                        <ItemTemplate>
                            <div class="littlePart">
                                <div class="position">
                                    <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                                    <span class="salary"><%#Eval("salary") %></span>
                                    <span class="info"><%# Eval("place")%>  |  <%# Eval("experience")%>  |  <%# Eval("academic")%></span></div>
                                <div  class="company">
                                    <a href="#"><%# Eval("company")%></a>
                                    <img src="<%#Eval("image") %>" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="git">
                <div class="left">
                    <div class="leftTop">
                        <div class="logo"></div>
                        <h2 class="title">医疗·化工</h2>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater12" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink6" NavigateUrl='<%# "positions.aspx?key="+DataBinder.Eval(Container.DataItem,"key") %>' runat="server"><%#Eval("key") %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="part">
                        <asp:Repeater ID="Repeater19" runat="server">
                            <ItemTemplate>
                                <a href="#"><%#Eval("key") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="right">
                        <asp:Repeater ID="Repeater6" runat="server">
                            <ItemTemplate>
                                <div class="littlePart">
                                    <div class="position">
                                        <a class="positionName" href="position.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                                        <span class="salary"><%#Eval("salary") %></span>
                                        <span class="info"><%# Eval("place")%>  |  <%# Eval("experience")%>  |  <%# Eval("academic")%></span></div>
                                    <div  class="company">
                                        <a href="#"><%# Eval("company")%></a>
                                        <img src="<%#Eval("image") %>" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <h3 id="cityTitle">城市热招</h3>
        <div id="city">
            <asp:Repeater ID="Repeater13" runat="server">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink7" runat="server" Text='<%# Eval("img", "<img src={0} width=160 height=77 border=0 />") %>' NavigateUrl='<%# "positions.aspx?area="+DataBinder.Eval(Container.DataItem,"name") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            var timer = setInterval(picLoop,3000);
            var index = 0;
            function picLoop(){
                index++;
                if (index == 5) { index = 0; }
                $(".content").animate({ "left": -1000 * index }, 2000);
                $(".index li").eq(index).css("background-color","red")
                       .siblings().css("background-color","rgba(100,100,100,0.3)");
            }

            $(".pic").hover(function(){
                clearInterval(timer);
                $("#left").show();
                $("#right").show();
            },function(){
                timer = setInterval(picLoop,3000);
                $("#left").hide();
                $("#right").hide();
            })

            $(".index li").mouseover(function(){
                $(this).css("background-color","red")
                       .siblings().css("background-color","rgba(100,100,100,0.3)");
                index = $(this).index();
                $(".content").animate({ "left": -1000 * index }, 300);

            })

            $("#left").click(function(){
                index--;
                if (index==-1) {index=4;}
                $(".content").animate({"left":-1000*index},1000);
                $(".index li").eq(index).css("background-color","red")
                       .siblings().css("background-color","rgba(100,100,100,0.3)");
            })
            $("#right").click(function(){
                index++;
                if (index==5) {index=0}
                $(".content").animate({"left":-1000*index},1000);
                $(".index li").eq(index).css("background-color","red")
                       .siblings().css("background-color","rgba(100,100,100,0.3)");    
            })
        })
    </script>
</asp:Content>
