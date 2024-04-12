// CORE MODULES AND COMPONENTS

import { NgModule } from '@angular/core';
import { DatePipe } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DataTablesModule } from 'angular-datatables';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

// ADD MODULES AND COMPONENTS
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatRadioModule } from '@angular/material/radio';
import { MatSelectModule } from '@angular/material/select';
import { MatSliderModule } from '@angular/material/slider';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatMenuModule } from '@angular/material/menu';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatCardModule } from '@angular/material/card';
import { MatStepperModule } from '@angular/material/stepper';
import { MatTabsModule } from '@angular/material/tabs';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatButtonToggleModule } from '@angular/material/button-toggle';
import { MatChipsModule } from '@angular/material/chips';
import { MatIconModule } from '@angular/material/icon';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatDialogModule } from '@angular/material/dialog';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { MatPaginatorModule } from '@angular/material/paginator';

// ADD SERVICES
import { DataService } from './services/data.service';
import { CellCarriersComponent } from './cell-carriers/cell-carriers.component';
import { DBLogsComponent } from './db-logs/db-logs.component';
import { EmailLogsComponent } from './email-logs/email-logs.component';
import { ExceptionLogsComponent } from './exception-logs/exception-logs.component';
import { GroupsComponent } from './groups/groups.component';
import { GroupAssignedOusComponent } from './group-assigned-ous/group-assigned-ous.component';
import { GroupAssignedRolesComponent } from './group-assigned-roles/group-assigned-roles.component';
import { OusComponent } from './ous/ous.component';
import { OUAssignedRolesComponent } from './ou-assigned-roles/ou-assigned-roles.component';
import { PasswordsComponent } from './passwords/passwords.component';
import { PermissionsComponent } from './permissions/permissions.component';
import { PermissionsEditComponent } from './permissions/permissions-edit/permissions-edit.component';
import { PlantsComponent } from './plants/plants.component';
import { PlantAreasComponent } from './plant-areas/plant-areas.component';
import { RolesComponent } from './roles/roles.component';
import { RoleAssignedPermissionsComponent } from './role-assigned-permissions/role-assigned-permissions.component';
import { SettingsComponent } from './settings/settings.component';
import { UsersComponent } from './users/users.component';
import { UserAssignedCellCarriersComponent } from './user-assigned-cell-carriers/user-assigned-cell-carriers.component';
import { UserAssignedGroupsComponent } from './user-assigned-groups/user-assigned-groups.component';
import { UserAssignedRolesComponent } from './user-assigned-roles/user-assigned-roles.component';
import { UserLogsComponent } from './user-logs/user-logs.component';
import { UserOusComponent } from './user-ous/user-ous.component';
import { UserTypesComponent } from './user-types/user-types.component';
import { CellCarriersEditComponent } from './cell-carriers/cell-carriers-edit/cell-carriers-edit.component';
import { DblogsEditComponent } from './db-logs/db-logs-edit/db-logs-edit.component';
import { EmailLogsEditComponent } from './email-logs/email-logs-edit/email-logs-edit.component';
import { ExceptionLogsEditComponent } from './exception-logs/exception-logs-edit/exception-logs-edit.component';
import { GroupAssignedOusEditComponent } from './group-assigned-ous/group-assigned-ous-edit/group-assigned-ous-edit.component';
import { GroupAssignedRolesEditComponent } from './group-assigned-roles/group-assigned-roles-edit/group-assigned-roles-edit.component';
import { GroupsEditComponent } from './groups/groups-edit/groups-edit.component';
import { OuassignedRolesEditComponent } from './ou-assigned-roles/ou-assigned-roles-edit/ou-assigned-roles-edit.component';
import { OusEditComponent } from './ous/ous-edit/ous-edit.component';
import { PasswordsEditComponent } from './passwords/passwords-edit/passwords-edit.component';
import { PlantAreasEditComponent } from './plant-areas/plant-areas-edit/plant-areas-edit.component';
import { PlantsEditComponent } from './plants/plants-edit/plants-edit.component';
import { RoleAssignedPermissionsEditComponent } from './role-assigned-permissions/role-assigned-permissions-edit/role-assigned-permissions-edit.component';
import { RolesEditComponent } from './roles/roles-edit/roles-edit.component';
import { SettingsEditComponent } from './settings/settings-edit/settings-edit.component';
import { UserAssignedCellCarriersEditComponent } from './user-assigned-cell-carriers/user-assigned-cell-carriers-edit/user-assigned-cell-carriers-edit.component';
import { UserAssignedGroupsEditComponent } from './user-assigned-groups/user-assigned-groups-edit/user-assigned-groups-edit.component';
import { UserAssignedRolesEditComponent } from './user-assigned-roles/user-assigned-roles-edit/user-assigned-roles-edit.component';
import { UserLogsEditComponent } from './user-logs/user-logs-edit/user-logs-edit.component';
import { UserOusEditComponent } from './user-ous/user-ous-edit/user-ous-edit.component';
import { UserTypesEditComponent } from './user-types/user-types-edit/user-types-edit.component';
import { UsersEditComponent } from './users/users-edit/users-edit.component';
import { DashboardComponent } from './dashboard/dashboard.component';

