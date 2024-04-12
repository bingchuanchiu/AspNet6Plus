import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAssignedCellCarriersComponent } from './user-assigned-cell-carriers.component';

describe('UserAssignedCellCarriersComponent', () => {
  let component: UserAssignedCellCarriersComponent;
  let fixture: ComponentFixture<UserAssignedCellCarriersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAssignedCellCarriersComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserAssignedCellCarriersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
