

      List Statuss

      <%=Html.ActionLink("Create new Status", "Status", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            StatusName
          </td>
          
          <td>
            SortOrder
          </td>
          
          <td>
            CSSClass
          </td>
          
          <td>
            isDefault
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
            <%=Html.Encode(obj.StatusName) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.SortOrder) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.CSSClass) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.isDefault) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Status", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Status", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Status", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    