

      List PostTypes

      <%=Html.ActionLink("Create new PostType", "PostType", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            PostTypeName
          </td>
          
          <td>
            SortOrder
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
            <%=Html.Encode(obj.PostTypeName) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.SortOrder) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "PostType", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "PostType", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "PostType", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    