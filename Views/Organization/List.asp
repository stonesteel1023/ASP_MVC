

      List Organizations

      <%=Html.ActionLink("Create new Organization", "Organization", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            OrganizationName
          </td>
          
          <td>
            Description
          </td>
          
          <td>
            Active
          </td>
          
          <td>
            isExternal
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
            <%=Html.Encode(obj.OrganizationName) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.Description) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.Active) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.isExternal) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Organization", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Organization", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Organization", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    