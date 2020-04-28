

      Edit PublicationPost

      <form action="?controller=PublicationPost&action=EditPost" id="EditPost" method="post">
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
              PublicationID
            </td>
            <td>
            
                <%=Html.TextBox("PublicationID", Model.PublicationID)%>
                <!--Html.TextArea("PublicationID", Model.PublicationID, 60, 15)-->
                <!--Html.TextBox("PublicationID", Model.PublicationID)-->
                <!--Html.CheckBox("PublicationID", Model.PublicationID)-->
                <!--Html.DropDownList("PublicationID", Model.PublicationID, new PublicationIDHelper.SelectAll().Items, "Id", "PublicationIDName")-->
                <!--Integer-->
              
            </td>
          </tr>
          
          <tr>
            <td>
              PostText
            </td>
            <td>
            
                <%=Html.TextArea("PostText", Model.PostText, 60, 15)%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              PostType
            </td>
            <td>
            
                <%=Html.DropDownList("PostType", Model.PostType, new PostTypeHelper.SelectAll().Items, "Id", "PostTypeName")%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              Author
            </td>
            <td>
            
                <%=Html.DropDownList("Author", Model.Author, new UserHelper.SelectAll().Items, "Id", "UserName")%>
              
            </td>
          </tr>
          

        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "PublicationPost", "List" , "") %> <br/>

      </form>

    