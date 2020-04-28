
      <%

      '
      ' This files defines the PublicationPost model
      '
class PublicationPost

      private mMetadata

      '=============================
      'Private properties
      private mId
      
        private  mPublicationID
        private  mPostText
        private  mPostType
        private  mAuthor
      private sub Class_Initialize()
          mMetadata = Array("Id",  "PublicationID"  ,  "PostText"  ,  "PostType"  ,  "Author" )
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public properties

      public property get Id()
      Id = mId
      end property

      public property let Id(val)
      mId = val
      end property
      
      public property get PublicationID()
      PublicationID = mPublicationID
      end property

      public property let PublicationID(val)
      mPublicationID = val
      end property
      
      public property get PostText()
      PostText = mPostText
      end property

      public property let PostText(val)
      mPostText = val
      end property
      
      public property get PostType()
      PostType = mPostType
      end property

      public property let PostType(val)
      mPostType = val
      end property
      
      public property get Author()
      Author = mAuthor
      end property

      public property let Author(val)
      mAuthor = val
      end property
      
      public property get metadata()
      metadata = mMetadata
      end property

end class 'PublicationPost


      '======================
class PublicationPostHelper

      Dim selectSQL

      private sub Class_Initialize()
      selectSQL = " SELECT * FROM [PublicationPost] "
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public Functions

      ' Create a new PublicationPost.
      ' true - if successful, false otherwise
      public function Insert(ByRef obj)
        Dim strSQL , execResult
        strSQL=   " Insert into [PublicationPost] ( PublicationID , PostText , PostType , Author)" & _
        " Values (?  , ?  , ?  , ? ); " & _
        " SELECT SCOPE_IDENTITY()  " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

        if DbAddParameters(objCommand, Array( obj.PublicationID ,  obj.PostText ,  obj.PostType ,  obj.Author )) then
          Set execResult = objCommand.Execute
          Set execResult = execResult.NextRecordSet() ' ---- Fix for having a second command in the SQL batch
        End If
        obj.Id = CInt(execResult(0))
        Insert = true
      end  function

      ' Update the PublicationPost
      public function Update(obj)
        Dim strSQL
        strSQL= "Update [PublicationPost] set PublicationID=?  , PostText=?  , PostType=?  , Author=?  Where Id = ? " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

      if DbAddParameters(objCommand, Array(obj.PublicationID, obj.PostText, obj.PostType, obj.Author,  obj.Id)) then
        objCommand.Execute
        Update = true
      Else
	       Update = false
      End If
     
      end function
  
      ' Delete the PublicationPost
      public function Delete(Id)
      Dim strSQL
          strSQL= "DELETE FROM [PublicationPost] WHERE Id = ?"
          set objCommand=Server.CreateObject("ADODB.command")
          objCommand.ActiveConnection=DbOpenConnection()
          objCommand.NamedParameters = False
          objCommand.CommandText = strSQL
          objCommand.CommandType = adCmdText
          if DbAddParameters(objCommand, array(Id)) Then
            objCommand.Execute
            Delete = true
          else
            Delete = false
          End If
      end function

      ' Select the PublicationPost by ID
      ' return PublicationPost object - if successful, Nothing otherwise
      public function SelectById(id)
          Dim record
          set objCommand=Server.CreateObject("ADODB.command")
          objCommand.ActiveConnection=DbOpenConnection()
          objCommand.NamedParameters = False
          objCommand.CommandText = selectSQL + " Where id=?"
          objCommand.CommandType = adCmdText

          If DbAddParameters(objCommand, array(Id)) Then
              set record = objCommand.Execute
              Set SelectById = PopulateObjectFromRecord(record)
              record.Close
              set record = nothing
          Else
              Set SelectById = Nothing
          End If

      end function

      ' Select all PublicationPosts into a Dictionary
      ' return a Dictionary of PublicationPost objects - if successful, Nothing otherwise
      public function SelectAll()
          Dim records
          set objCommand=Server.CreateObject("ADODB.command")
          objCommand.ActiveConnection=DbOpenConnection()
          objCommand.NamedParameters = False
          objCommand.CommandText = selectSQL
          objCommand.CommandType = adCmdText
          set records = objCommand.Execute
          if records.eof then
          Set SelectAll = Nothing
          else
          Dim results, obj, record
          Set results = Server.CreateObject("Scripting.Dictionary")
          while not records.eof
          set obj = PopulateObjectFromRecord(records)
          results.Add obj.Id, obj
          records.movenext
          wend
          set SelectAll = results
          records.Close
          End If
          set records = nothing
      end function

      ' Select all PublicationPosts into a Dictionary
      ' return a Dictionary of PublicationPost objects - if successful, Nothing otherwise
      public function SelectByField(fieldName, value)
          Dim records
          set objCommand=Server.CreateObject("ADODB.command")
          objCommand.ActiveConnection=DbOpenConnection()
          objCommand.NamedParameters = False
          objCommand.CommandText = selectSQL + " where " + fieldName + "=?"
          objCommand.CommandType = adCmdText
          If DbAddParameters(objCommand, array(value)) Then
              set records = objCommand.Execute
              if records.eof then
                  Set SelectByField = Nothing
              else
                  Dim results, obj, record
                  Set results = Server.CreateObject("Scripting.Dictionary")
                  while not records.eof
                      set obj = PopulateObjectFromRecord(records)
                      results.Add obj.Id, obj
                      records.movenext
                  wend
                  set SelectByField = results
                  records.Close
              End If
                set records = nothing
          Else
              set SelectByField = Nothing
          End If
      end function

      private function PopulateObjectFromRecord(record)
        if record.eof then
            Set PopulateObjectFromRecord = Nothing
        else
            Dim obj
            set obj = new PublicationPost
            obj.Id = record("Id")
            
              obj.PublicationID = record("PublicationID")
              obj.PostText = record("PostText")
              obj.PostType = record("PostType")
              obj.Author = record("Author")
              set PopulateObjectFromRecord = obj
      end if
    end function

end class 'PublicationPostHelper
%>
    