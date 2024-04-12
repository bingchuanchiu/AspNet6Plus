import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAssignedGroupsComponent } from './user-assigned-groups.component';

describe('UserAssignedGroupsComponent', () => {
  let component: UserAssignedGroupsComponent;
  let fixture: ComponentFixture<UserAssignedGroupsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAssignedGroupsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserAssignedGroupsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
