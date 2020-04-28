

      Delete PostType

      <form action="?controller=PostType&action=DeletePost" id="DeletePost" method="post">
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
              PostTypeName
            </td>
            <td>
               <%=Html.Encode(Model.PostTypeName)%>
            </td>
          </tr>
          
          <tr>
            <td>
              SortOrder
            </td>
            <td>
               <%=Html.Encode(Model.SortOrder)%>
            </td>
          </tr>
          
        </table>
        <button type="submit">Submit</button>
         <%=Html.ActionLink("Back to list", "PostType", "List" , "") %> <br/>
      </form>

    