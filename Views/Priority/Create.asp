

      Create Priority

      <form action="?controller=Priority&action=CreatePost" id="CreatePost" method="post">
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
                PriorityName
              </td>
              <td>
              
                  <%=Html.TextBox("PriorityName", Model.PriorityName)%>
                  <!--Html.TextArea("PriorityName", Model.PriorityName, 60, 15)-->
                  <!--Html.TextBox("PriorityName", Model.PriorityName)-->
                  <!--Html.CheckBox("PriorityName", Model.PriorityName)-->
                  <!--Html.DropDownList("PriorityName", Model.PriorityName, new PriorityNameHelper.SelectAll().Items, "Id", "PriorityNameName")-->
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
                SCCClass
              </td>
              <td>
              
                  <%=Html.TextBox("SCCClass", Model.SCCClass)%>
                  <!--Html.TextArea("SCCClass", Model.SCCClass, 60, 15)-->
                  <!--Html.TextBox("SCCClass", Model.SCCClass)-->
                  <!--Html.CheckBox("SCCClass", Model.SCCClass)-->
                  <!--Html.DropDownList("SCCClass", Model.SCCClass, new SCCClassHelper.SelectAll().Items, "Id", "SCCClassName")-->
                  <!--String-->
                
              </td>
              </tr>
            
            <tr>
              <td>
                BGColor
              </td>
              <td>
              
                  <%=Html.TextBox("BGColor", Model.BGColor)%>
                  <!--Html.TextArea("BGColor", Model.BGColor, 60, 15)-->
                  <!--Html.TextBox("BGColor", Model.BGColor)-->
                  <!--Html.CheckBox("BGColor", Model.BGColor)-->
                  <!--Html.DropDownList("BGColor", Model.BGColor, new BGColorHelper.SelectAll().Items, "Id", "BGColorName")-->
                  <!--String-->
                
              </td>
              </tr>
            
        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "Priority", "List" , "") %> <br/>

      </form>

    