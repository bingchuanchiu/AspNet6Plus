import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OUAssignedRolesComponent } from './ouassigned-roles.component';

describe('OUAssignedRolesComponent', () => {
  let component: OUAssignedRolesComponent;
  let fixture: ComponentFixture<OUAssignedRolesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OUAssignedRolesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OUAssignedRolesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
