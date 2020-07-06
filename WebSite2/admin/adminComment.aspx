<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminComment.aspx.cs" Inherits="admin_adminComment" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/adminDelete.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="right" ContentPlaceHolderID="right" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [id], [cContent] FROM [comment] ORDER BY [id] DESC" 
        DeleteCommand="DELETE FROM [comment] WHERE [id] = @original_id AND [cContent] = @original_cContent" 
        InsertCommand="INSERT INTO [comment] ([cContent]) VALUES (@cContent)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [comment] SET [cContent] = @cContent WHERE [id] = @original_id AND [cContent] = @original_cContent" 
        ConflictDetection="CompareAllValues">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_cContent" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="cContent" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cContent" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_cContent" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="cList">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" Width="800px" DataKeyNames="id" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="cContent" SortExpression="cContent">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cContent") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("cContent") %>' CssClass="cName"></asp:Label>
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
    </div>
</asp:Content>


