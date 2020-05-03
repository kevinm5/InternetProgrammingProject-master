<%@ Page Title="" Language="C#" MasterPageFile="~/AuthenticatedMasterPage.master" AutoEventWireup="true" CodeFile="Notes.aspx.cs" Inherits="Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="badPullLabel" runat="server" Text="Something went wrong getting your notes!" Visible="False"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" 
        DataKeyNames="Note_ID" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="4">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:TemplateField HeaderText="Title" SortExpression="Note_Title">
            <EditItemTemplate>
                <asp:TextBox ID="NoteTitleEditTextbox" runat="server" Text='<%# Bind("Note_Title") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEditNoteTitle" runat="server" ErrorMessage="Notes must have a title!" Text="*"
                    ForeColor="Red" ControlToValidate="NoteTitleEditTextbox"></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Note_Title") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Body" SortExpression="Note_Text">
            <EditItemTemplate>
                <asp:TextBox ID="NoteTextEditTextbox" runat="server" TextMode="MultiLine" Text='<%# Bind("Note_Text") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEditNoteText" runat="server" ErrorMessage="Notes cannot be empty!" Text="*"
                    ForeColor="Red" ControlToValidate="NoteTextEditTextbox"></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Note_Text") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InternetProgrammingProjectConnectionString2 %>" 
    SelectCommand="SELECT * FROM [Note] WHERE ([FK_User_ID] = @FK_User_ID)" 
    DeleteCommand="DELETE FROM [Note] WHERE [Note_ID] = @Note_ID" 
    UpdateCommand="UPDATE [Note] SET [Note_Title] = @Note_Title, [Note_Text] = @Note_Text WHERE [Note_ID] = @Note_ID">
    <DeleteParameters>
        <asp:Parameter Name="Note_ID" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="FK_User_ID" SessionField="userid" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Note_ID" Type="Int32" />
        <asp:Parameter Name="Note_Title" Type="String" />
        <asp:Parameter Name="FK_User_ID" Type="Int32" />
        <asp:Parameter Name="Note_Text" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" CssClass="auto-style1 " Width="500px" />
    <br />
    <asp:Label ID="InsertNoteSectionLabel" runat="server" Text="Create a new note with the text boxes below!" CssClass="auto-style1" ></asp:Label>
    <br />
    <asp:Label ID="NoteTitleLabel" runat="server" Text="Title" CssClass="auto-style1" ></asp:Label>
    <br />
    <asp:TextBox ID="NoteTitleTextbox" runat="server" CssClass="auto-style1" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvNoteTitle" runat="server" ErrorMessage="Notes must have a title!" Text="*" ForeColor="Red" 
        ValidationGroup="InsertGroup" ControlToValidate="NoteTitleTextbox"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="NoteTextLabel" runat="server" Text="Body" CssClass="auto-style1" ></asp:Label>
    <br />
    <asp:TextBox ID="NoteTextTextbox" runat="server" TextMode="MultiLine" CssClass="auto-style1" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Notes cannot be empty!" Text="*" ForeColor="Red" 
        ValidationGroup="InsertGroup" ControlToValidate="NoteTextTextbox"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="InsertButton" OnClick="InsertButton_Click" runat="server" Text="Save" CssClass="auto-style1" ValidationGroup="InsertGroup" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="InsertGroup" ForeColor="Red" CssClass="auto-style1" Width="500px" />
    </asp:Content>

