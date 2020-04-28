

      List Publications

      <%=Html.ActionLink("Create new Publication", "Publication", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            Description
          </td>
          
          <td>
            ProjectID
          </td>
          
          <td>
            OrganizationID
          </td>
          
          <td>
            CategoryID
          </td>
          
          <td>
            PriorityID
          </td>
          
          <td>
            StatusID
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
            <%=Html.Encode(obj.Description) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.ProjectID) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.OrganizationID) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.CategoryID) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.PriorityID) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.StatusID) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Publication", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Publication", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Publication", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    