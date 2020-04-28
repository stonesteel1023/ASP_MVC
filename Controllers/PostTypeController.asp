
      <%

      class PostTypeController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new PostTypeHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/PostType/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new PostType
            %>   <!--#include file="../views/PostType/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new PostTypeHelper
            set obj = new PostType
                  obj.PostTypeName = args("PostTypeName")
                
                  obj.SortOrder = args("SortOrder")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=PostType&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new PostTypeHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/PostType/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new PostTypeHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.PostTypeName = args("PostTypeName")
                
                  obj.SortOrder = args("SortOrder")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=PostType&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new PostTypeHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/PostType/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new PostTypeHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=PostType&action=list")
            else
            Response.Redirect("?controller=PostType&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new PostTypeHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/PostType/Details.asp" --> <%
        End Sub

        End Class



%>
    