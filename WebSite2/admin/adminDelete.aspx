<%@ Page Title="删除招聘" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminDelete.aspx.cs" Inherits="admin_adminDelete" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/adminDelete.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="right" ContentPlaceHolderID="right" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [name] FROM [position] WHERE ([name] LIKE '%' + @name + '%') ORDER BY [id] DESC" DeleteCommand="DELETE FROM [position] WHERE [id] = @original_id" InsertCommand="INSERT INTO [position] ([id], [name]) VALUES (@id, @name)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [position] SET [name] = @name WHERE [id] = @original_id AND [name] = @original_name">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="%" Name="name" QueryStringField="key" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div id="search">
        <asp:TextBox PlaceHolder="输入职位关键词：如 Java等" ID="tbContent" runat="server"  ForeColor="Black" BorderWidth="0px" Height="40px" Width="580px" CssClass="tbContent"  ></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="搜索" BackColor="#1D81C7" BorderWidth="0px" Font-Bold="False" Font-Size="12pt" ForeColor="White" Height="44px" Width="80px" CssClass="btnSearch" OnClick="Btn_SearchClick" />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" Width="800px" DataKeyNames="id" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting">
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
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete"  OnClientClick="return confirm('你确定要删除吗')" runat="server" CssClass="delBtn">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="pageNum" Font-Underline="False" Font-Size="14px" />
    </asp:GridView>
</asp:Content>
