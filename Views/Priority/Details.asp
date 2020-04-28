

      Details on Priority

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
          </td>
        </tr>
        
        <tr>
          <td>
            PriorityName
          </td>
          <td>
            <%=Html.Encode(Model.PriorityName)%>
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
            SCCClass
          </td>
          <td>
            <%=Html.Encode(Model.SCCClass)%>
          </td>
        </tr>
        
        <tr>
          <td>
            BGColor
          </td>
          <td>
            <%=Html.Encode(Model.BGColor)%>
          </td>
        </tr>
        
      </table>
      <%=Html.ActionLink("Back to list", "Priority", "List" , "") %> <br/>


    