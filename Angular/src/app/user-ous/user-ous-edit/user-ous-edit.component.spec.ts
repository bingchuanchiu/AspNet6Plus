import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserOusEditComponent } from './user-ous-edit.component';

describe('UserOusEditComponent', () => {
  let component: UserOusEditComponent;
  let fixture: ComponentFixture<UserOusEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserOusEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserOusEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
