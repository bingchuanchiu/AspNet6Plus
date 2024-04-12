import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { UserLogsComponent } from './user-logs/user-logs.component';
import { UserLogsEditComponent } from './user-logs/user-logs-edit/user-logs-edit.component';
import { DBLogsComponent } from './db-logs/db-logs.component';
import { DblogsEditComponent } from './db-logs/db-logs-edit/db-logs-edit.component';
import { ExceptionLogsComponent } from './exception-logs/exception-logs.component';
import { ExceptionLogsEditComponent } from './exception-logs/exception-logs-edit/exception-logs-edit.component';
import { EmailLogsComponent } from './email-logs/email-logs.component';
import { EmailLogsEditComponent } from './email-logs/email-logs-edit/email-logs-edit.component';

import { PermissionsComponent } from './permissions/permissions.component';
import { PermissionsEditComponent } from './permissions/permissions-edit/permissions-edit.component';
import { RoleAssignedPermissionsComponent} from './role-assigned-permissions/role-assigned-permissions.component';
import { RoleAssignedPermissionsEditComponent } from './role-assigned-permissions/role-assigned-permissions-edit/role-assigned-permissions-edit.component';
import { RolesComponent } from './roles/roles.component';
import { RolesEditComponent } from './roles/roles-edit/roles-edit.component';
import { UserAssignedRolesComponent } from './user-assigned-roles/user-assigned-roles.component';
import { UserAssignedRolesEditComponent } from './user-assigned-roles/user-assigned-roles-edit/user-assigned-roles-edit.component';
import { GroupAssignedRolesComponent } from './group-assigned-roles/group-assigned-roles.component';
import { GroupAssignedRolesEditComponent } from './group-assigned-roles/group-assigned-roles-edit/group-assigned-roles-edit.component';
import { GroupsComponent } from './groups/groups.component';
import { GroupsEditComponent } from './groups/groups-edit/groups-edit.component';
import { UserAssignedGroupsComponent } from './user-assigned-groups/user-assigned-groups.component';
import { UserAssignedGroupsEditComponent } from './user-assigned-groups/user-assigned-groups-edit/user-assigned-groups-edit.component';

import { UsersComponent } from './users/users.component';
import { UsersEditComponent } from './users/users-edit/users-edit.component';



import { DashboardComponent } from './dashboard/dashboard.component';
import { LoggingDashboardComponent } from './logging-dashboard/logging-dashboard.component';
import { AuthorizationDashboardComponent } from './authorization-dashboard/authorization-dashboard.component';

import { Temp1Component } from './temp1/temp1.component';
import { Temp2Component } from './temp2/temp2.component';

const routes: Routes = [  
  { path: '', redirectTo: 'Dashboard', pathMatch: 'full'},
  { path: 'LoggingDashboard', component: LoggingDashboardComponent},
  { path: 'DBLogs', component: DBLogsComponent },
  { path: 'UserLogs', component: UserLogsComponent },
  { path: 'ExceptionLogs', component: ExceptionLogsComponent },
  { path: 'EmailLogs', component: EmailLogsComponent },
  { path: 'DBLogsEdit', component: DblogsEditComponent },
  { path: 'UserLogsEdit', component: UserLogsEditComponent },
  { path: 'ExceptionLogsEdit', component: ExceptionLogsEditComponent },
  { path: 'EmailLogsEdit', component: EmailLogsEditComponent },

  { path: 'AuthorizationDashboard', component: AuthorizationDashboardComponent},
  { path: 'Permissions', component: PermissionsComponent },
  { path: 'PermissionsEdit', component: PermissionsEditComponent },
  { path: 'RoleAssignedPermissions', component: RoleAssignedPermissionsComponent},
  { path: 'RoleAssignedPermissionsEdit', component: RoleAssignedPermissionsEditComponent},
  { path: 'Roles', component: RolesComponent},
  { path: 'RolesEdit', component: RolesEditComponent},
  { path: 'UserAssignedRoles', component: UserAssignedRolesComponent},
  { path: 'UserAssignedRolesEdit', component: UserAssignedRolesEditComponent},
  { path: 'GroupAssignedRoles', component: GroupAssignedRolesComponent},
  { path: 'GroupAssignedRolesEdit', component: GroupAssignedRolesEditComponent},
  { path: 'Groups', component: GroupsComponent},
  { path: 'GroupsEdit', component: GroupsEditComponent},
  { path: 'UserAssignedGroups', component: UserAssignedGroupsComponent},
  { path: 'UserAssignedGroupsEdit', component: UserAssignedGroupsEditComponent},

  { path: 'Dashboard', component: DashboardComponent},
  { path: 'Users', component: UsersComponent },
  { path: 'UsersEdit', component: UsersEditComponent },

  { path: 'Temp1', component: Temp1Component },
  { path: 'Temp2', component: Temp2Component },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)], 
  exports: [RouterModule]
})
export class AppRoutingModule { }
