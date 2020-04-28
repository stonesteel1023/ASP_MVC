

      Edit Category

      <form action="?controller=Category&action=EditPost" id="EditPost" method="post">
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
              CategoryName
            </td>
            <td>
            
                <%=Html.TextBox("CategoryName", Model.CategoryName)%>
                <!--Html.TextArea("CategoryName", Model.CategoryName, 60, 15)-->
                <!--Html.TextBox("CategoryName", Model.CategoryName)-->
                <!--Html.CheckBox("CategoryName", Model.CategoryName)-->
                <!--Html.DropDownList("CategoryName", Model.CategoryName, new CategoryNameHelper.SelectAll().Items, "Id", "CategoryNameName")-->
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
        <%=Html.ActionLink("Back to list", "Category", "List" , "") %> <br/>

      </form>

    