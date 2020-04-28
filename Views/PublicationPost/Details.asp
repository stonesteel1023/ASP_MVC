

      Details on PublicationPost

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
          </td>
        </tr>
        
        <tr>
          <td>
            PublicationID
          </td>
          <td>
            <%=Html.Encode(Model.PublicationID)%>
          </td>
        </tr>
        
        <tr>
          <td>
            PostText
          </td>
          <td>
            <%=Html.Encode(Model.PostText)%>
          </td>
        </tr>
        
        <tr>
          <td>
            PostType
          </td>
          <td>
            <%=Html.Encode(Model.PostType)%>
          </td>
        </tr>
        
        <tr>
          <td>
            Author
          </td>
          <td>
            <%=Html.Encode(Model.Author)%>
          </td>
        </tr>
        
      </table>
      <%=Html.ActionLink("Back to list", "PublicationPost", "List" , "") %> <br/>


    