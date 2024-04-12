import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupAssignedRolesEditComponent } from './group-assigned-roles-edit.component';

describe('GroupAssignedRolesEditComponent', () => {
  let component: GroupAssignedRolesEditComponent;
  let fixture: ComponentFixture<GroupAssignedRolesEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GroupAssignedRolesEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GroupAssignedRolesEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
