import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAssignedCellCarriersEditComponent } from './user-assigned-cell-carriers-edit.component';

describe('UserAssignedCellCarriersEditComponent', () => {
  let component: UserAssignedCellCarriersEditComponent;
  let fixture: ComponentFixture<UserAssignedCellCarriersEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAssignedCellCarriersEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserAssignedCellCarriersEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
