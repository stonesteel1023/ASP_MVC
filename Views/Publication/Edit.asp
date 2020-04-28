

      Edit Publication

      <form action="?controller=Publication&action=EditPost" id="EditPost" method="post">
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
              Description
            </td>
            <td>
            
                <%=Html.TextArea("Description", Model.Description, 60, 15)%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              ProjectID
            </td>
            <td>
            
                <%=Html.DropDownList("ProjectID", Model.ProjectID, new ProjectHelper.SelectAll().Items, "Id", "ProjectName")%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              OrganizationID
            </td>
            <td>
            
                <%=Html.DropDownList("OrganizationID", Model.OrganizationID, new OrganizationHelper.SelectAll().Items, "Id", "OrganizationName")%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              CategoryID
            </td>
            <td>
            
                <%=Html.DropDownList("CategoryID", Model.CategoryID, new CategoryHelper.SelectAll().Items, "Id", "CategoryName")%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              PriorityID
            </td>
            <td>
            
                <%=Html.DropDownList("PriorityID", Model.PriorityID, new PriorityHelper.SelectAll().Items, "Id", "PriorityName")%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              StatusID
            </td>
            <td>
            
                <%=Html.DropDownList("StatusID", Model.StatusID, new StatusHelper.SelectAll().Items, "Id", "StatusName")%>
              
            </td>
          </tr>
          

        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "Publication", "List" , "") %> <br/>

      </form>

    