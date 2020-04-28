

      Create Organization

      <form action="?controller=Organization&action=CreatePost" id="CreatePost" method="post">
        <table>
          <tr>
            <td>id</td>
            <td>
              <%=Html.Encode("New")%>
              <%=Html.Hidden("id",0) %>
            </td>
          </tr>
          
            <tr>
              <td>
                OrganizationName
              </td>
              <td>
              
                  <%=Html.TextBox("OrganizationName", Model.OrganizationName)%>
                  <!--Html.TextArea("OrganizationName", Model.OrganizationName, 60, 15)-->
                  <!--Html.TextBox("OrganizationName", Model.OrganizationName)-->
                  <!--Html.CheckBox("OrganizationName", Model.OrganizationName)-->
                  <!--Html.DropDownList("OrganizationName", Model.OrganizationName, new OrganizationNameHelper.SelectAll().Items, "Id", "OrganizationNameName")-->
                  <!--String-->
                
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
                Active
              </td>
              <td>
              
                  <%=Html.CheckBox("Active", Model.Active)%>
                
              </td>
              </tr>
            
            <tr>
              <td>
                isExternal
              </td>
              <td>
              
                  <%=Html.CheckBox("isExternal", Model.isExternal)%>
                
              </td>
              </tr>
            
        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "Organization", "List" , "") %> <br/>

      </form>

    