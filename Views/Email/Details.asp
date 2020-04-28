

      Details on Email

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
          </td>
        </tr>
        
        <tr>
          <td>
            FromAddress
          </td>
          <td>
            <%=Html.Encode(Model.FromAddress)%>
          </td>
        </tr>
        
        <tr>
          <td>
            ToAddress
          </td>
          <td>
            <%=Html.Encode(Model.ToAddress)%>
          </td>
        </tr>
        
        <tr>
          <td>
            Subject
          </td>
          <td>
            <%=Html.Encode(Model.Subject)%>
          </td>
        </tr>
        
        <tr>
          <td>
            Body
          </td>
          <td>
            <%=Html.Encode(Model.Body)%>
          </td>
        </tr>
        
        <tr>
          <td>
            Incomming
          </td>
          <td>
            <%=Html.Encode(Model.Incomming)%>
          </td>
        </tr>
        
      </table>
      <%=Html.ActionLink("Back to list", "Email", "List" , "") %> <br/>


    