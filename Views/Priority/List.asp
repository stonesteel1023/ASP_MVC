

      List Prioritys

      <%=Html.ActionLink("Create new Priority", "Priority", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            PriorityName
          </td>
          
          <td>
            SortOrder
          </td>
          
          <td>
            SCCClass
          </td>
          
          <td>
            BGColor
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
            <%=Html.Encode(obj.PriorityName) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.SortOrder) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.SCCClass) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.BGColor) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Priority", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Priority", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Priority", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    