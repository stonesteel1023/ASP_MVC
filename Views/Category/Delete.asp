

      Delete Category

      <form action="?controller=Category&action=DeletePost" id="DeletePost" method="post">
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
              CategoryName
            </td>
            <td>
               <%=Html.Encode(Model.CategoryName)%>
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
         <%=Html.ActionLink("Back to list", "Category", "List" , "") %> <br/>
      </form>

    