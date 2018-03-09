// +----------------------------------------------------+
// | Petra Plugin For Sketch                            |
// | Copyright(c) 2016 www.applyingcode.com             |
// +----------------------------------------------------+
// | Pascal Edition                                     |
// +----------------------------------------------------+
//   1/5/17 2:10:20 PM

unit ArtboardFireLogo;

interface

uses
    System.Classes,
    System.Types,
    System.UITypes,
    System.Math,
    System.Math.Vectors,
    FMX.Types,
    FMX.Graphics,
    FMX.Objects;

type
  TArtboardFireLogoFillMode = (
    ArtboardFireLogoFit,
    ArtboardFireLogoFill,
    ArtboardFireLogoStretch,
    ArtboardFireLogoOriginal);

  TArtboardFireLogo = class(TObject)
  private
    { Private declarations }
    FArtboardFireLogoFillMode: TArtboardFireLogoFillMode;
    FArtboardFireLogoBitmapHeight: Single;
    FArtboardFireLogoBitmapWidth: Single;
    FBitmap: TBitmap;
    FOpacity: Single;
    FFMXLettersFill: TBrush;

    function GetNewArtboardSize(FillMode: TArtboardFireLogoFillMode; SourceRect, TargetRect: TRectF): TRectF;
    function GenerateArtboardFireLogoBitmap: TBitmap;
    procedure SetArtboardFireLogoFillMode(const Value: TArtboardFireLogoFillMode);
    procedure SetArtboardFireLogoBitmapHeight(const Value: Single);
    procedure SetArtboardFireLogoBitmapWidth(const Value: Single);
    procedure SetOpacity(const Value: Single);
    procedure DrawShapeObjectRectangleBig(Canvas: TCanvas);
    procedure DrawShapeObjectRectangleSmall(Canvas: TCanvas);
    procedure DrawShapeObjectFMX(Canvas: TCanvas);
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure DrawArtboardFireLogo(const SurfaceCanvas: TCanvas; const Bounds: TRectF; const FillMode: TArtboardFireLogoFillMode);
    property ArtboardFireLogoFillMode: TArtboardFireLogoFillMode read FArtboardFireLogoFillMode write SetArtboardFireLogoFillMode;
    property ArtboardFireLogoBitmap: TBitmap read GenerateArtboardFireLogoBitmap;
    property ArtboardFireLogoBitmapHeight: Single read FArtboardFireLogoBitmapHeight write SetArtboardFireLogoBitmapHeight;
    property ArtboardFireLogoBitmapWidth: Single read FArtboardFireLogoBitmapWidth write SetArtboardFireLogoBitmapWidth;
    property Opacity: Single read FOpacity write SetOpacity;
    property FMXLettersFill: TBrush read FFMXLettersFill write FFMXLettersFill;
  end;

implementation

// Initialize defaults

constructor TArtboardFireLogo.Create;
var
  GradientPointObj: TGradientPoint;
begin
  inherited;
  FArtboardFireLogoBitmapWidth := 535;
  FArtboardFireLogoBitmapHeight := 260;
  FArtboardFireLogoFillMode := TArtboardFireLogoFillMode.ArtboardFireLogoFit;
  FBitmap := nil;
  FOpacity := 1.0;
  FFMXLettersFill := TBrush.Create(TBrushKind.Gradient, $00000000);

  // Initialize to default color
  FFMXLettersFill.Kind := TBrushKind.Gradient;
  FFMXLettersFill.Gradient.Style := TGradientStyle.Linear;
  FFMXLettersFill.Gradient.Points.Clear;
  GradientPointObj := TGradientPoint(FFMXLettersFill.Gradient.Points.Add);
  GradientPointObj.Color := TAlphaColor($FFBD3024);
  GradientPointObj := TGradientPoint(FFMXLettersFill.Gradient.Points.Add);
  GradientPointObj.Color := TAlphaColor($FFF08F30);
  FFMXLettersFill.Gradient.Points[0].Offset := 0.000000;
  FFMXLettersFill.Gradient.Points[1].Offset := 1.000000;
