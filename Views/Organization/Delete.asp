

      Delete Organization

      <form action="?controller=Organization&action=DeletePost" id="DeletePost" method="post">
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
              OrganizationName
            </td>
            <td>
               <%=Html.Encode(Model.OrganizationName)%>
            </td>
          </tr>
          
          <tr>
            <td>
              Description
            </td>
            <td>
               <%=Html.Encode(Model.Description)%>
            </td>
          </tr>
          
          <tr>
            <td>
              Active
            </td>
            <td>
               <%=Html.Encode(Model.Active)%>
            </td>
          </tr>
          
          <tr>
            <td>
              isExternal
            </td>
            <td>
               <%=Html.Encode(Model.isExternal)%>
            </td>
          </tr>
          
        </table>
        <button type="submit">Submit</button>
         <%=Html.ActionLink("Back to list", "Organization", "List" , "") %> <br/>
      </form>

    