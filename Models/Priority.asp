
      <%

      '
      ' This files defines the Priority model
      '
class Priority

      private mMetadata

      '=============================
      'Private properties
      private mId
      
        private  mPriorityName
        private  mSortOrder
        private  mSCCClass
        private  mBGColor
      private sub Class_Initialize()
          mMetadata = Array("Id",  "PriorityName"  ,  "SortOrder"  ,  "SCCClass"  ,  "BGColor" )
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
      
      public property get PriorityName()
      PriorityName = mPriorityName
      end property

      public property let PriorityName(val)
      mPriorityName = val
      end property
      
      public property get SortOrder()
      SortOrder = mSortOrder
      end property

      public property let SortOrder(val)
      mSortOrder = val
      end property
      
      public property get SCCClass()
      SCCClass = mSCCClass
      end property

      public property let SCCClass(val)
      mSCCClass = val
      end property
      
      public property get BGColor()
      BGColor = mBGColor
      end property

      public property let BGColor(val)
      mBGColor = val
      end property
      
      public property get metadata()
      metadata = mMetadata
      end property

end class 'Priority


      '======================
class PriorityHelper

      Dim selectSQL

      private sub Class_Initialize()
      selectSQL = " SELECT * FROM [Priority] "
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public Functions

      ' Create a new Priority.
      ' true - if successful, false otherwise
      public function Insert(ByRef obj)
        Dim strSQL , execResult
        strSQL=   " Insert into [Priority] ( PriorityName , SortOrder , SCCClass , BGColor)" & _
        " Values (?  , ?  , ?  , ? ); " & _
        " SELECT SCOPE_IDENTITY()  " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

        if DbAddParameters(objCommand, Array( obj.PriorityName ,  obj.SortOrder ,  obj.SCCClass ,  obj.BGColor )) then
          Set execResult = objCommand.Execute
          Set execResult = execResult.NextRecordSet() ' ---- Fix for having a second command in the SQL batch
        End If
        obj.Id = CInt(execResult(0))
        Insert = true
      end  function

      ' Update the Priority
      public function Update(obj)
        Dim strSQL
        strSQL= "Update [Priority] set PriorityName=?  , SortOrder=?  , SCCClass=?  , BGColor=?  Where Id = ? " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

      if DbAddParameters(objCommand, Array(obj.PriorityName, obj.SortOrder, obj.SCCClass, obj.BGColor,  obj.Id)) then
        objCommand.Execute
        Update = true
      Else
	       Update = false
      End If
     
      end function
  
      ' Delete the Priority
      public function Delete(Id)
      Dim strSQL
          strSQL= "DELETE FROM [Priority] WHERE Id = ?"
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

      ' Select the Priority by ID
      ' return Priority object - if successful, Nothing otherwise
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

      ' Select all Prioritys into a Dictionary
      ' return a Dictionary of Priority objects - if successful, Nothing otherwise
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

      ' Select all Prioritys into a Dictionary
      ' return a Dictionary of Priority objects - if successful, Nothing otherwise
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
            set obj = new Priority
            obj.Id = record("Id")
            
              obj.PriorityName = record("PriorityName")
              obj.SortOrder = record("SortOrder")
              obj.SCCClass = record("SCCClass")
              obj.BGColor = record("BGColor")
              set PopulateObjectFromRecord = obj
      end if
    end function

end class 'PriorityHelper
%>
    