

      List Emails

      <%=Html.ActionLink("Create new Email", "Email", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            FromAddress
          </td>
          
          <td>
            ToAddress
          </td>
          
          <td>
            Subject
          </td>
          
          <td>
            Body
          </td>
          
          <td>
            Incomming
          </td>
          
          <td></td>
        </tr>

        <%
    if  IsNothing(Model) then
        %> <tr>
          <td colspan="4">No records</td>
        </tr><%
    Else
        Dim obj
        For each obj in Model.Items
        %>

        <tr>
          
          <td>
            <%=Html.Encode(obj.FromAddress) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.ToAddress) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.Subject) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.Body) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.Incomming) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Email", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Email", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Email", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    