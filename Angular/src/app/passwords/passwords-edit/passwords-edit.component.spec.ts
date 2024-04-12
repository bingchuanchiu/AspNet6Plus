import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PasswordsEditComponent } from './passwords-edit.component';

describe('PasswordsEditComponent', () => {
  let component: PasswordsEditComponent;
  let fixture: ComponentFixture<PasswordsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PasswordsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PasswordsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