import { NavComponent } from './nav/nav.component';
import {TopbarComponent} from './nav/topbar/topbar.component';
import {SidebarComponent} from './nav/sidebar/sidebar.component';
import {ProfilenavComponent} from './nav/profilenav/profilenav.component';
import { CurrentUserComponent } from './nav/current-user/current-user.component';

import { Temp1Component } from './temp1/temp1.component';
import { Temp2Component } from './temp2/temp2.component';
import { LoggingDashboardComponent } from './logging-dashboard/logging-dashboard.component';
import { AuthorizationDashboardComponent } from './authorization-dashboard/authorization-dashboard.component';


@NgModule({
declarations: [								
AppComponent,
CellCarriersComponent,
DBLogsComponent,
EmailLogsComponent,
ExceptionLogsComponent,
GroupsComponent,
GroupAssignedOusComponent,
GroupAssignedRolesComponent,
OusComponent,
OUAssignedRolesComponent,
PasswordsComponent,
PermissionsComponent,
PermissionsEditComponent,
PlantsComponent,
PlantAreasComponent,
RolesComponent,
RoleAssignedPermissionsComponent,
SettingsComponent,
UsersComponent,
UserAssignedCellCarriersComponent,
UserAssignedGroupsComponent,
UserAssignedRolesComponent,
UserLogsComponent,
UserOusComponent,
UserTypesComponent,
CellCarriersEditComponent,
DblogsEditComponent,
EmailLogsEditComponent,
ExceptionLogsEditComponent,
GroupAssignedOusEditComponent,
GroupAssignedRolesEditComponent,
GroupsEditComponent,
OuassignedRolesEditComponent,
OusEditComponent,
PasswordsEditComponent,
PlantAreasEditComponent,
PlantsEditComponent,
RoleAssignedPermissionsEditComponent,
RolesEditComponent,
SettingsEditComponent,
UserAssignedCellCarriersEditComponent,
UserAssignedGroupsEditComponent,
UserAssignedRolesEditComponent,
UserLogsEditComponent,
UserOusEditComponent,
UserTypesEditComponent,
UsersEditComponent,
      Temp1Component,
      Temp1Component,
      Temp2Component,
      DashboardComponent,
      NavComponent,
      TopbarComponent,
      SidebarComponent,
      ProfilenavComponent,
      LoggingDashboardComponent,
      AuthorizationDashboardComponent
   ],
imports: [
HttpClientModule,
BrowserModule,
AppRoutingModule,
DataTablesModule,
FormsModule,
ReactiveFormsModule,
MatButtonModule,
MatInputModule,
MatAutocompleteModule,
MatCheckboxModule,
MatDatepickerModule,
MatFormFieldModule,
MatRadioModule,
MatSelectModule,
MatSliderModule,
MatSlideToggleModule,
MatMenuModule,
MatSidenavModule,
MatToolbarModule,
MatListModule,
MatGridListModule,
MatCardModule,
MatStepperModule,
MatTabsModule,
MatExpansionModule,
MatButtonToggleModule,
MatChipsModule,
MatIconModule,
MatProgressSpinnerModule,
MatProgressBarModule,
MatDialogModule,
MatTooltipModule,
MatSnackBarModule,
MatTableModule,
MatSortModule,
MatPaginatorModule,
],
providers: [DataService,DatePipe],
bootstrap: [AppComponent, SidebarComponent, TopbarComponent, ProfilenavComponent, CurrentUserComponent]
})
export class AppModule { }
