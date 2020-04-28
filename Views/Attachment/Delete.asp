

      Delete Attachment

      <form action="?controller=Attachment&action=DeletePost" id="DeletePost" method="post">
        <table>
          <tr>
            <td>id</td>
            <td>
               <%=Html.Encode(Model.Id)%>
               <%=Html.Hidden("id",Model.Id) %>
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
        <button type="submit">Submit</button>
         <%=Html.ActionLink("Back to list", "Attachment", "List" , "") %> <br/>
      </form>

    