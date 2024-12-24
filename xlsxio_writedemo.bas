'下面内容由 VisualFreeBasic 5.9.3 自动产生，请勿自己修改
'[VFB_PROJECT_SETUP_START]
'NumObjects=1
'ProjectName=xlsxio_writedemo
'CompilationMode=0
'CompilationDebug=0
'ProjectType=GUI
'UseGDIPlus=0
'ShowConsole=1
'MultiLanguage=0
'OmitInformation=0
'StartupIcon=
'UseWinXPthemes=1
'StrUnicode=0
'UseAdminPriv=0
'DeleteGeneratedCode=1
'Namespace=0
'AutoAdd64=0
'AddCompOps= -gen gas64
'LastRunFilename=xlsxio_writedemo
'Major=0
'Minor=0
'Revision=0
'Build=0
'FileMajor=0
'FileMinor=0
'FileRevision=0
'FileBuild=5
'AutoIncrement=3
'DefaultCompiler=64
'Comments=
'CompanyName=
'FileDescription=
'LegalCopyrights=
'LegalTrademarks=
'ProductName=

'Module=.\xlsxio_writedemo.bas|18|698||Yes|
'TopTab=.\xlsxio_writedemo.bas|True|18|698
'[VFB_PROJECT_SETUP_END]

#include "xlsxio_write.bi"
#include Once "crt/stdio.bi"
#ifndef __fb_64bit__ 
#libpath "win32"
#Else
#libpath "win64"
#endif
'open .xlsx file for writing (will overwrite if it already exists)
var filename="2.xlsx"
Dim handle As xlsxiowriter=xlsxiowrite_open(filename, "Sheet1")
If (handle = NULL) Then 
  fprintf(stderr, "Error creating .xlsx file\n")
  End
End If

' write column names
xlsxiowrite_add_column(handle, "Col1", 16)
xlsxiowrite_add_column(handle, "Col2", 0)
xlsxiowrite_next_row(handle)

'write data
Dim i As Long
For i = 0 To  1000 - 1
  xlsxiowrite_add_cell_string(handle, "Test")
  xlsxiowrite_add_cell_int(handle, i)
  xlsxiowrite_next_row(handle)
Next

' close .xlsx file
xlsxiowrite_close(handle)
Print "已经创建生成2.xlsx"
sleep

