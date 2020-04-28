

      Details on Category

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
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
      <%=Html.ActionLink("Back to list", "Category", "List" , "") %> <br/>


    