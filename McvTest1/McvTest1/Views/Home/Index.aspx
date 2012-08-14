<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<McvTest1.Models.PDF>>" %>
<%@ Register TagPrefix="tc" Assembly="TallComponents.PDFThumbnail" Namespace="TallComponents.Web.PDF" %>
<script runat="server">
    public Thumbnail thumbnail = new Thumbnail();
    protected void Page_Load(object sender, EventArgs e)
    {
        thumbnail.Index = 1;
        thumbnail.DPI = 18;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    主页
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <h2>Uploaded PDFs</h2>


   <form id="Form1" method="post" runat="server">
<% foreach (var item in Model) { %>
<%thumbnails.Controls.Clear(); %>
<%thumbnail.Path = "App_Data/" + item.Title; %>
<%thumbnails.Controls.Add(thumbnail); %>
<table>
<tr>
<th>
<%: Html.DisplayFor(modelItem => item.Title) %>
</th>
<th></th>
</tr>
<tr>
<td>
      <asp:Panel ID="thumbnails" runat="server" />
  </td>
  <td>
            <%= String.Format("<b>Uploaded by: "+item.Author+"</b>", "") %>
            <br />
            <%: Html.DisplayFor(modelItem => item.uploadTime) %>
            <br />
            <%= String.Format("<a href=\"{0}\">View</a>", item.fileURL) %>
            <br />
 </td>
</tr>
</table>
<br />
<br />
<% } %>
  </form>



</asp:Content>
