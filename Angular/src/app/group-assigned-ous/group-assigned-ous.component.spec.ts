import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupAssignedOusComponent } from './group-assigned-ous.component';

describe('GroupAssignedOusComponent', () => {
  let component: GroupAssignedOusComponent;
  let fixture: ComponentFixture<GroupAssignedOusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GroupAssignedOusComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GroupAssignedOusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
