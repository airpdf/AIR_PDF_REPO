﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<McvTest1.Models.PDF>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    PDFs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Uploaded PDFs</h2>

<p>
    <%: Html.ActionLink("Upload New", "Upload") %>
</p>
<table>
    <tr>
        <th>
            Title
        </th>
        <th>
            Author
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
            <%: Html.DisplayFor(modelItem => item.fileURL) %>
        </td>
        <td>
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ID }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
