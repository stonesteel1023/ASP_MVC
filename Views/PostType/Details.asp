

      Details on PostType

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
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
      <%=Html.ActionLink("Back to list", "PostType", "List" , "") %> <br/>


    