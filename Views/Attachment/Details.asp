

      Details on Attachment

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
          </td>
        </tr>
        
        <tr>
          <td>
            ItemPost
          </td>
          <td>
            <%=Html.Encode(Model.ItemPost)%>
          </td>
        </tr>
        
        <tr>
          <td>
            AttachmentContent
          </td>
          <td>
            <%=Html.Encode(Model.AttachmentContent)%>
          </td>
        </tr>
        
      </table>
      <%=Html.ActionLink("Back to list", "Attachment", "List" , "") %> <br/>


    