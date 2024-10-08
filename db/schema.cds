using { sap.common.CodeList } from '@sap/cds/common';

namespace todoListApp;

entity TasksStatusCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
  criticality : Integer;
}

entity SubtasksStatusCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
  criticality : Integer;
}

entity Tasks {
  key ID: UUID;
  taskID: String(50) @assert.unique @mandatory;
  title: String(100);
  description: String(255);
  dueDate: Date;
  status: Association to TasksStatusCodeList;
  Subtasks: Association to many Subtasks on Subtasks.tasks = $self;
}

entity Subtasks {
  key ID: UUID;
  subtaskID: String(50) @assert.unique @mandatory;
  taskID: String(50);
  title: String(100);
  description: String(255);
  status: Association to SubtasksStatusCodeList;
  tasks: Association to Tasks;
}
