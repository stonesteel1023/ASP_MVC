
      <%

      class PublicationPostController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new PublicationPostHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/PublicationPost/List.asp" --> <%
        End Sub

        public Sub ListByPublicationID(vars)
            Dim u
            set u = new PublicationPostHelper
            Stop
            set Model = u.SelectByField("PublicationID",vars("PublicationID"))
            %><!--#include file="../views/PublicationPost/ListByPublicationID.asp" --><%
        End Sub
        
        public Sub Create()
            set Model = new PublicationPost
            %>   <!--#include file="../views/PublicationPost/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new PublicationPostHelper
            set obj = new PublicationPost
                  obj.PublicationID = args("PublicationID")
                
                  obj.PostText = args("PostText")
                
                  obj.PostType = args("PostType")
                
                  obj.Author = args("Author")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=PublicationPost&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new PublicationPostHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/PublicationPost/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new PublicationPostHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.PublicationID = args("PublicationID")
                
                  obj.PostText = args("PostText")
                
                  obj.PostType = args("PostType")
                
                  obj.Author = args("Author")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=PublicationPost&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new PublicationPostHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/PublicationPost/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new PublicationPostHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=PublicationPost&action=list")
            else
            Response.Redirect("?controller=PublicationPost&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new PublicationPostHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/PublicationPost/Details.asp" --> <%
        End Sub

        End Class



%>
    