end;

// Release resources

destructor TArtboardFireLogo.Destroy;
begin
  if Assigned(FBitmap) then
    FBitmap.Free;

  if Assigned(FFMXLettersFill) then
    FFMXLettersFill.Free;

  inherited;
end;

//
// ArtboardFireLogo
//
procedure TArtboardFireLogo.DrawArtboardFireLogo(const SurfaceCanvas: TCanvas; const Bounds: TRectF; const FillMode: TArtboardFireLogoFillMode);
var
  TranslationMatrix: TMatrix;
  ScalingMatrix: TMatrix;
  NewArtboardSize: TRectF;
  BackBuffer: TBitmap;
  Canvas: TCanvas;
begin

  // Initialize and set new artboard size (scaled)
  NewArtboardSize := GetNewArtboardSize(FillMode, RectF(0, 0, 535, 260), Bounds);
  TranslationMatrix := TMatrix.CreateTranslation(NewArtboardSize.Left, NewArtboardSize.Top);
  ScalingMatrix := TMatrix.CreateScaling(NewArtboardSize.Width / 535, NewArtboardSize.Height / 260);

  // Off-Screen back buffer
  BackBuffer := TBitmap.Create(Round(Bounds.Width), Round(Bounds.Height));

  // Drawing code
  Canvas := BackBuffer.Canvas;
  Canvas.BeginScene;
  Canvas.SetMatrix(ScalingMatrix * TranslationMatrix);
  DrawShapeObjectRectangleBig(Canvas);
  DrawShapeObjectRectangleSmall(Canvas);
  DrawShapeObjectFMX(Canvas);
  Canvas.EndScene;

  // Copy back buffer
  SurfaceCanvas.BeginScene;
  SurfaceCanvas.DrawBitmap(Canvas.Bitmap, Bounds, Bounds, Opacity);
  SurfaceCanvas.EndScene;

  // Release back buffer
  BackBuffer.Free;

end;
//
// ShapeObjectRectangleBig
//
procedure TArtboardFireLogo.DrawShapeObjectRectangleBig(Canvas: TCanvas);
var
  ShapeObjectRectangleBigPath : TPathData;
  CanvasState: TCanvasSaveState;
  SavedMatrix: TMatrix;
  GradientPointObj: TGradientPoint;
begin
  // Shape Path
  ShapeObjectRectangleBigPath := TPathData.Create;
  ShapeObjectRectangleBigPath.MoveTo(PointF(0, 21.992396));
  ShapeObjectRectangleBigPath.CurveTo(PointF(0, 9.846331), PointF(9.852449, 0), PointF(22.000581, 0));
  ShapeObjectRectangleBigPath.LineTo(PointF(428.999419, 0));
  ShapeObjectRectangleBigPath.CurveTo(PointF(441.150005, 0), PointF(451, 9.851674), PointF(451, 21.992396));
  ShapeObjectRectangleBigPath.LineTo(PointF(451, 201.007604));
  ShapeObjectRectangleBigPath.CurveTo(PointF(451, 213.153669), PointF(441.147551, 223), PointF(428.999419, 223));
  ShapeObjectRectangleBigPath.LineTo(PointF(22.000581, 223));
  ShapeObjectRectangleBigPath.CurveTo(PointF(9.849995, 223), PointF(0, 213.148326), PointF(0, 201.007604));
  ShapeObjectRectangleBigPath.LineTo(PointF(0, 21.992396));
  ShapeObjectRectangleBigPath.ClosePath;

  // Save initial state
  CanvasState := Canvas.SaveState;
  SavedMatrix := Canvas.Matrix;

  Canvas.SetMatrix(TMatrix.CreateTranslation(42, 18) * SavedMatrix);

  // Shape Fill
  Canvas.Fill.Kind := TBrushKind.Gradient;
  Canvas.Fill.Gradient.Style := TGradientStyle.Linear;
  Canvas.Fill.Gradient.Points.Clear;
  GradientPointObj := TGradientPoint(Canvas.Fill.Gradient.Points.Add);
  GradientPointObj.Color := TAlphaColor($FFF40404);
  GradientPointObj := TGradientPoint(Canvas.Fill.Gradient.Points.Add);
  GradientPointObj.Color := TAlphaColor($FF364CD5);
  Canvas.Fill.Gradient.Points[0].Offset := 0.000000;
  Canvas.Fill.Gradient.Points[1].Offset := 1.000000;
  Canvas.FillPath(ShapeObjectRectangleBigPath, 1.0);

  // Shape Stroke
  Canvas.StrokeThickness := 9;
  Canvas.Stroke.Color := TAlphaColor($FF000000);
  Canvas.Stroke.Kind := TBrushKind.Solid;
  Canvas.DrawPath(ShapeObjectRectangleBigPath, 1.0);


  // Restore initial state
  Canvas.RestoreState(CanvasState);
  Canvas.SetMatrix(SavedMatrix);
  ShapeObjectRectangleBigPath.Free;

