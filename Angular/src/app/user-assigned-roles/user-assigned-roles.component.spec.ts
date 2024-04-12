import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAssignedRolesComponent } from './user-assigned-roles.component';

describe('UserAssignedRolesComponent', () => {
  let component: UserAssignedRolesComponent;
  let fixture: ComponentFixture<UserAssignedRolesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAssignedRolesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserAssignedRolesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
