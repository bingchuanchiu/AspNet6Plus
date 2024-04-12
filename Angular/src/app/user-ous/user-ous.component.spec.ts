import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserOusComponent } from './user-ous.component';

describe('UserOusComponent', () => {
  let component: UserOusComponent;
  let fixture: ComponentFixture<UserOusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserOusComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserOusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
