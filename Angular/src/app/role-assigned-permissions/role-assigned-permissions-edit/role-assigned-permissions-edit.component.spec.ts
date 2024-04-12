import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RoleAssignedPermissionsEditComponent } from './role-assigned-permissions-edit.component';

describe('RoleAssignedPermissionsEditComponent', () => {
  let component: RoleAssignedPermissionsEditComponent;
  let fixture: ComponentFixture<RoleAssignedPermissionsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RoleAssignedPermissionsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RoleAssignedPermissionsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