End;

//
// ShapeObjectRectangleSmall
//
procedure TArtboardFireLogo.DrawShapeObjectRectangleSmall(Canvas: TCanvas);
var
  ShapeObjectRectangleSmallPath : TPathData;
  CanvasState: TCanvasSaveState;
  SavedMatrix: TMatrix;
  GradientPointObj: TGradientPoint;
begin
  // Shape Path
  ShapeObjectRectangleSmallPath := TPathData.Create;
  ShapeObjectRectangleSmallPath.MoveTo(PointF(0, 21.99062));
  ShapeObjectRectangleSmallPath.CurveTo(PointF(0, 9.845536), PointF(9.847359, 0), PointF(22.00833, 0));
  ShapeObjectRectangleSmallPath.LineTo(PointF(383.99167, 0));
  ShapeObjectRectangleSmallPath.CurveTo(PointF(396.146535, 0), PointF(406, 9.843777), PointF(406, 21.99062));
  ShapeObjectRectangleSmallPath.LineTo(PointF(406, 159.00938));
  ShapeObjectRectangleSmallPath.CurveTo(PointF(406, 171.154464), PointF(396.152641, 181), PointF(383.99167, 181));
  ShapeObjectRectangleSmallPath.LineTo(PointF(22.00833, 181));
  ShapeObjectRectangleSmallPath.CurveTo(PointF(9.853465, 181), PointF(0, 171.156223), PointF(0, 159.00938));
  ShapeObjectRectangleSmallPath.LineTo(PointF(0, 21.99062));
  ShapeObjectRectangleSmallPath.ClosePath;

  // Save initial state
  CanvasState := Canvas.SaveState;
  SavedMatrix := Canvas.Matrix;

  Canvas.SetMatrix(TMatrix.CreateTranslation(65, 39) * SavedMatrix);

  // Shape Fill
  Canvas.Fill.Kind := TBrushKind.Gradient;
  Canvas.Fill.Gradient.Style := TGradientStyle.Radial;
  Canvas.Fill.Gradient.Points.Clear;
  GradientPointObj := TGradientPoint(Canvas.Fill.Gradient.Points.Add);
  GradientPointObj.Color := TAlphaColor($FFEEEEEE);
  GradientPointObj := TGradientPoint(Canvas.Fill.Gradient.Points.Add);
  GradientPointObj.Color := TAlphaColor($FFD8D8D8);
  Canvas.Fill.Gradient.Points[0].Offset := 0.000000;
  Canvas.Fill.Gradient.Points[1].Offset := 1.000000;
  Canvas.FillPath(ShapeObjectRectangleSmallPath, 1.0);

  // Shape Stroke
  Canvas.StrokeThickness := 8;
  Canvas.Stroke.Color := TAlphaColor($FF000000);
  Canvas.Stroke.Kind := TBrushKind.Solid;
  Canvas.DrawPath(ShapeObjectRectangleSmallPath, 1.0);


  // Restore initial state
  Canvas.RestoreState(CanvasState);
  Canvas.SetMatrix(SavedMatrix);
  ShapeObjectRectangleSmallPath.Free;

