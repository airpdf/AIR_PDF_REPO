<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        欢迎 <strong><%: Page.User.Identity.Name %></strong>!
        [ <%: Html.ActionLink("Logoff", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Login", "LogOn", "Account") %> ]
<%
    }
%>
