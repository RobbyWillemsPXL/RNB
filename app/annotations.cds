using { todoListAppSrv } from '../srv/service.cds';

annotate todoListAppSrv.Tasks with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate todoListAppSrv.Tasks with @UI.DataPoint #status: {
  Value: status_code,
  Title: 'Status',
  Criticality: status.criticality,
};
annotate todoListAppSrv.Tasks with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title', ID: 'Title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' }
];
annotate todoListAppSrv.Tasks with @UI.HeaderInfo: {
  TypeName: 'Task',
  TypeNamePlural: 'Tasks',
  Title: { Value: taskID }
};
annotate todoListAppSrv.Tasks with {
  ID @UI.Hidden
};
annotate todoListAppSrv.Tasks with @UI.Identification: [{ Value: taskID }];
annotate todoListAppSrv.Tasks with {
  taskID @Common.Label: 'Task ID';
  title @Common.Label: 'Title';
  description @Common.Label: 'Description';
  dueDate @Common.Label: 'Due Date';
  status @Common.Label: 'Status';
  Subtasks @Common.Label: 'Subtasks'
};
annotate todoListAppSrv.Tasks with {
  ID @Common.Text: { $value: taskID, ![@UI.TextArrangement]: #TextOnly };
  status @Common.Text : { $value: status.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate todoListAppSrv.Tasks with {
  status @Common.ValueListWithFixedValues;
};
annotate todoListAppSrv.Tasks with @UI.SelectionFields : [
 taskID,
 title,
 dueDate,
 status_code
];
annotate todoListAppSrv.Tasks with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: taskID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: dueDate },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality }
];
annotate todoListAppSrv.Tasks with @UI.FieldGroup #taskDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: taskID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: dueDate },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality }

  ]
};


annotate todoListAppSrv.Subtasks with @UI.LineItem #subtasks: [
    { $Type: 'UI.DataField', Value: subtaskID },
    { $Type: 'UI.DataField', Value: taskID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality }

  ];


annotate todoListAppSrv.Tasks with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'mainTab',
    Label: 'Main',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'taskDetails', Label: 'Task Details', Target: '@UI.FieldGroup#taskDetails' },
      { $Type: 'UI.ReferenceFacet', ID: 'subtasks', Label: 'Subtasks', Target: 'Subtasks/@UI.LineItem#subtasks' } ]
  }
];
annotate todoListAppSrv.Subtasks with {
  tasks @Common.ValueList: {
    CollectionPath: 'Tasks',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: tasks_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'taskID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dueDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate todoListAppSrv.Subtasks with @UI.DataPoint #taskID: {
  Value: taskID,
  Title: 'Task ID',
};
annotate todoListAppSrv.Subtasks with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate todoListAppSrv.Subtasks with @UI.DataPoint #status: {
  Value: status_code,
  Title: 'Status',
  Criticality: status.criticality,
};
annotate todoListAppSrv.Subtasks with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#taskID', ID: 'TaskID' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title', ID: 'Title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' }
];
annotate todoListAppSrv.Subtasks with @UI.HeaderInfo: {
  TypeName: 'Subtask',
  TypeNamePlural: 'Subtasks',
  Title: { Value: subtaskID }
};
annotate todoListAppSrv.Subtasks with {
  ID @UI.Hidden
};
annotate todoListAppSrv.Subtasks with @UI.Identification: [{ Value: subtaskID }];
annotate todoListAppSrv.Subtasks with {
  subtaskID @Common.Label: 'Subtask ID';
  taskID @Common.Label: 'Task ID';
  title @Common.Label: 'Title';
  description @Common.Label: 'Description';
  status @Common.Label: 'Status';
  tasks @Common.Label: 'Task'
};
annotate todoListAppSrv.Subtasks with {
  ID @Common.Text: { $value: subtaskID, ![@UI.TextArrangement]: #TextOnly };
  tasks @Common.Text: { $value: tasks.taskID, ![@UI.TextArrangement]: #TextOnly };
  status @Common.Text : { $value: status.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate todoListAppSrv.Subtasks with {
  status @Common.ValueListWithFixedValues;
};
annotate todoListAppSrv.Subtasks with @UI.SelectionFields: [
  tasks_ID,
  status_code
];
annotate todoListAppSrv.Subtasks with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: subtaskID },
    { $Type: 'UI.DataField', Value: taskID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Label: 'Task', Value: tasks_ID }
];
annotate todoListAppSrv.Subtasks with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: subtaskID },
    { $Type: 'UI.DataField', Value: taskID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Label: 'Task', Value: tasks_ID }
]};
annotate todoListAppSrv.Subtasks with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];