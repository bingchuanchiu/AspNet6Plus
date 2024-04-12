import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExceptionLogsEditComponent } from './exception-logs-edit.component';

describe('ExceptionLogsEditComponent', () => {
  let component: ExceptionLogsEditComponent;
  let fixture: ComponentFixture<ExceptionLogsEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExceptionLogsEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExceptionLogsEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
