using { todoListApp } from '../db/schema.cds';

service todoListAppSrv {
  @odata.draft.enabled
  entity Tasks as projection on todoListApp.Tasks;
  entity Subtasks as projection on todoListApp.Subtasks;
}