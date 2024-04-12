import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserTypesEditComponent } from './user-types-edit.component';

describe('UserTypesEditComponent', () => {
  let component: UserTypesEditComponent;
  let fixture: ComponentFixture<UserTypesEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserTypesEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserTypesEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
