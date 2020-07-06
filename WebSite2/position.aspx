<%@ Page Title="职位详情" Language="C#" MasterPageFile="~/headFoot.master" AutoEventWireup="true" CodeFile="~/position.aspx.cs" Inherits="position" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/position.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="position">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <span class="companyName"><%#Eval("company") %>招聘</span>
                <span class="positionName"><%#Eval("name") %></span>
                <span class="salary"><%#Eval("salary") %></span>
                <span class="info">/<%# Eval("place")%>/<%# Eval("experience")%>/<%# Eval("academic")%></span>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="Label1" runat="server" CssClass="tag"></asp:Label>
        <asp:Image ID="Image1" runat="server" Height="20px" Width="20px" ImageUrl="~/image/collect.png" CssClass="collecting" BorderWidth="0px" BorderStyle="None" />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Collect_Click" Text="收藏" CssClass="collect"></asp:LinkButton>
    </div>
        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <div id="detailBg">
                    <div id="detail">
                        <div id="pDetail">
                            <h4 id="pTitle">职位描述</h4>
                            <div id="pDesc"><%#Eval("description") %></div>
                            <h4 id="cTitle">公司介绍</h4>
                            <div id="cDesc"><%#Eval("cDescription") %></div>
                        </div>
                        <div id="cDetail">
                            <h2>公司基本信息</h2>
                            <img id="head" src='<%#Eval("image") %>'' />
                            <h3 id="cName"><%#Eval("company") %></h3>
                            <p id="sort">
                                <img src="image/companySort.png"></img>
                                <%#Eval("cSort") %>
                            </p>
                            <p id="employee">
                                <img src="image/personNum.png"></img>
                                <%#Eval("employee") %>
                            </p>
                            <p id="address">
                                <img src="image/companyAddr.png"></img>
                                <%#Eval("address") %>
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div id="comment">
            <div id="commentInput">
                <asp:TextBox ID="TextBox1" runat="server" Width="750" Height="50" PlaceHolder="请输入您的评论内容"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="评论" BackColor="#1D81C7" BorderWidth="0px" Font-Bold="False" Font-Size="12pt" ForeColor="White" Height="54px" Width="120px" CssClass="btnSearch" OnClick="BtnSearch_Click"/>
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div class="commentItem">
                            <asp:Image ID="Image1" ImageUrl="~/image/user.jpeg" runat="server" Width="50px" Height="50px" />
                            <span><%#Eval("uName") %></span>
                            <a><%#Eval("time") %></a>
                            <p><%#Eval("cContent") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    
</asp:Content>

