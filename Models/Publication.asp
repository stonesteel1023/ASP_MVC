
      <%

      '
      ' This files defines the Publication model
      '
class Publication

      private mMetadata

      '=============================
      'Private properties
      private mId
      
        private  mDescription
        private  mProjectID
        private  mOrganizationID
        private  mCategoryID
        private  mPriorityID
        private  mStatusID
      private sub Class_Initialize()
          mMetadata = Array("Id",  "Description"  ,  "ProjectID"  ,  "OrganizationID"  ,  "CategoryID"  ,  "PriorityID"  ,  "StatusID" )
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
      
      public property get Description()
      Description = mDescription
      end property

      public property let Description(val)
      mDescription = val
      end property
      
      public property get ProjectID()
      ProjectID = mProjectID
      end property

      public property let ProjectID(val)
      mProjectID = val
      end property
      
      public property get OrganizationID()
      OrganizationID = mOrganizationID
      end property

      public property let OrganizationID(val)
      mOrganizationID = val
      end property
      
      public property get CategoryID()
      CategoryID = mCategoryID
      end property

      public property let CategoryID(val)
      mCategoryID = val
      end property
      
      public property get PriorityID()
      PriorityID = mPriorityID
      end property

      public property let PriorityID(val)
      mPriorityID = val
      end property
      
      public property get StatusID()
      StatusID = mStatusID
      end property

      public property let StatusID(val)
      mStatusID = val
      end property
      
      public property get metadata()
      metadata = mMetadata
      end property

end class 'Publication


      '======================
class PublicationHelper

      Dim selectSQL

      private sub Class_Initialize()
      selectSQL = " SELECT * FROM [Publication] "
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public Functions

      ' Create a new Publication.
      ' true - if successful, false otherwise
      public function Insert(ByRef obj)
        Dim strSQL , execResult
        strSQL=   " Insert into [Publication] ( Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID)" & _
        " Values (?  , ?  , ?  , ?  , ?  , ? ); " & _
        " SELECT SCOPE_IDENTITY()  " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

        if DbAddParameters(objCommand, Array( obj.Description ,  obj.ProjectID ,  obj.OrganizationID ,  obj.CategoryID ,  obj.PriorityID ,  obj.StatusID )) then
          Set execResult = objCommand.Execute
          Set execResult = execResult.NextRecordSet() ' ---- Fix for having a second command in the SQL batch
        End If
        obj.Id = CInt(execResult(0))
        Insert = true
      end  function

      ' Update the Publication
      public function Update(obj)
        Dim strSQL
        strSQL= "Update [Publication] set Description=?  , ProjectID=?  , OrganizationID=?  , CategoryID=?  , PriorityID=?  , StatusID=?  Where Id = ? " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

      if DbAddParameters(objCommand, Array(obj.Description, obj.ProjectID, obj.OrganizationID, obj.CategoryID, obj.PriorityID, obj.StatusID,  obj.Id)) then
        objCommand.Execute
        Update = true
      Else
	       Update = false
      End If
     
      end function
  
      ' Delete the Publication
      public function Delete(Id)
      Dim strSQL
          strSQL= "DELETE FROM [Publication] WHERE Id = ?"
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

      ' Select the Publication by ID
      ' return Publication object - if successful, Nothing otherwise
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

      ' Select all Publications into a Dictionary
      ' return a Dictionary of Publication objects - if successful, Nothing otherwise
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

      ' Select all Publications into a Dictionary
      ' return a Dictionary of Publication objects - if successful, Nothing otherwise
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
            set obj = new Publication
            obj.Id = record("Id")
            
              obj.Description = record("Description")
              obj.ProjectID = record("ProjectID")
              obj.OrganizationID = record("OrganizationID")
              obj.CategoryID = record("CategoryID")
              obj.PriorityID = record("PriorityID")
              obj.StatusID = record("StatusID")
              set PopulateObjectFromRecord = obj
      end if
    end function

end class 'PublicationHelper
%>
    