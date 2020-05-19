<%@Language="VBScript" CODEPAGE="65001" %>
<%
Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
%>
<%
    Class clsCustomer
        private m_WebID
        private m_KorName
        private m_Email
        private DBCon
        
        public property get WebID()
            WebID = m_WebID
        end property

        public property get KorName()
            KorName = m_KorName
        end property
        
        public property get Email()
            Email = m_Email
        end property
        
        Private Sub Class_Initialize 
            Dim strConn
            strConn = strConn&"Provider=SQLOLEDB.1;Persist Security Info=True;"
            strConn = strConn&"Data Source=sdmiweb;"   ' Server Name
            strConn = strConn&"User ID=n365qt;"     ' User ID
            strConn = strConn&"Password=n365qt;"      ' User Password
            strConn = strConn&"Initial Catalog=Magazine;" ' DataBase
            
            Set DBCon = Server.CreateObject("ADODB.Connection")
            DBCon.Open strConn    
        End Sub
        
        Private Sub Class_Terminate   ' Setup Terminate event.
            if DBCon.State = 2 then DBCon.Close
            Set DBCon = Nothing
        End Sub
        
        Public Sub init(id)
            Dim rs : Set rs = Server.CreateObject("ADODB.RecordSet")
            Dim strSql
            
            strSql = "select WebID,KorName,Email from dbo.Member Where WebID='" & id & "'"
            Set rs = DBCon.Execute(strSql)
            if not rs.eof then
                m_WebID  = rs(0)
                m_KorName = rs(1)
                m_Email   = rs(2)
            end if
            rs.Close
            Set rs = nothing
        End Sub
        
        
    End Class
    
   

%>
<%
 	Dim cCust
    Set cCust = New clsCustomer    ' 사용자 클래스 생성
    cCust.init "stonesteel"  'AROUT란 ID의 사용자 정보를 가져옴
    
    ' 사용자의 회사명, 전화번호를 가져온다.
    Response.Write "WebID : " & cCust.WebID & "<br>"
    Response.Write "KorName : " & cCust.KorName & "<br>"
    Response.Write "Email : " & cCust.Email & "<br>"

%>