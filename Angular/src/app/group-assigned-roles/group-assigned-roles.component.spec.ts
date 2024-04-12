import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupAssignedRolesComponent } from './group-assigned-roles.component';

describe('GroupAssignedRolesComponent', () => {
  let component: GroupAssignedRolesComponent;
  let fixture: ComponentFixture<GroupAssignedRolesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GroupAssignedRolesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GroupAssignedRolesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
