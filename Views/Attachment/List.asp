

      List Attachments

      <%=Html.ActionLink("Create new Attachment", "Attachment", "Create" , "") %> 

      <table>
        <tr>
          
          <td>
            ItemPost
          </td>
          
          <td>
            AttachmentContent
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
            <%=Html.Encode(obj.ItemPost) %>
          </td>
          
          <td>
            <%=Html.Encode(obj.AttachmentContent) %>
          </td>
          
          <td>
            <%=Html.ActionLink("Edit", "Attachment", "Edit" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Delete", "Attachment", "Delete" , "id=" + CStr(obj.Id)) %> |
            <%=Html.ActionLink("Details", "Attachment", "Details" , "id=" + CStr(obj.Id)) %>

          </td>
        </tr>
          <% 
        Next
     End If
     %>
      </table>



    