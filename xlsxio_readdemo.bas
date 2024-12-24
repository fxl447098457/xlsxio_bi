'下面内容由 VisualFreeBasic 5.9.3 自动产生，请勿自己修改
'[VFB_PROJECT_SETUP_START]
'NumObjects=1
'ProjectName=xlsxio_readdemo
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
'LastRunFilename=xlsxio_readdemo
'Major=0
'Minor=0
'Revision=0
'Build=0
'FileMajor=0
'FileMinor=0
'FileRevision=0
'FileBuild=4
'AutoIncrement=3
'DefaultCompiler=64
'Comments=
'CompanyName=
'FileDescription=
'LegalCopyrights=
'LegalTrademarks=
'ProductName=

'Module=.\xlsxio_readdemo.bas|16|718||Yes|
'TopTab=.\xlsxio_readdemo.bas|True|16|718
'[VFB_PROJECT_SETUP_END]

#include once "xlsxio_read.bi"
#include Once "crt/stdio.bi"
#ifndef __fb_64bit__ 
#libpath "win32"
#Else
#libpath "win64"
#endif
'open .xlsx file for reading
Dim xlsxioread As xlsxioreader
Dim filename As ZString Ptr = StrPtr("1.xlsx")
xlsxioread = xlsxioread_open(filename)
If xlsxioread= NULL Then 
  fprintf(stderr, "Error opening .xlsx file\n")
  End
End If
' read values from first sheet
Dim value As ZString Ptr
Dim sheet As xlsxioreadersheet
Dim sheetname As  ZString Ptr = StrPtr("Sheet1")
Print "Contents of first sheet:"
sheet = xlsxioread_sheet_open(xlsxioread, sheetname,XLSXIOREAD_SKIP_EMPTY_ROWS) 
  'read all rows
  While sheet<>NULL
   value = xlsxioread_sheet_next_cell(sheet)
    While  value <> NULL
      printf("%s\t", value)
      xlsxioread_free(value)
      value = xlsxioread_sheet_next_cell(sheet)
    Wend
  
 Wend
 If sheet<>NULL Then  xlsxioread_sheet_close(sheet)

' clean up
xlsxioread_close(xlsxioread)
sleep

