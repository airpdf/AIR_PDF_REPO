<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    关于我们
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>关于</h2>
    <table border="1" cellpadding="0" cellspacing="0" style="width:190mm;" >
           <tr>
            <td colspan="3"  align="left">If an Insured Person requires Hospitalization in a Hospital in Singapore as a result of an Accident or an Illness, we shall pay a Daily Cash Benefit as set out below:</td>            
            <td style="border:none;border-right:solid 1px black">&nbsp;</td>
            <td style="border:none">&nbsp;</td>
            <td colspan="3"  align="left">We shall also pay the Get Well Benefit as set out below subject to a
maximum of one payment for the same Accident or Illness from the same
confirmed diagnosis:</td>
        </tr>
        <tr>
            <td style="border-color:Black;background-color:Black;color:White;font-weight:bold;width:16%;" colspan="3" align="center">Daily Cash Benefit</td>            
            <td style="border:none;border-right:solid 1px black">&nbsp;</td>
            <td style="border:none">&nbsp;</td>
            <td style="border-color:Black;background-color:Black;color:White;font-weight:bold;width:16%;" colspan="3"  align="center">Get Well Benefit</td>    
        </tr>
        <tr>
            <td style="border-color:Black;background-color:silver;color:Black;font-weight:bold;width:16%;" align="center">Preferred</td>            
            <td style="border-left:none;border-color:Black;background-color:silver;color:Black;font-weight:bold;width:16%;" align="center">Advantage</td>                        
            <td style="border-left:none;border-color:Black;background-color:silver;color:Black;font-weight:bold;width:16%;" align="center">Basic</td>    
            <td style="border:none;border-right:solid 1px black">&nbsp;</td>
            <td style="border:none">&nbsp;</td>
            <td style="border-color:Black;background-color:silver;color:Black;font-weight:bold;width:16%;" align="center">Preferred</td>            
            <td style="border-left:none;border-color:Black;background-color:silver;color:Black;font-weight:bold;width:16%;" align="center">Advantage</td>                        
            <td style="border-left:none;border-color:Black;background-color:silver;color:Black;font-weight:bold;width:16%;" align="center">Basic</td>    
        </tr>
        <tr>
            <td style="border:solid 1px black;border-top:none;"  align="center">$150 per day</td>            
            <td style="border:solid 1px black;border-left:none;border-top:none;" align="center">$100 per day</td>                        
            <td style="border:solid 1px black;border-left:none;border-top:none;"  align="center">$50 per day</td>    
            <td style="border:none;border-right:solid 1px black">&nbsp;</td>
            <td style="border:none">&nbsp;</td>
            <td style="border:solid 1px black;border-top:none;"  align="center">$300</td>            
            <td style="border:solid 1px black;border-left:none;border-top:none;" align="center">$250</td>                        
            <td style="border:solid 1px black;border-left:none;border-top:none;"  align="center">$100</td>    
        </tr>
        <tr>
        <td colspan="3" style="font-size:small;">Maximum of 365 days for the same Accident or Illness from the same confirmed diagnosis.
This benefit is not payable for Day surgery in clinics.
        </td>
        <td style="border:none;border-right:solid 1px black"></td>
        <td colspan="4">
        </td>
        </tr>
    </table>
</asp:Content>
