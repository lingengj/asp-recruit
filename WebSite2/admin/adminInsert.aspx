<%@ Page Title="发布招聘" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminInsert.aspx.cs" Inherits="admin_adminInsert" %>

<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/adminInsert.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" Runat="Server">
    <div id="items">
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
            <asp:LinkButton ID="Button1" BackColor="#1D81C7" OnClick="Btn_Insert"  BorderWidth="0px" Font-Bold="true" Font-Size="14px" ForeColor="White" Height="30px" Width="70px" CssClass="InsertBtn" runat="server" Text="发 布" />
        </div>
    </div>
</asp:Content>

