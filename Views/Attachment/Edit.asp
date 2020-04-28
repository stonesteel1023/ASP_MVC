

      Edit Attachment

      <form action="?controller=Attachment&action=EditPost" id="EditPost" method="post">
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
              ItemPost
            </td>
            <td>
            
                <%=Html.TextBox("ItemPost", Model.ItemPost)%>
                <!--Html.TextArea("ItemPost", Model.ItemPost, 60, 15)-->
                <!--Html.TextBox("ItemPost", Model.ItemPost)-->
                <!--Html.CheckBox("ItemPost", Model.ItemPost)-->
                <!--Html.DropDownList("ItemPost", Model.ItemPost, new ItemPostHelper.SelectAll().Items, "Id", "ItemPostName")-->
                <!--Integer-->
              
            </td>
          </tr>
          
          <tr>
            <td>
              AttachmentContent
            </td>
            <td>
            
                <%=Html.TextBox("AttachmentContent", Model.AttachmentContent)%>
                <!--Html.TextArea("AttachmentContent", Model.AttachmentContent, 60, 15)-->
                <!--Html.TextBox("AttachmentContent", Model.AttachmentContent)-->
                <!--Html.CheckBox("AttachmentContent", Model.AttachmentContent)-->
                <!--Html.DropDownList("AttachmentContent", Model.AttachmentContent, new AttachmentContentHelper.SelectAll().Items, "Id", "AttachmentContentName")-->
                <!--String-->
              
            </td>
          </tr>
          

        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "Attachment", "List" , "") %> <br/>

      </form>

    