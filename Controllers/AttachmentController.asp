
      <%

      class AttachmentController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new AttachmentHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Attachment/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Attachment
            %>   <!--#include file="../views/Attachment/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new AttachmentHelper
            set obj = new Attachment
                  obj.ItemPost = args("ItemPost")
                
                  obj.AttachmentContent = args("AttachmentContent")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Attachment&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new AttachmentHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Attachment/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new AttachmentHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.ItemPost = args("ItemPost")
                
                  obj.AttachmentContent = args("AttachmentContent")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Attachment&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new AttachmentHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Attachment/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new AttachmentHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Attachment&action=list")
            else
            Response.Redirect("?controller=Attachment&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new AttachmentHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Attachment/Details.asp" --> <%
        End Sub

        End Class



%>
    