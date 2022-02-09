unit PythonTools.Model.FormProducer;

interface

uses
  System.Classes, System.Rtti, PythonTools.Common;

type
  TFormProducerModel = class
  private type
    TModuleInitialization = class
    private
      FGenerateInitialization: boolean;
      FTitle: string;
    public
      /// <summary>
      ///   Generate the Python module app GUI initialization section
      /// </summary>
      property GenerateInitialization: boolean read FGenerateInitialization write FGenerateInitialization;
      /// <summary>
      ///   The GUI application title
      /// </summary>
      property Title: string read FTitle write FTitle;
    end;
  private
    FClassName: string;
    FFormParentName: string;
    FFileName: string;
    FDirectory: string;
    FExportedComponents: TExportedComponents;
    FModelInitialization: TModuleInitialization;
    FExportedEvents: TExportedEvents;
  public
    constructor Create();
    destructor Destroy(); override;
    /// <summary>
    ///   The Form name: used to generate the Python class name
    /// </summary>
    property FormName: string read FClassName write FClassName;
    /// <summary>
    ///   The Form parent class name: used to the Form inheritance chain
    /// </summary>
    property FormParentName: string read FFormParentName write FFormParentName;
    /// <summary>
    ///   The Unit name: used to generate the Python (.py) file name
    /// </summary>
    property FileName: string read FFileName write FFileName;
    /// <summary>
    ///   The directory where the generated files will be saved
    /// </summary>
    property Directory: string read FDirectory write FDirectory;
    /// <summary>
    ///   List of exported components
    /// </summary>
    property ExportedComponents: TExportedComponents read FExportedComponents write FExportedComponents;
    /// <summary>
    ///   List of exported events
    /// </summary>
    property ExportedEvents: TExportedEvents read FExportedEvents write FExportedEvents;
    /// <summary>
    ///   Generates the model initialization section
    /// </summary>
    property ModelInitialization: TModuleInitialization read FModelInitialization;
  end;

implementation

{ TFormProducerModel }

constructor TFormProducerModel.Create;
begin
  FModelInitialization := TModuleInitialization.Create();
end;

destructor TFormProducerModel.Destroy;
begin
  FModelInitialization.Free();
  inherited;
end;

end.
