<%@ Page Title="" Language="C#" MasterPageFile="~/AuthenticatedMasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="SqlDataSource1" Height="174px" ShowFooter="True">
        <columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="User_ID" InsertVisible="False" SortExpression="User_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="linkButton1" OnClick="lbInsert_Click" runat="server" ValidationGroup="InsertGroup" >Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User_Username" SortExpression="User_Username">
                <EditItemTemplate>
                    <asp:TextBox ID="EditUsernameTextbox" runat="server" Text='<%# Bind("User_Username") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditUsername" runat="server" ErrorMessage="Username is required" Text="*"
                        ForeColor="Red" ControlToValidate="EditUsernameTextbox"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_Username") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                <asp:TextBox ID= "txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvInsertUsername" runat="server" ErrorMessage="Username is required" Text="*"
                    ForeColor="Red" ControlToValidate="txtName" ValidationGroup="InsertGroup" ></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User_Password" SortExpression="User_Password">
                <EditItemTemplate>
                    <asp:TextBox ID="EditPasswordTextbox" runat="server" Text='<%# Bind("User_Password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" ErrorMessage="Password is required" Text="*"
                        ForeColor="Red" ControlToValidate="EditPasswordTextbox"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EditPasswordTextbox" Text="*"
                        ErrorMessage="Password must be at least 8 characters in length, no more than 15 characters, and include at least one upper and lowercase letter. and one number" 
                        ForeColor="#CC0000" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("User_Password") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                <asp:TextBox ID= "txtPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInsertPassword" runat="server" ErrorMessage="Password is required" Text="*"
                        ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="InsertGroup" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" Text="*"
                        ErrorMessage="Password must be at least 8 characters in length, no more than 15 characters, and include at least one upper and lowercase letter. and one number" 
                        ForeColor="#CC0000" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$" ValidationGroup="InsertGroup" ></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
        </columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InternetProgrammingProjectConnectionString2 %>" DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [User] ([User_Username], [User_Password]) VALUES (@User_Username, @User_Password)" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [User_Username] = @User_Username, [User_Password] = @User_Password WHERE [User_ID] = @User_ID">
        <deleteparameters>
            <asp:Parameter Name="User_ID" Type="Int32" />
        </deleteparameters>
        <insertparameters>
            <asp:Parameter Name="User_Username" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
        </insertparameters>
        <updateparameters>
            <asp:Parameter Name="User_Username" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
            <asp:Parameter Name="User_ID" Type="Int32" />
        </updateparameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="InsertGroup" />
</asp:Content>
