import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OuassignedRolesEditComponent } from './ou-assigned-roles-edit.component';

describe('OuassignedRolesEditComponent', () => {
  let component: OuassignedRolesEditComponent;
  let fixture: ComponentFixture<OuassignedRolesEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OuassignedRolesEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OuassignedRolesEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
