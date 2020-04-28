

      Edit Email

      <form action="?controller=Email&action=EditPost" id="EditPost" method="post">
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
              FromAddress
            </td>
            <td>
            
                <%=Html.TextBox("FromAddress", Model.FromAddress)%>
                <!--Html.TextArea("FromAddress", Model.FromAddress, 60, 15)-->
                <!--Html.TextBox("FromAddress", Model.FromAddress)-->
                <!--Html.CheckBox("FromAddress", Model.FromAddress)-->
                <!--Html.DropDownList("FromAddress", Model.FromAddress, new FromAddressHelper.SelectAll().Items, "Id", "FromAddressName")-->
                <!--String-->
              
            </td>
          </tr>
          
          <tr>
            <td>
              ToAddress
            </td>
            <td>
            
                <%=Html.TextBox("ToAddress", Model.ToAddress)%>
                <!--Html.TextArea("ToAddress", Model.ToAddress, 60, 15)-->
                <!--Html.TextBox("ToAddress", Model.ToAddress)-->
                <!--Html.CheckBox("ToAddress", Model.ToAddress)-->
                <!--Html.DropDownList("ToAddress", Model.ToAddress, new ToAddressHelper.SelectAll().Items, "Id", "ToAddressName")-->
                <!--String-->
              
            </td>
          </tr>
          
          <tr>
            <td>
              Subject
            </td>
            <td>
            
                <%=Html.TextBox("Subject", Model.Subject)%>
                <!--Html.TextArea("Subject", Model.Subject, 60, 15)-->
                <!--Html.TextBox("Subject", Model.Subject)-->
                <!--Html.CheckBox("Subject", Model.Subject)-->
                <!--Html.DropDownList("Subject", Model.Subject, new SubjectHelper.SelectAll().Items, "Id", "SubjectName")-->
                <!--String-->
              
            </td>
          </tr>
          
          <tr>
            <td>
              Body
            </td>
            <td>
            
                <%=Html.TextArea("Body", Model.Body, 60, 15)%>
              
            </td>
          </tr>
          
          <tr>
            <td>
              Incomming
            </td>
            <td>
            
                <%=Html.CheckBox("Incomming", Model.Incomming)%>
              
            </td>
          </tr>
          

        </table>
        <button type="submit">Submit</button>
        <%=Html.ActionLink("Back to list", "Email", "List" , "") %> <br/>

      </form>

    