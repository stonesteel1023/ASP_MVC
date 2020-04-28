
      <%

      class PublicationController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new PublicationHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Publication/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Publication
            %>   <!--#include file="../views/Publication/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new PublicationHelper
            set obj = new Publication
                  obj.Description = args("Description")
                
                  obj.ProjectID = args("ProjectID")
                
                  obj.OrganizationID = args("OrganizationID")
                
                  obj.CategoryID = args("CategoryID")
                
                  obj.PriorityID = args("PriorityID")
                
                  obj.StatusID = args("StatusID")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Publication&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new PublicationHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Publication/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new PublicationHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.Description = args("Description")
                
                  obj.ProjectID = args("ProjectID")
                
                  obj.OrganizationID = args("OrganizationID")
                
                  obj.CategoryID = args("CategoryID")
                
                  obj.PriorityID = args("PriorityID")
                
                  obj.StatusID = args("StatusID")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Publication&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new PublicationHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Publication/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new PublicationHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Publication&action=list")
            else
            Response.Redirect("?controller=Publication&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new PublicationHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Publication/Details.asp" --> <%
        End Sub

        End Class



%>
    