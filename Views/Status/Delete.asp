

      Delete Status

      <form action="?controller=Status&action=DeletePost" id="DeletePost" method="post">
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
              StatusName
            </td>
            <td>
               <%=Html.Encode(Model.StatusName)%>
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
          
          <tr>
            <td>
              CSSClass
            </td>
            <td>
               <%=Html.Encode(Model.CSSClass)%>
            </td>
          </tr>
          
          <tr>
            <td>
              isDefault
            </td>
            <td>
               <%=Html.Encode(Model.isDefault)%>
            </td>
          </tr>
          
        </table>
        <button type="submit">Submit</button>
         <%=Html.ActionLink("Back to list", "Status", "List" , "") %> <br/>
      </form>

    