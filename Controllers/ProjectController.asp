
      <%

      class ProjectController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new ProjectHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Project/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Project
            %>   <!--#include file="../views/Project/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new ProjectHelper
            set obj = new Project
                  obj.ProjectName = args("ProjectName")
                
                  obj.Active = (args("Active") = "on")
                
                  obj.POP3Address = args("POP3Address")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Project&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new ProjectHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Project/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new ProjectHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.ProjectName = args("ProjectName")
                
                  obj.Active = (args("Active") = "on")
                
                  obj.POP3Address = args("POP3Address")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Project&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new ProjectHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Project/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new ProjectHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Project&action=list")
            else
            Response.Redirect("?controller=Project&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new ProjectHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Project/Details.asp" --> <%
        End Sub

        End Class



%>
    