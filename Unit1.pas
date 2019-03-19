unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var n1,n2,divi,multi:integer; proc,res:real; br:Boolean;
begin
  try
  n1:=StrToInt(edit1.Text);
  n2:=StrToInt(Edit2.Text);
  divi:=2;
  multi:=2;
  br:=true;

  memo1.Lines.Clear;
  label4.font.color:=clBlue;
  label4.Caption:='Working';
  repeat
  ProgressBar1.Position:=divi;
  label5.Caption:='Calc. Buffer '+IntToStr(divi)+'/1000';
  form1.Refresh;
  proc:=n2/divi;
    repeat
      res:=proc*multi;
      multi:=multi+1;
      //memo1.Lines.Add(FloatToStr(res));
      memo1.Lines.Add(floattostr(proc)+'*'+FloatToStr(multi-1)+'='+floattostr(res)+'(x'+floatToStr(divi)+')');
      if res=n1 then
        begin
          memo1.Lines.Add(floattostr(multi-1)+' : '+FloatToStr(divi));
          label4.font.color:=clGreen;
          label4.Caption:=floattostr(multi-1)+':'+FloatToStr(divi);
          br:=false;
          break;
        end;
    until res>n1;
    memo1.Lines.Add('OUT!');
    multi:=2;
  divi:=divi+1;
  until (br=false)or(divi>1000);

  except
  MessageDLG('Caution!','Enter numeric values to the fileds!',mtWarning,[mbOK],0);
  end;

  label5.Caption:='Waiting....................';
  ProgressBar1.Position:=1;
  if divi>1000 then begin label4.Font.Color:=clRed; label4.Caption:='Impossible'; end;
  if label4.Caption='8:5' then label4.Caption:=Label4.Caption+#13+' = 16:10';
  if label4.Caption='5:6' then label4.Caption:=Label4.Caption+#13+' = 12:10';
  if label4.Caption='2:3' then label4.Caption:=Label4.Caption+#13+' = 15:10';
  if label4.Caption='4:3' then label4.Caption:=Label4.Caption+#13+' = 12:9';
  if label4.Caption='128:75' then label4.Caption:=Label4.Caption+#13+' ≈ 15:9';
  if label4.Caption='233:144' then label4.Caption:=Label4.Caption+#13+' ≈ 16:10';
  if label4.Caption='40:17' then label4.Caption:=Label4.Caption+#13+' ≈ 2,35:1';
  if label4.Caption='256:171' then label4.Caption:=Label4.Caption+#13+' ≈ 15:10';
  if label4.Caption='427:240' then label4.Caption:=Label4.Caption+#13+' ≈ 16:9';
  if label4.Caption='683:384' then label4.Caption:=Label4.Caption+#13+' ≈ 16:9';
  if label4.Caption='640:427' then label4.Caption:=Label4.Caption+#13+' ≈ 15:10';
  if label4.Caption='25:12' then label4.Caption:=Label4.Caption+#13+' ≈ 31:15';
  if label4.Caption='256:135' then label4.Caption:=Label4.Caption+#13+' ≈ 17:9';
  if label4.Caption='205:128' then label4.Caption:=Label4.Caption+#13+' = 14,5:9';

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not memo1.visible then form1.Height:=320 else form1.Height:=203;
  if not memo1.visible then memo1.Visible:=true else Memo1.Visible:=false;
  form1.Refresh;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  case key of
  '0'..'9',#8:;
  else key:=char(0);
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: char);
begin
  case key of
  '0'..'9',#8:;
  #13:button1.Click;
  else key:=char(0);
  end;
end;

procedure TForm1.FormClick(Sender: TObject);

begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;



end.

