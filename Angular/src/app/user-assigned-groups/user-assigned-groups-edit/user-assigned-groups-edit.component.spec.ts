import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAssignedGroupsEditComponent } from './user-assigned-groups-edit.component';

describe('UserAssignedGroupsEditComponent', () => {
  let component: UserAssignedGroupsEditComponent;
  let fixture: ComponentFixture<UserAssignedGroupsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAssignedGroupsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserAssignedGroupsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
