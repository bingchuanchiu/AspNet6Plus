import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserLogsEditComponent } from './user-logs-edit.component';

describe('UserLogsEditComponent', () => {
  let component: UserLogsEditComponent;
  let fixture: ComponentFixture<UserLogsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserLogsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserLogsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
