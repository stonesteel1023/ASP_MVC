
      <%

      '
      ' This files defines the Organization model
      '
class Organization

      private mMetadata

      '=============================
      'Private properties
      private mId
      
        private  mOrganizationName
        private  mDescription
        private  mActive
        private  misExternal
      private sub Class_Initialize()
          mMetadata = Array("Id",  "OrganizationName"  ,  "Description"  ,  "Active"  ,  "isExternal" )
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
      
      public property get OrganizationName()
      OrganizationName = mOrganizationName
      end property

      public property let OrganizationName(val)
      mOrganizationName = val
      end property
      
      public property get Description()
      Description = mDescription
      end property

      public property let Description(val)
      mDescription = val
      end property
      
      public property get Active()
      Active = mActive
      end property

      public property let Active(val)
      mActive = val
      end property
      
      public property get isExternal()
      isExternal = misExternal
      end property

      public property let isExternal(val)
      misExternal = val
      end property
      
      public property get metadata()
      metadata = mMetadata
      end property

end class 'Organization


      '======================
class OrganizationHelper

      Dim selectSQL

      private sub Class_Initialize()
      selectSQL = " SELECT * FROM [Organization] "
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public Functions

      ' Create a new Organization.
      ' true - if successful, false otherwise
      public function Insert(ByRef obj)
        Dim strSQL , execResult
        strSQL=   " Insert into [Organization] ( OrganizationName , Description , Active , isExternal)" & _
        " Values (?  , ?  , ?  , ? ); " & _
        " SELECT SCOPE_IDENTITY()  " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

        if DbAddParameters(objCommand, Array( obj.OrganizationName ,  obj.Description ,  obj.Active ,  obj.isExternal )) then
          Set execResult = objCommand.Execute
          Set execResult = execResult.NextRecordSet() ' ---- Fix for having a second command in the SQL batch
        End If
        obj.Id = CInt(execResult(0))
        Insert = true
      end  function

      ' Update the Organization
      public function Update(obj)
        Dim strSQL
        strSQL= "Update [Organization] set OrganizationName=?  , Description=?  , Active=?  , isExternal=?  Where Id = ? " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

      if DbAddParameters(objCommand, Array(obj.OrganizationName, obj.Description, obj.Active, obj.isExternal,  obj.Id)) then
        objCommand.Execute
        Update = true
      Else
	       Update = false
      End If
     
      end function
  
      ' Delete the Organization
      public function Delete(Id)
      Dim strSQL
          strSQL= "DELETE FROM [Organization] WHERE Id = ?"
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

      ' Select the Organization by ID
      ' return Organization object - if successful, Nothing otherwise
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

      ' Select all Organizations into a Dictionary
      ' return a Dictionary of Organization objects - if successful, Nothing otherwise
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

      ' Select all Organizations into a Dictionary
      ' return a Dictionary of Organization objects - if successful, Nothing otherwise
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
            set obj = new Organization
            obj.Id = record("Id")
            
              obj.OrganizationName = record("OrganizationName")
              obj.Description = record("Description")
              obj.Active = record("Active")
              obj.isExternal = record("isExternal")
              set PopulateObjectFromRecord = obj
      end if
    end function

end class 'OrganizationHelper
%>
    