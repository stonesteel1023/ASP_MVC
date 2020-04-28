

      Edit PostType

      <form action="?controller=PostType&action=EditPost" id="EditPost" method="post">
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
              PostTypeName
            </td>
            <td>
            
                <%=Html.TextBox("PostTypeName", Model.PostTypeName)%>
                <!--Html.TextArea("PostTypeName", Model.PostTypeName, 60, 15)-->
                <!--Html.TextBox("PostTypeName", Model.PostTypeName)-->
                <!--Html.CheckBox("PostTypeName", Model.PostTypeName)-->
                <!--Html.DropDownList("PostTypeName", Model.PostTypeName, new PostTypeNameHelper.SelectAll().Items, "Id", "PostTypeNameName")-->
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
          

        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "PostType", "List" , "") %> <br/>

      </form>

    