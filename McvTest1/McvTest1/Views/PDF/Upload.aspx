<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Upload
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<h2>Upload</h2>

<form action="upload" method="post" enctype="multipart/form-data">
  <input type="file" name="FileUpload1" accept=".pdf" /><br />
  &nbsp;<input type="submit" name="Submit" id="Submit" value="Upload" /></form>
<p>
    <%: Html.ActionLink("Return", "Index") %>
</p>
</asp:Content>
