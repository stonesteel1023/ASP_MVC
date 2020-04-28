
      <%

      class OrganizationController
      Dim Model
      Dim ViewData

      private sub Class_Initialize()
      Set ViewData = Server.CreateObject("Scripting.Dictionary")
      end sub

      private sub Class_Terminate()
      end sub

        public Sub List()
            Dim u
            set u = new OrganizationHelper
            set Model = u.SelectAll
            %>   <!--#include file="../views/Organization/List.asp" --> <%
        End Sub

        public Sub Create()
            set Model = new Organization
            %>   <!--#include file="../views/Organization/Create.asp" --> <%
        End Sub

        public Sub CreatePost(args)
            Dim obj, objh
            set objh = new OrganizationHelper
            set obj = new Organization
                  obj.OrganizationName = args("OrganizationName")
                
                  obj.Description = args("Description")
                
                  obj.Active = (args("Active") = "on")
                
                  obj.isExternal = (args("isExternal") = "on")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            result = objh.Insert(obj)

            Response.Redirect("?controller=Organization&action=list")
        End Sub


        public Sub Edit(vars)

            Dim u
            set u = new OrganizationHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Organization/Edit.asp" --> <%
        End Sub

        public Sub EditPost(args)
            Dim obj, objh
            set objh = new OrganizationHelper
            set obj = objh.SelectById(args("id"))
            
                  obj.OrganizationName = args("OrganizationName")
                
                  obj.Description = args("Description")
                
                  obj.Active = (args("Active") = "on")
                
                  obj.isExternal = (args("isExternal") = "on")
                
            'form values should be cleaned from injections
            'checkboxes shoud use the syntax: obj.booleanProperty = (args("checkboxname") = "on")
            objh.Update(obj)

            Response.Redirect("?controller=Organization&action=list")
        End Sub


        public Sub Delete(vars)
            Dim u
            set u = new OrganizationHelper
            set Model = u.SelectById(vars("id"))
            %>   <!--#include file="../views/Organization/Delete.asp" --> <%
        End Sub


        public Sub DeletePost(args)
            Dim res, objh
            set objh = new OrganizationHelper
            res = objh.Delete(args("id"))
            if  res then
            Response.Redirect("?controller=Organization&action=list")
            else
            Response.Redirect("?controller=Organization&action=Delete&id=" + CStr(args("id")))
            end if
        End Sub


        public Sub Details(vars)
            Dim u
            set u = new OrganizationHelper
            set Model = u.SelectById(vars("id"))

            %>   <!--#include file="../views/Organization/Details.asp" --> <%
        End Sub

        End Class



%>
    