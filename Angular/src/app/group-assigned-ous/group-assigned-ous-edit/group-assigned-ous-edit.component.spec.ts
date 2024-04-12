import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupAssignedOusEditComponent } from './group-assigned-ous-edit.component';

describe('GroupAssignedOusEditComponent', () => {
  let component: GroupAssignedOusEditComponent;
  let fixture: ComponentFixture<GroupAssignedOusEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GroupAssignedOusEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GroupAssignedOusEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
