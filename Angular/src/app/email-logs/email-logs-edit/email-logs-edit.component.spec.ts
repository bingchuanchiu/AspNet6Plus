import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmailLogsEditComponent } from './email-logs-edit.component';

describe('EmailLogsEditComponent', () => {
  let component: EmailLogsEditComponent;
  let fixture: ComponentFixture<EmailLogsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmailLogsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EmailLogsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
