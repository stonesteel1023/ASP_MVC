
      <!--#include file="HomeController.asp" -->
      
        <!--#include file="OrganizationController.asp" -->
      
        <!--#include file="PublicationController.asp" -->
      
        <!--#include file="UserController.asp" -->
      
        <!--#include file="PublicationPostController.asp" -->
      
        <!--#include file="EmailController.asp" -->
      
        <!--#include file="AttachmentController.asp" -->
      
        <!--#include file="CategoryController.asp" -->
      
        <!--#include file="PostTypeController.asp" -->
      
        <!--#include file="PriorityController.asp" -->
      
        <!--#include file="StatusController.asp" -->
      
        <!--#include file="ProjectController.asp" -->
      

      <%
      Public Controllers : Set Controllers = Server.CreateObject("Scripting.Dictionary")
        Controllers.Add "HomeController", ""
      
        Controllers.Add "OrganizationController", ""
      
        Controllers.Add "PublicationController", ""
      
        Controllers.Add "UserController", ""
      
        Controllers.Add "PublicationPostController", ""
      
        Controllers.Add "EmailController", ""
      
        Controllers.Add "AttachmentController", ""
      
        Controllers.Add "CategoryController", ""
      
        Controllers.Add "PostTypeController", ""
      
        Controllers.Add "PriorityController", ""
      
        Controllers.Add "StatusController", ""
      
        Controllers.Add "ProjectController", ""
      
      %>
      
    