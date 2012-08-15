<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<McvTest1.Models.PDF>>" %>
<%@ Register TagPrefix="tc" Assembly="TallComponents.PDFThumbnail" Namespace="TallComponents.Web.PDF" %>
<script runat="server">
    public Thumbnail thumbnail = new Thumbnail();
    public int mIndex = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        thumbnail.Index = 1;
        thumbnail.DPI = 18;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AIRPDF | Adapt Sharing
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <h2>Uploaded PDFs</h2>


   <form id="Form1" method="post" runat="server">
<% while (mIndex <Model.ToArray().Length) { %>
<%thumbnails.Controls.Clear(); %>
<%thumbnail.Path = "App_Data/" + Model.ToArray()[mIndex].Title; %>
<%thumbnail.URL = Model.ToArray()[mIndex].fileURL; %>
<%thumbnails.Controls.Add(thumbnail); %>
<table style="width:100%;height:100%;">
<tr>
<td style="border-color:Grey;background-color:#5c87b2;color:White;font-weight:bold;width:16%;"  align="center">
<%: Html.DisplayFor(modelItem => Model.ToArray()[mIndex].Title)%>
</td>
<td style="border-color:Grey;background-color:#5c87b2;color:White;font-weight:bold;width:16%;"  align="center">
<%if ((mIndex + 1) < Model.ToArray().Length) %>
<%: Html.DisplayFor(modelItem => Model.ToArray()[mIndex+1].Title)%>
</td>
<td style="border-color:Grey;background-color:#5c87b2;color:White;font-weight:bold;width:16%;"  align="center">
<%if ((mIndex + 2) < Model.ToArray().Length) %>
<%: Html.DisplayFor(modelItem => Model.ToArray()[mIndex+2].Title)%>
</td>
</tr>
<tr>
<td align="center">
      <asp:Panel ID="thumbnails" runat="server" />
      <%= String.Format("<b>Uploaded by: " + Model.ToArray()[mIndex].Author + "</b>", "")%>
            <br />
            <%: Html.DisplayFor(modelItem => Model.ToArray()[mIndex].uploadTime)%>
            <br />
  </td>
  <td align="center">
<%if ((mIndex + 1) < Model.ToArray().Length)
  {%>
  <%thumbnails2.Controls.Clear(); %>
<%thumbnail.Path = "App_Data/" + Model.ToArray()[mIndex + 1].Title; %>
<%thumbnail.URL = Model.ToArray()[mIndex + 1].fileURL; %>
<%thumbnails2.Controls.Add(thumbnail); %>
        <asp:Panel ID="thumbnails2" runat="server" />
      <%= String.Format("<b>Uploaded by: " + Model.ToArray()[mIndex + 1].Author + "</b>", "")%>
            <br />
            <%: Html.DisplayFor(modelItem => Model.ToArray()[mIndex + 1].uploadTime)%>
            <br />    
            <%} %>
 </td>

<td align="center">
<%if ((mIndex + 2) < Model.ToArray().Length)
  {%>
  <%thumbnails3.Controls.Clear(); %>
<%thumbnail.Path = "App_Data/" + Model.ToArray()[mIndex + 2].Title; %>
<%thumbnail.URL = Model.ToArray()[mIndex + 2].fileURL; %>
<%thumbnails3.Controls.Add(thumbnail); %>
        <asp:Panel ID="thumbnails3" runat="server" />
      <%= String.Format("<b>Uploaded by: " + Model.ToArray()[mIndex + 2].Author + "</b>", "")%>
            <br />
            <%: Html.DisplayFor(modelItem => Model.ToArray()[mIndex + 2].uploadTime)%>
            <br />    
            <%} %>
 </td>
</tr>
</table>
<br />
<br />
<%mIndex += 3; %>
<% } %>
  </form>

</asp:Content>
