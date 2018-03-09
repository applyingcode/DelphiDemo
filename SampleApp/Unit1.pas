unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXLogoControl, FMX.Ani, FMX.Effects;

type
  TForm1 = class(TForm)
    FMXLogo1: TFMXLogo;
    GradientAnimation1: TGradientAnimation;
    ShadowEffect1: TShadowEffect;
    procedure GradientAnimation1Process(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.GradientAnimation1Process(Sender: TObject);
begin
  FMXLogo1.Repaint;
end;

end.
