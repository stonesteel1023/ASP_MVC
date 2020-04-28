

      List Categorys

      <%=Html.ActionLink("Create new Category", "Category", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            CategoryName
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
            <%=Html.Encode(obj.CategoryName) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.SortOrder) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Category", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Category", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Category", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    