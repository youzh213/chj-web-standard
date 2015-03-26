<%
'dbfolder="Databases/"
'dbname="RecordData.mdb"
'connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(dbfolder&dbname)&";Jet OLEDB:Database Password=042500;"

dbfolder="database/"
dbname="chj_db.mdb"
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(dbfolder&dbname) &";Jet OLEDB:Database;"
'Response.Write connstr
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connstr
If Err Then
'set fs=createobject("scripting.filesystemobject") 
'set ts=fs.createtextfile(server.MapPath("Error/data_"&month(now())&"-"&day(now())&"_"&hour(now())&"-"&minute(now())&"-"&second(now())&".txt"),true)
Response.write Err.Number&":"&Err.Description
'ts.close
'set ts=Nothing
'set fs=Nothing
err.Clear
Set Conn = Nothing
Response.Write "<p style='font-size:9pt' align=center>database connect error</p>"
Response.Write "<p style='font-size:9pt' align=center>cause:database place or name error</p>"
Response.End
End If
'关闭数据库连接函数
sub CloseConn()
	conn.close
	set conn=nothing
end sub
%>
<!--#include file="sqlcheck.asp"-->