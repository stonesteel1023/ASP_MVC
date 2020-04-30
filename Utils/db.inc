<%

dim Conn
set Conn = Nothing


public function DbOpenConnection()
'      set oConn = CreateObject("ADODB.Connection")
'      oConn.Mode = 3
'      oConn.ConnectionString = connectionString'
      Conn = Server.CreateObject("ADODB.Connection")
      Conn.cursorlocation=adUseClient
      ' requires use of adovbs.inc; numeric value is 3
      DSNTest="Provider=MSDAORA.1;Password=tiger;User ID=C##STONESTEEL;Data Source=localhost"
      Conn.open DSNtest
      'oConn.Open
   end if
   'set DbOpenConnection = oConn
   set DbOpenConnection = Conn
end function

public function DbCloseConnection()
   if not Conn is nothing Then
      Conn.Close
      set Conn = nothing
   End If
   set DbCloseConnection = Conn
end function

public function DbExecute(sql)
   dim oConnection
   set oConnection = DbOpenConnection()
   set DbExecute = oConnection.execute(sql)
end function



%>