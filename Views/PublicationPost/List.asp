

      List PublicationPosts

      <%=Html.ActionLink("Create new PublicationPost", "PublicationPost", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            PublicationID
          </td>
          
          <td>
            PostText
          </td>
          
          <td>
            PostType
          </td>
          
          <td>
            Author
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
            <%=Html.Encode(obj.PublicationID) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.PostText) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.PostType) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.Author) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "PublicationPost", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "PublicationPost", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "PublicationPost", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    