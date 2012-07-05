object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 126
  Top = 143
  Height = 186
  Width = 215
  object conn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\sg' +
      'm\db.mdb;Mode=Share Deny None;Extended Properties="";Persist Sec' +
      'urity Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry' +
      ' Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;' +
      'Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk ' +
      'Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Databas' +
      'e Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:E' +
      'ncrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=Fal' +
      'se;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=' +
      'False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 16
  end
  object zconn: TZConnection
    Protocol = 'sqlite-3'
    Database = 'C:\prj\motel\dados.s3db'
    Connected = True
    Left = 96
    Top = 24
  end
  object ZUpdateSQL1: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 24
    Top = 88
  end
end
