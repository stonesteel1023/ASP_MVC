
      <%

      '
      ' This files defines the Email model
      '
class Email

      private mMetadata

      '=============================
      'Private properties
      private mId
      
        private  mFromAddress
        private  mToAddress
        private  mSubject
        private  mBody
        private  mIncomming
      private sub Class_Initialize()
          mMetadata = Array("Id",  "FromAddress"  ,  "ToAddress"  ,  "Subject"  ,  "Body"  ,  "Incomming" )
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
      
      public property get FromAddress()
      FromAddress = mFromAddress
      end property

      public property let FromAddress(val)
      mFromAddress = val
      end property
      
      public property get ToAddress()
      ToAddress = mToAddress
      end property

      public property let ToAddress(val)
      mToAddress = val
      end property
      
      public property get Subject()
      Subject = mSubject
      end property

      public property let Subject(val)
      mSubject = val
      end property
      
      public property get Body()
      Body = mBody
      end property

      public property let Body(val)
      mBody = val
      end property
      
      public property get Incomming()
      Incomming = mIncomming
      end property

      public property let Incomming(val)
      mIncomming = val
      end property
      
      public property get metadata()
      metadata = mMetadata
      end property

end class 'Email


      '======================
class EmailHelper

      Dim selectSQL

      private sub Class_Initialize()
      selectSQL = " SELECT * FROM [Email] "
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public Functions

      ' Create a new Email.
      ' true - if successful, false otherwise
      public function Insert(ByRef obj)
        Dim strSQL , execResult
        strSQL=   " Insert into [Email] ( FromAddress , ToAddress , Subject , Body , Incomming)" & _
        " Values (?  , ?  , ?  , ?  , ? ); " & _
        " SELECT SCOPE_IDENTITY()  " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

        if DbAddParameters(objCommand, Array( obj.FromAddress ,  obj.ToAddress ,  obj.Subject ,  obj.Body ,  obj.Incomming )) then
          Set execResult = objCommand.Execute
          Set execResult = execResult.NextRecordSet() ' ---- Fix for having a second command in the SQL batch
        End If
        obj.Id = CInt(execResult(0))
        Insert = true
      end  function

      ' Update the Email
      public function Update(obj)
        Dim strSQL
        strSQL= "Update [Email] set FromAddress=?  , ToAddress=?  , Subject=?  , Body=?  , Incomming=?  Where Id = ? " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

      if DbAddParameters(objCommand, Array(obj.FromAddress, obj.ToAddress, obj.Subject, obj.Body, obj.Incomming,  obj.Id)) then
        objCommand.Execute
        Update = true
      Else
	       Update = false
      End If
     
      end function
  
      ' Delete the Email
      public function Delete(Id)
      Dim strSQL
          strSQL= "DELETE FROM [Email] WHERE Id = ?"
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

      ' Select the Email by ID
      ' return Email object - if successful, Nothing otherwise
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

      ' Select all Emails into a Dictionary
      ' return a Dictionary of Email objects - if successful, Nothing otherwise
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

      ' Select all Emails into a Dictionary
      ' return a Dictionary of Email objects - if successful, Nothing otherwise
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
            set obj = new Email
            obj.Id = record("Id")
            
              obj.FromAddress = record("FromAddress")
              obj.ToAddress = record("ToAddress")
              obj.Subject = record("Subject")
              obj.Body = record("Body")
              obj.Incomming = record("Incomming")
              set PopulateObjectFromRecord = obj
      end if
    end function

end class 'EmailHelper
%>
    