End;

//
// ShapeObjectFMX
//
procedure TArtboardFireLogo.DrawShapeObjectFMX(Canvas: TCanvas);
var
  ShapeObjectFMXPath : TPathData;
  CanvasState: TCanvasSaveState;
  SavedMatrix: TMatrix;
begin
  // Shape Path
  ShapeObjectFMXPath := TPathData.Create;
  ShapeObjectFMXPath.MoveTo(PointF(0, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(0, 0));
  ShapeObjectFMXPath.LineTo(PointF(77.893188, 0));
  ShapeObjectFMXPath.LineTo(PointF(77.893188, 19.221404));
  ShapeObjectFMXPath.LineTo(PointF(22.941675, 19.221404));
  ShapeObjectFMXPath.LineTo(PointF(22.941675, 46.115867));
  ShapeObjectFMXPath.LineTo(PointF(70.375139, 46.115867));
  ShapeObjectFMXPath.LineTo(PointF(70.375139, 65.337271));
  ShapeObjectFMXPath.LineTo(PointF(22.941675, 65.337271));
  ShapeObjectFMXPath.LineTo(PointF(22.941675, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(0, 113.623297));
  ShapeObjectFMXPath.ClosePath;
  ShapeObjectFMXPath.MoveTo(PointF(0, 113.623297));
  ShapeObjectFMXPath.MoveTo(PointF(96.494546, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(96.494546, 0));
  ShapeObjectFMXPath.LineTo(PointF(130.829553, 0));
  ShapeObjectFMXPath.LineTo(PointF(151.446058, 77.505659));
  ShapeObjectFMXPath.LineTo(PointF(171.830047, 0));
  ShapeObjectFMXPath.LineTo(PointF(206.242559, 0));
  ShapeObjectFMXPath.LineTo(PointF(206.242559, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(184.928503, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(184.928503, 24.181766));
  ShapeObjectFMXPath.LineTo(PointF(162.374356, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(140.285243, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(117.808602, 24.181766));
  ShapeObjectFMXPath.LineTo(PointF(117.808602, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(96.494546, 113.623297));
  ShapeObjectFMXPath.ClosePath;
  ShapeObjectFMXPath.MoveTo(PointF(96.494546, 113.623297));
  ShapeObjectFMXPath.MoveTo(PointF(217.48088, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(256.311215, 54.331467));
  ShapeObjectFMXPath.LineTo(PointF(221.123646, 0));
  ShapeObjectFMXPath.LineTo(PointF(247.940604, 0));
  ShapeObjectFMXPath.LineTo(PointF(270.727268, 36.505166));
  ShapeObjectFMXPath.LineTo(PointF(293.048898, 0));
  ShapeObjectFMXPath.LineTo(PointF(319.633339, 0));
  ShapeObjectFMXPath.LineTo(PointF(284.290758, 55.184029));
  ShapeObjectFMXPath.LineTo(PointF(323.121094, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(295.451573, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(270.262234, 74.327927));
  ShapeObjectFMXPath.LineTo(PointF(244.995389, 113.623297));
  ShapeObjectFMXPath.LineTo(PointF(217.48088, 113.623297));
  ShapeObjectFMXPath.ClosePath;

  // Save initial state
  CanvasState := Canvas.SaveState;
  SavedMatrix := Canvas.Matrix;

  Canvas.SetMatrix(TMatrix.CreateTranslation(106, 73) * SavedMatrix);

  // Shape Fill
  Canvas.Fill := FMXLettersFill;
  Canvas.FillPath(ShapeObjectFMXPath, 1.0);

  // Shape Stroke
  Canvas.StrokeThickness := 3;
  Canvas.StrokeJoin := TStrokeJoin.Round;
  Canvas.StrokeCap := TStrokeCap.Round;
  Canvas.Stroke.Color := TAlphaColor($FF000000);
  Canvas.Stroke.Kind := TBrushKind.Solid;
  Canvas.DrawPath(ShapeObjectFMXPath, 1.0);


  // Restore initial state
  Canvas.RestoreState(CanvasState);
  Canvas.SetMatrix(SavedMatrix);
  ShapeObjectFMXPath.Free;

End;

function TArtboardFireLogo.GenerateArtboardFireLogoBitmap: TBitmap;
begin
  if Assigned(FBitmap) then
    FBitmap.Free;

  // Off-Screen bitmap
  FBitmap := TBitmap.Create(Round(ArtboardFireLogoBitmapWidth), Round(ArtboardFireLogoBitmapHeight));

  // Drawing code
  DrawArtboardFireLogo(FBitmap.Canvas, RectF(0, 0, ArtboardFireLogoBitmapWidth, ArtboardFireLogoBitmapHeight), ArtboardFireLogoFillMode);

  Result := FBitmap;

end;

procedure TArtboardFireLogo.SetArtboardFireLogoFillMode(const Value: TArtboardFireLogoFillMode);
begin
  FArtboardFireLogoFillMode := Value;
end;

procedure TArtboardFireLogo.SetArtboardFireLogoBitmapHeight(const Value: Single);
begin
  FArtboardFireLogoBitmapHeight := Value;
end;

procedure TArtboardFireLogo.SetArtboardFireLogoBitmapWidth(const Value: Single);
begin
  FArtboardFireLogoBitmapWidth := Value;
end;

procedure TArtboardFireLogo.SetOpacity(const Value: Single);
begin
  FOpacity := Value;

  if FOpacity < 0 then
    FOpacity := 0;
  if FOpacity > 1.0 then
    FOpacity := 1.0;

end;

//
// Resizing logic for ArtboardFireLogo
//
function TArtboardFireLogo.GetNewArtboardSize(FillMode: TArtboardFireLogoFillMode; SourceRect, TargetRect: TRectF): TRectF;
var
  Scales: TSizeF;
  SizeZero: TSizeF;
  RectZero: TRectF;
  NewLeft: Single;
  NewTop: Single;
  NewWidth: Single;
  NewHeight: Single;
begin
  RectZero := RectF(0, 0, 0, 0);
  SizeZero.cx := 0;
  SizeZero.cy := 0;

  if (SourceRect.EqualsTo(TargetRect)) or (TargetRect.EqualsTo(RectZero)) Then
  begin
    Result := SourceRect;
  end
  else
  begin
    Scales := SizeZero;
    Scales.Width := Abs(TargetRect.Width / SourceRect.Width);
    Scales.Height := Abs(TargetRect.Height / SourceRect.Height);

    if FillMode = TArtboardFireLogoFillMode.ArtboardFireLogoFit then
    begin
      Scales.Width := Min(Scales.Width, Scales.Height);
      Scales.Height := Scales.Width;
    end
    else if FillMode = TArtboardFireLogoFillMode.ArtboardFireLogoFill then
    begin
      Scales.Width := Max(Scales.Width, Scales.Height);
      Scales.Height := Scales.Width;
    end
    else if FillMode = TArtboardFireLogoFillMode.ArtboardFireLogoOriginal then
    begin
      Scales.Width := 1;
      Scales.Height := 1;
    end;

    if SourceRect.Width < 0 Then
    begin
      SourceRect.Left := SourceRect.Left + SourceRect.Width;
      SourceRect.Width := Abs(SourceRect.Width);
    end;
    if SourceRect.Height < 0 Then
    begin
      SourceRect.Top := SourceRect.Top + SourceRect.Height;
      SourceRect.Height := Abs(SourceRect.Height);
    end;

    NewWidth  := SourceRect.Width * Scales.Width;
    NewHeight := SourceRect.Height * Scales.Height;
    NewLeft   := TargetRect.Left + (TargetRect.Width - NewWidth) / 2;
    NewTop    := TargetRect.Top + (TargetRect.Height - NewHeight) / 2;
    Result := RectF(NewLeft, NewTop, NewLeft + NewWidth, NewTop + NewHeight);
  end;
end;

end.

