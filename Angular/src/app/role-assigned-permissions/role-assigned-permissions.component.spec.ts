import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RoleAssignedPermissionsComponent } from './role-assigned-permissions.component';

describe('RoleAssignedPermissionsComponent', () => {
  let component: RoleAssignedPermissionsComponent;
  let fixture: ComponentFixture<RoleAssignedPermissionsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RoleAssignedPermissionsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RoleAssignedPermissionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
