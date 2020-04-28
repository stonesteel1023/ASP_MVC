
      <%

      class EmailController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new EmailHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Email/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Email
            %>   <!--#include file="../views/Email/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new EmailHelper
            set obj = new Email
                  obj.FromAddress = args("FromAddress")
                
                  obj.ToAddress = args("ToAddress")
                
                  obj.Subject = args("Subject")
                
                  obj.Body = args("Body")
                
                  obj.Incomming = (args("Incomming") = "on")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Email&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new EmailHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Email/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new EmailHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.FromAddress = args("FromAddress")
                
                  obj.ToAddress = args("ToAddress")
                
                  obj.Subject = args("Subject")
                
                  obj.Body = args("Body")
                
                  obj.Incomming = (args("Incomming") = "on")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Email&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new EmailHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Email/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new EmailHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Email&action=list")
            else
            Response.Redirect("?controller=Email&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new EmailHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Email/Details.asp" --> <%
        End Sub

        End Class



%>
    