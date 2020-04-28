
      <%

      class StatusController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new StatusHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Status/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Status
            %>   <!--#include file="../views/Status/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new StatusHelper
            set obj = new Status
                  obj.StatusName = args("StatusName")
                
                  obj.SortOrder = args("SortOrder")
                
                  obj.CSSClass = args("CSSClass")
                
                  obj.isDefault = (args("isDefault") = "on")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Status&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new StatusHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Status/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new StatusHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.StatusName = args("StatusName")
                
                  obj.SortOrder = args("SortOrder")
                
                  obj.CSSClass = args("CSSClass")
                
                  obj.isDefault = (args("isDefault") = "on")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Status&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new StatusHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Status/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new StatusHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Status&action=list")
            else
            Response.Redirect("?controller=Status&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new StatusHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Status/Details.asp" --> <%
        End Sub

        End Class



%>
    