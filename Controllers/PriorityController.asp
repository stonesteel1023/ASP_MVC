
      <%

      class PriorityController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new PriorityHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Priority/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Priority
            %>   <!--#include file="../views/Priority/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new PriorityHelper
            set obj = new Priority
                  obj.PriorityName = args("PriorityName")
                
                  obj.SortOrder = args("SortOrder")
                
                  obj.SCCClass = args("SCCClass")
                
                  obj.BGColor = args("BGColor")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Priority&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new PriorityHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Priority/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new PriorityHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.PriorityName = args("PriorityName")
                
                  obj.SortOrder = args("SortOrder")
                
                  obj.SCCClass = args("SCCClass")
                
                  obj.BGColor = args("BGColor")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Priority&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new PriorityHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Priority/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new PriorityHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Priority&action=list")
            else
            Response.Redirect("?controller=Priority&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new PriorityHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Priority/Details.asp" --> <%
        End Sub

        End Class



%>
    