<%@ Page Title="更新招聘" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminUpdate.aspx.cs" Inherits="admin_adminUpdate" %>

<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/adminUpdate.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [position] WHERE ([name] LIKE '%' + @name + '%') ORDER BY [id] DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="%" Name="name" QueryStringField="key" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="server">
        <div id="search">
            <asp:TextBox PlaceHolder="输入职位关键词：如 Java等" ID="tbContent" runat="server"  ForeColor="Black" BorderWidth="0px" Height="40px" Width="580px" CssClass="tbContent"  ></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="搜索" BackColor="#1D81C7" BorderWidth="0px" Font-Bold="False" Font-Size="12pt" ForeColor="White" Height="44px" Width="80px" CssClass="btnSearch" OnClick="Btn_SearchClick" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" ShowHeader="False" Width="800px">
            <Columns>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" CssClass="pName" NavigateUrl='<%# "~/position.aspx?id="+Eval("id") %>' Text='<%# Eval("name") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton Text="编辑" runat="server" OnClick="Btn_Edit" CommandArgument='<%#Eval("id") %>' CssClass="editBtn" BorderWidth="0px"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pageNum" Font-Size="14px" />
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        <div class="item">
            <span>职位名称：</span>
            <asp:TextBox ID="tbName" runat="server" Width="260px"></asp:TextBox>
        </div>
        <div class="item">
            <span>月均工资：</span>
            <asp:TextBox ID="tbSalary" runat="server" Width="260px"></asp:TextBox>
        </div>
        <div class="item">
            <span>公司名称：</span>
            <asp:DropDownList ID="dlComName" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name" Width="141px"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name] FROM [company]"></asp:SqlDataSource>
        </div>
        <div class="item">
            <span>工作地点：</span>
            <asp:DropDownList ID="dlPlace" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="name" Width="141px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name] FROM [city]"></asp:SqlDataSource>
        </div>
        <div class="item">
            <span>职位种类：</span>
            <asp:DropDownList ID="dlSort" runat="server" DataSourceID="SqlDataSource3" DataTextField="sort" DataValueField="sort" Width="141px">
            </asp:DropDownList>
        </div>
        <div class="item">
            <span>职位描述：</span>
            <ce:editor ID="ceDesc" runat="server" Width="695px"></ce:editor>
        </div>
        <div class="item">
            <span>学历要求：</span>
            <asp:RadioButtonList ID="rblAca" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>大专</asp:ListItem>
                <asp:ListItem>本科</asp:ListItem>
                <asp:ListItem>硕士</asp:ListItem>
                <asp:ListItem>博士</asp:ListItem>
                <asp:ListItem>不要求</asp:ListItem>
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT sort FROM position"></asp:SqlDataSource>
        </div>
        <div class="item">
            <span>经验要求：</span>
            <asp:RadioButtonList ID="rblExp" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>应届毕业生</asp:ListItem>
                <asp:ListItem>1-3年</asp:ListItem>
                <asp:ListItem>3-5年</asp:ListItem>
                <asp:ListItem>5-10年</asp:ListItem>
                <asp:ListItem>10年以上</asp:ListItem>
                <asp:ListItem>经验不限</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="item">
            <span>福利待遇：</span>
            <asp:CheckBoxList ID="cklTag" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>五险一金</asp:ListItem>
                <asp:ListItem>医疗保险</asp:ListItem>
                <asp:ListItem>定期体检</asp:ListItem>
                <asp:ListItem>年终奖励</asp:ListItem>
                <asp:ListItem>股票期权</asp:ListItem>
                <asp:ListItem>带薪年假</asp:ListItem>
            </asp:CheckBoxList>
        </div>
        <div id="btns">
            <asp:LinkButton ID="Button1" BackColor="#1D81C7" OnClick="Btn_Update" BorderWidth="0px" Font-Bold="True" Font-Size="14px" ForeColor="White" Height="30px" Width="70px" CssClass="updateBtn" runat="server" Text="更 新" />
            <asp:LinkButton ID="Button2" BackColor="#1D81C7" OnClick="Btn_Exit" BorderWidth="0px" Font-Bold="True" Font-Size="14px" ForeColor="White" Height="30px" Width="70px" CssClass="updateBtn" runat="server" Text="取 消" />
        </div>
    </asp:Panel>
</asp:Content>

