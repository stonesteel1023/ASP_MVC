
      <%

      class CategoryController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new CategoryHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Category/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Category
            %>   <!--#include file="../views/Category/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new CategoryHelper
            set obj = new Category
                  obj.CategoryName = args("CategoryName")
                
                  obj.SortOrder = args("SortOrder")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Category&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new CategoryHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Category/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new CategoryHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.CategoryName = args("CategoryName")
                
                  obj.SortOrder = args("SortOrder")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Category&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new CategoryHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Category/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new CategoryHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Category&action=list")
            else
            Response.Redirect("?controller=Category&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new CategoryHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Category/Details.asp" --> <%
        End Sub

        End Class



%>
    