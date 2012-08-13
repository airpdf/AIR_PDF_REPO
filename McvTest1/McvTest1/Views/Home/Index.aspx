<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<McvTest1.Models.PDF>>" %>
<%@ Register TagPrefix="tc" Assembly="TallComponents.PDFThumbnail" Namespace="TallComponents.Web.PDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    主页
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <h2>Uploaded PDFs</h2>

<table>
    <tr>
        <th>
            Title
        </th>
        <th>
            Uploader
        </th>
        <th>
            uploadTime
        </th>
        <th>
            Action
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Title) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Author) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.uploadTime) %>
        </td>
        <td>
            <%= String.Format("<a href=\"{0}\">View</a>", item.fileURL) %>
        </td>
    </tr>
<% } %>

</table>

<form id="Form1" method="post" runat="server">
      <tc:thumbnail path="App_Data/testPDF.pdf" 
                    index="1"
                    runat="server" 
                    borderwidth="1"
                    bordercolor="gray"
                    dpi="12" />
    </form>

</asp:Content>
