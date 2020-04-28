

      Details on Publication

      <table>
        <tr>
          <td>id</td>
          <td>
            <%=Html.Encode(Model.Id)%>
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
            ProjectID
          </td>
          <td>
            <%=Html.Encode(Model.ProjectID)%>
          </td>
        </tr>
        
        <tr>
          <td>
            OrganizationID
          </td>
          <td>
            <%=Html.Encode(Model.OrganizationID)%>
          </td>
        </tr>
        
        <tr>
          <td>
            CategoryID
          </td>
          <td>
            <%=Html.Encode(Model.CategoryID)%>
          </td>
        </tr>
        
        <tr>
          <td>
            PriorityID
          </td>
          <td>
            <%=Html.Encode(Model.PriorityID)%>
          </td>
        </tr>
        
        <tr>
          <td>
            StatusID
          </td>
          <td>
            <%=Html.Encode(Model.StatusID)%>
          </td>
        </tr>
        
      </table>
      <%=Html.ActionLink("Back to list", "Publication", "List" , "") %> <br/>
      
      <%=Html.RenderControllerAction("PublicationPost","ListByPublicationID", PrepareVariables ( Array("PublicationID="+CStr(Model.Id)))) %>


    