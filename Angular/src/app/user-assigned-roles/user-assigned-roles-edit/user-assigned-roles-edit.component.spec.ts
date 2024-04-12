import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAssignedRolesEditComponent } from './user-assigned-roles-edit.component';

describe('UserAssignedRolesEditComponent', () => {
  let component: UserAssignedRolesEditComponent;
  let fixture: ComponentFixture<UserAssignedRolesEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAssignedRolesEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserAssignedRolesEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
