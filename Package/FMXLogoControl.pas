unit FMXLogoControl;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, ArtboardFireLogo,
  FMX.Graphics;

type
  TFMXLogo = class(TControl)
  private
    { Private declarations }
    FFMXLogo: TArtboardFireLogo;
    function GetFMXLettersFill: TBrush;
    procedure SetFMXLettersFill(const Value: TBrush);
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Align;
    property Width;
    property Height;
    property FMXLettersFill: TBrush read GetFMXLettersFill write SetFMXLettersFill;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Petra Shapes', [TFMXLogo]);
end;

{ TFMXLogo }

constructor TFMXLogo.Create(AOwner: TComponent);
begin
  inherited;
  FFMXLogo := TArtboardFireLogo.Create;
  // Initialize Width & Height
  Width := 535;
  Height := 260;
end;

destructor TFMXLogo.Destroy;
begin
  FFMXLogo.Free;;
  inherited;
end;

function TFMXLogo.GetFMXLettersFill: TBrush;
begin
  Result := nil;
  if Assigned(FFMXLogo) then
    Result := FFMXLogo.FMXLettersFill;
end;

procedure TFMXLogo.Paint;
begin
  FFMXLogo.DrawArtboardFireLogo(Self.Canvas,
    Self.LocalRect,
    TArtboardFireLogoFillMode.ArtboardFireLogoFit);
end;

procedure TFMXLogo.SetFMXLettersFill(const Value: TBrush);
begin
  if Assigned(FFMXLogo) then
    FFMXLogo.FMXLettersFill := Value;
end;

end.
