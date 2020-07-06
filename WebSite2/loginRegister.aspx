<%@ Page Title="登录注册" Language="C#" AutoEventWireup="true" CodeFile="loginRegister.aspx.cs" Inherits="loginRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/loginRegister.css" type="text/css" rel="stylesheet" />
    <link href="js/jquery-3.3.1.min.js" type="text/javascript" rel="" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="content">
            <div id="left">
                <div id="logo">招 &nbsp;&nbsp;&nbsp;&nbsp; 聘</div>
                <div class="item">
                    <span>沟通</span>
                    <span>在线职位及时沟通</span>
                </div>
                <div class="item">
                    <span>任性选</span>
                    <span>各大行业职位任你选</span>
                </div>
            </div>
            <div id="right">
                <asp:Panel ID="Panel1" runat="server">
                    <div id="login">
                        <span class="title">用户登录</span>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="用户名" Width="296px" Height="40px" CssClass="tb"></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="密码" TextMode="Password" Width="296px" Height="40px" CssClass="tb"></asp:TextBox>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Login_Click" Text="登录" BackColor="#39acf9" ForeColor="White" Font-Size="16px" Width="346px" Height="40px" CssClass="btn" />
                        <div class="bottom">
                            <span>没有账号</span>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Text="立即注册" CausesValidation="False"></asp:LinkButton>
                        </div>
                    </div>
                    <div class="validators">
                        <div class="validator">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入用户名" Width="99px" ForeColor="#CC0000" ControlToValidate="TextBox1" Font-Size="10px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="请输入6~9位字符" Width="99px" ControlToValidate="TextBox1" ValidationExpression=".{6,9}" CssClass="reValidator1" ForeColor="#CC0000" Font-Size="10px"></asp:RegularExpressionValidator>
                        </div>
                        <div class="validator">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="请输入密码" Width="99px" ForeColor="#CC0000" ControlToValidate="TextBox2" Font-Size="10px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="请输入6~9位字符" Width="99px" ControlToValidate="TextBox2" ValidationExpression=".{6,9}" CssClass="reValidator1" ForeColor="#CC0000" Font-Size="10px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel2" Visible="false" runat="server">
                    <div id="register">
                        <span class="title">用户注册</span>
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="用户名" Width="296px" Height="40px" CssClass="tb" Font-Size="12px"></asp:TextBox>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" placeholder="密码" Width="296px" Height="40px" CssClass="tb"></asp:TextBox>
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="手机号" Width="296px" Height="40px" CssClass="tb"></asp:TextBox>
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="Register_Click" Text="注册" BackColor="#39acf9" ForeColor="White" Font-Size="16px" Width="346px" Height="40px" CssClass="btn" />
                        <div class="bottom">
                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Text="直接登录" CausesValidation="False"></asp:LinkButton>
                        </div>
                    </div>
                    <div class="validators">
                        <div class="validator">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入用户名" Width="99px" ForeColor="#CC0000" ControlToValidate="TextBox3" Font-Size="10px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入6~9位字符" Width="99px" ControlToValidate="TextBox3" ValidationExpression=".{6,9}" CssClass="reValidator1" ForeColor="#CC0000" Font-Size="10px"></asp:RegularExpressionValidator>
                        </div>
                        <div class="validator">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入密码" Width="99px" ForeColor="#CC0000" ControlToValidate="TextBox4" Font-Size="10px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="请输入6~9位字符" Width="99px" ControlToValidate="TextBox4" ValidationExpression=".{6,9}" CssClass="reValidator1" ForeColor="#CC0000" Font-Size="10px"></asp:RegularExpressionValidator>
                        </div>
                        <div class="validator">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入手机号" Width="99px" ForeColor="#CC0000" ControlToValidate="TextBox5" Font-Size="10px"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="请输入11位数字的手机号" Width="99px" ControlToValidate="TextBox5" ValidationExpression="[0-9]{11}" CssClass="reValidator1" ForeColor="#CC0000" Font-Size="10px"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
