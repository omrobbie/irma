unit _IniFiles;

interface

uses
  SysUtils, Forms, IniFiles;

type
  TMyIni = class
  private
  public
    Constructor Create;
    Destructor Free;
    function Read(Section,Ident:String; Default:String=''):String;
    procedure Write(Section,Ident,Value:String);
  end;

implementation

var
  vIni: TIniFile;

constructor TMyIni.Create;
begin
  vIni:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'\config.ini');
end;

destructor TMyIni.Free;
begin
  vIni.Free;
end;

function TMyIni.Read(Section,Ident:String; Default:String=''):String;
begin
  Result:= vIni.ReadString(Section, Ident, Default);
end;

procedure TMyIni.Write(Section,Ident,Value:String);
begin
  vIni.WriteString(Section, Ident, Value);
end;

end.
