
      <%

      '
      ' This files defines the Category model
      '
class Category

      private mMetadata

      '=============================
      'Private properties
      private mId
      
        private  mCategoryName
        private  mSortOrder
      private sub Class_Initialize()
          mMetadata = Array("Id",  "CategoryName"  ,  "SortOrder" )
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
      
      public property get CategoryName()
      CategoryName = mCategoryName
      end property

      public property let CategoryName(val)
      mCategoryName = val
      end property
      
      public property get SortOrder()
      SortOrder = mSortOrder
      end property

      public property let SortOrder(val)
      mSortOrder = val
      end property
      
      public property get metadata()
      metadata = mMetadata
      end property

end class 'Category


      '======================
class CategoryHelper

      Dim selectSQL

      private sub Class_Initialize()
      selectSQL = " SELECT * FROM [Category] "
      end sub

      private sub Class_Terminate()
      end sub

      '=============================
      'public Functions

      ' Create a new Category.
      ' true - if successful, false otherwise
      public function Insert(ByRef obj)
        Dim strSQL , execResult
        strSQL=   " Insert into [Category] ( CategoryName , SortOrder)" & _
        " Values (?  , ? ); " & _
        " SELECT SCOPE_IDENTITY()  " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

        if DbAddParameters(objCommand, Array( obj.CategoryName ,  obj.SortOrder )) then
          Set execResult = objCommand.Execute
          Set execResult = execResult.NextRecordSet() ' ---- Fix for having a second command in the SQL batch
        End If
        obj.Id = CInt(execResult(0))
        Insert = true
      end  function

      ' Update the Category
      public function Update(obj)
        Dim strSQL
        strSQL= "Update [Category] set CategoryName=?  , SortOrder=?  Where Id = ? " 
        set objCommand=Server.CreateObject("ADODB.command") 
        objCommand.ActiveConnection=DbOpenConnection()
        objCommand.NamedParameters = False
        objCommand.CommandText = strSQL
        objCommand.CommandType = adCmdText

      if DbAddParameters(objCommand, Array(obj.CategoryName, obj.SortOrder,  obj.Id)) then
        objCommand.Execute
        Update = true
      Else
	       Update = false
      End If
     
      end function
  
      ' Delete the Category
      public function Delete(Id)
      Dim strSQL
          strSQL= "DELETE FROM [Category] WHERE Id = ?"
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

      ' Select the Category by ID
      ' return Category object - if successful, Nothing otherwise
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

      ' Select all Categorys into a Dictionary
      ' return a Dictionary of Category objects - if successful, Nothing otherwise
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

      ' Select all Categorys into a Dictionary
      ' return a Dictionary of Category objects - if successful, Nothing otherwise
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
            set obj = new Category
            obj.Id = record("Id")
            
              obj.CategoryName = record("CategoryName")
              obj.SortOrder = record("SortOrder")
              set PopulateObjectFromRecord = obj
      end if
    end function

end class 'CategoryHelper
%>
    