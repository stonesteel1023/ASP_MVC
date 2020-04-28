

      Create Status

      <form action="?controller=Status&action=CreatePost" id="CreatePost" method="post">
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
                StatusName
              </td>
              <td>
              
                  <%=Html.TextBox("StatusName", Model.StatusName)%>
                  <!--Html.TextArea("StatusName", Model.StatusName, 60, 15)-->
                  <!--Html.TextBox("StatusName", Model.StatusName)-->
                  <!--Html.CheckBox("StatusName", Model.StatusName)-->
                  <!--Html.DropDownList("StatusName", Model.StatusName, new StatusNameHelper.SelectAll().Items, "Id", "StatusNameName")-->
                  <!--String-->
                
              </td>
              </tr>
            
            <tr>
              <td>
                SortOrder
              </td>
              <td>
              
                  <%=Html.TextBox("SortOrder", Model.SortOrder)%>
                  <!--Html.TextArea("SortOrder", Model.SortOrder, 60, 15)-->
                  <!--Html.TextBox("SortOrder", Model.SortOrder)-->
                  <!--Html.CheckBox("SortOrder", Model.SortOrder)-->
                  <!--Html.DropDownList("SortOrder", Model.SortOrder, new SortOrderHelper.SelectAll().Items, "Id", "SortOrderName")-->
                  <!--Integer-->
                
              </td>
              </tr>
            
            <tr>
              <td>
                CSSClass
              </td>
              <td>
              
                  <%=Html.TextBox("CSSClass", Model.CSSClass)%>
                  <!--Html.TextArea("CSSClass", Model.CSSClass, 60, 15)-->
                  <!--Html.TextBox("CSSClass", Model.CSSClass)-->
                  <!--Html.CheckBox("CSSClass", Model.CSSClass)-->
                  <!--Html.DropDownList("CSSClass", Model.CSSClass, new CSSClassHelper.SelectAll().Items, "Id", "CSSClassName")-->
                  <!--String-->
                
              </td>
              </tr>
            
            <tr>
              <td>
                isDefault
              </td>
              <td>
              
                  <%=Html.CheckBox("isDefault", Model.isDefault)%>
                
              </td>
              </tr>
            
        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "Status", "List" , "") %> <br/>

      </form>

    