<%@ Page Title="管理员首页" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminDefault.aspx.cs" Inherits="admin_adminDefault" %>


<%-- 在此处添加内容控件 --%>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/adminDefault.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="right" ContentPlaceHolderID="right" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [name] FROM [position] WHERE ([name] LIKE '%' + @name + '%') ORDER BY [id] DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="%" Name="name" QueryStringField="key" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="search">
        <asp:TextBox PlaceHolder="输入职位关键词：如 Java等" ID="tbContent" runat="server"  ForeColor="Black" BorderWidth="0px" Height="40px" Width="580px" CssClass="tbContent"  ></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="搜索" BackColor="#1D81C7" BorderWidth="0px" Font-Bold="False" Font-Size="12pt" ForeColor="White" Height="44px" Width="80px" CssClass="btnSearch" OnClick="Btn_SearchClick" />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" Width="800px">
        <Columns>
            <asp:TemplateField HeaderText="name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink6" CssClass="pName" runat="server" NavigateUrl='<%# "~/position.aspx?id="+Eval("id") %>' Text='<%# Eval("name") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="pageNum" Font-Underline="False" Font-Size="14px" />
    </asp:GridView>
</asp:Content>